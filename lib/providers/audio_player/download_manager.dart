import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rhttp/rhttp.dart' as rhttp;
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/database/database.dart';
import 'package:toneharbor/providers/audio_player/cache_lock_manager.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/metadata_utils.dart';

part 'download_manager.g.dart';

enum DownloadStatus { queued, downloading, paused, completed, failed, canceled }

enum DownloadType { normal, preload }

class DownloadTask {
  final ToneHarborTrackObject track;
  final DownloadStatus status;
  final DownloadType type;
  final rhttp.CancelToken cancelToken;
  final int? totalSizeBytes;
  final int downloadedBytes;
  final int retryCount;
  final String? savePath;
  final StreamController<int> _downloadedBytesStreamController;
  final StreamController<double> _downloadSpeedStreamController;

  Stream<int> get downloadedBytesStream =>
      _downloadedBytesStreamController.stream;

  Stream<double> get downloadSpeedStream =>
      _downloadSpeedStreamController.stream;

  double get progressPercentage {
    if (totalSizeBytes == null || totalSizeBytes == 0) return 0;
    return downloadedBytes / totalSizeBytes!;
  }

  DownloadTask({
    required this.track,
    required this.status,
    required this.type,
    required this.cancelToken,
    this.totalSizeBytes,
    this.downloadedBytes = 0,
    this.retryCount = 0,
    this.savePath,
    StreamController<int>? downloadedBytesStreamController,
    StreamController<double>? downloadSpeedStreamController,
  }) : _downloadedBytesStreamController =
           downloadedBytesStreamController ?? StreamController.broadcast(),
       _downloadSpeedStreamController =
           downloadSpeedStreamController ?? StreamController.broadcast();

  DownloadTask copyWith({
    ToneHarborTrackObject? track,
    DownloadStatus? status,
    DownloadType? type,
    rhttp.CancelToken? cancelToken,
    int? totalSizeBytes,
    int? downloadedBytes,
    int? retryCount,
    String? savePath,
    StreamController<int>? downloadedBytesStreamController,
    StreamController<double>? downloadSpeedStreamController,
  }) {
    return DownloadTask(
      track: track ?? this.track,
      status: status ?? this.status,
      type: type ?? this.type,
      cancelToken: cancelToken ?? this.cancelToken,
      totalSizeBytes: totalSizeBytes ?? this.totalSizeBytes,
      downloadedBytes: downloadedBytes ?? this.downloadedBytes,
      retryCount: retryCount ?? this.retryCount,
      savePath: savePath ?? this.savePath,
      downloadedBytesStreamController:
          downloadedBytesStreamController ?? _downloadedBytesStreamController,
      downloadSpeedStreamController:
          downloadSpeedStreamController ?? _downloadSpeedStreamController,
    );
  }

  void dispose() {
    _downloadedBytesStreamController.close();
    _downloadSpeedStreamController.close();
  }
}

@keepAlive
class DownloadManager extends _$DownloadManager {
  static const int _maxNormalDownloads = 3;
  static const int _maxPreloadDownloads = 1;
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 2);

  final _completionController =
      StreamController<ToneHarborTrackObject>.broadcast();
  final _pausedTracks = <String>{};
  int _activeNormalDownloads = 0;
  int _activePreloadDownloads = 0;
  bool _isStartingDownloads = false;

  Stream<ToneHarborTrackObject> get completionStream =>
      _completionController.stream;

  @override
  List<DownloadTask> build() {
    CacheLockManager.instance.clearAll();
    ref.onDispose(dispose);
    _restoreTasks();
    return [];
  }

  void dispose() {
    for (final task in state) {
      if (task.status == DownloadStatus.downloading) {
        task.cancelToken.cancel();
      }
      task.dispose();
    }
    CacheLockManager.instance.clearAll();
    _completionController.close();
  }

  Future<void> _restoreTasks() async {
    final db = ref.read(appDatabaseProvider);
    final query = db.select(db.downloadTaskState)
      ..where(
        (t) =>
            t.type.equals(DownloadType.normal.index) &
            t.status.isNotIn([
              DownloadStatus.completed.index,
              DownloadStatus.canceled.index,
            ]),
      );
    final savedTasks = await query.get();

    if (savedTasks.isEmpty) return;

    final restoredTasks = <DownloadTask>[];
    for (final record in savedTasks) {
      final track = ToneHarborTrackObject.full(
        id: record.trackId,
        title: record.trackTitle,
        artist: record.trackArtist,
        album: '',
        externalUri: '',
        duration: Duration.zero,
        filesize: 0,
        bitrate: 0,
        channel: 0,
        codec: '',
        container: record.container,
        frequency: 0,
        rating: 0,
        platform: ToneHarborTrackPlatform.synology,
      );
      final savePath = await getTrackCachePath(track, record.quality);

      final completeFile = File(savePath);
      if (await completeFile.exists()) {
        await _updateTaskStatusInDb(track.id, DownloadStatus.completed);
        continue;
      }

      int actualDownloadedBytes = 0;
      final partFile = File('$savePath.part');
      if (await partFile.exists()) {
        actualDownloadedBytes = await partFile.length();
      }

      final actualStatus = record.status == DownloadStatus.downloading
          ? DownloadStatus.queued
          : record.status;

      final task = DownloadTask(
        track: track,
        status: actualStatus,
        type: record.type,
        cancelToken: rhttp.CancelToken(),
        downloadedBytes: actualDownloadedBytes,
        savePath: savePath,
      );
      restoredTasks.add(task);

      if (record.status == DownloadStatus.downloading) {
        await _updateTaskStatusInDb(track.id, DownloadStatus.queued);
      }
    }

    if (restoredTasks.isNotEmpty) {
      state = restoredTasks;
      final hasQueuedTasks = state.any(
        (task) => task.status == DownloadStatus.queued,
      );
      if (hasQueuedTasks) {
        _startDownloading();
      }
    }
  }

  Future<void> _insertTaskToDb(DownloadTask task) async {
    final db = ref.read(appDatabaseProvider);
    final quality = ref.read(audioQualityProvider);
    await db
        .into(db.downloadTaskState)
        .insert(
          DownloadTaskStateCompanion.insert(
            trackId: task.track.id,
            trackTitle: task.track.title,
            trackArtist: task.track.artist,
            container: task.track.container,
            type: task.type,
            quality: quality,
            status: task.status,
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<void> _insertTasksToDb(List<DownloadTask> tasks) async {
    if (tasks.isEmpty) return;
    final db = ref.read(appDatabaseProvider);
    final quality = ref.read(audioQualityProvider);
    await db.batch((batch) {
      batch.insertAll(
        db.downloadTaskState,
        tasks.map(
          (task) => DownloadTaskStateCompanion.insert(
            trackId: task.track.id,
            trackTitle: task.track.title,
            trackArtist: task.track.artist,
            container: task.track.container,
            type: task.type,
            quality: quality,
            status: task.status,
          ),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<void> _deleteTaskFromDb(String trackId) async {
    final db = ref.read(appDatabaseProvider);
    await (db.delete(
      db.downloadTaskState,
    )..where((tb) => tb.trackId.equals(trackId))).go();
  }

  Future<void> _deleteTasksFromDb(List<String> trackIds) async {
    if (trackIds.isEmpty) return;
    final db = ref.read(appDatabaseProvider);
    await (db.delete(
      db.downloadTaskState,
    )..where((tb) => tb.trackId.isIn(trackIds))).go();
  }

  Future<void> _deletePartFile(String? savePath) async {
    if (savePath == null) return;
    final partialFile = File('$savePath.part');
    if (await partialFile.exists()) {
      try {
        await partialFile.delete();
      } catch (e) {
        logger.w(
          '[DownloadManager] Failed to delete partial file: $savePath.part',
        );
      }
    }
  }

  DownloadTask? getTaskByTrackId(String trackId) {
    return state.firstWhereOrNull((element) => element.track.id == trackId);
  }

  bool isDownloading(String trackId) {
    return state.any(
      (task) =>
          task.track.id == trackId &&
          (task.status == DownloadStatus.downloading ||
              task.status == DownloadStatus.queued ||
              task.status == DownloadStatus.paused),
    );
  }

  Future<void> cancelAllPreloads() async {
    final tasksToCancel = <DownloadTask>[];
    for (final task in state) {
      if (task.type == DownloadType.preload &&
          (task.status == DownloadStatus.downloading ||
              task.status == DownloadStatus.queued ||
              task.status == DownloadStatus.paused)) {
        if (task.status == DownloadStatus.downloading) {
          task.cancelToken.cancel();
        }
        _pausedTracks.remove(task.track.id);
        tasksToCancel.add(task);
      }
    }

    if (tasksToCancel.isNotEmpty) {
      await Future.delayed(const Duration(milliseconds: 100));

      for (final task in tasksToCancel) {
        await _deletePartFile(task.savePath);
        if (task.savePath != null) {
          CacheLockManager.instance.unlock(task.savePath!);
        }
      }

      final trackIdsToCancel = tasksToCancel.map((t) => t.track.id).toList();
      state = state
          .where((e) => !trackIdsToCancel.contains(e.track.id))
          .toList();
      await _deleteTasksFromDb(trackIdsToCancel);
    }
  }

  Future<void> preloadNextTrack(ToneHarborTrackObject track) async {
    if (track is ToneHarborTrackObjectLocal) {
      logger.i('[DownloadManager] Skip local track: ${track.id}');
      return;
    }

    final quality = ref.read(audioQualityProvider);
    final cachePath = await getTrackCachePath(track, quality);

    final existingTask = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (existingTask != null) {
      switch (existingTask.status) {
        case DownloadStatus.downloading:
          logger.i(
            '[DownloadManager] Track is downloading, skip preload: ${track.id}',
          );
          return;

        case DownloadStatus.queued:
          if (existingTask.type == DownloadType.preload) {
            logger.i(
              '[DownloadManager] Already preloading: ${track.id} at ${quality.name}',
            );
            return;
          }
          logger.i(
            '[DownloadManager] Normal task in queue, converting to preload: ${track.id}',
          );
          state = state.where((e) => e.track.id != track.id).toList();

        case DownloadStatus.paused:
          logger.i(
            '[DownloadManager] Track is paused, converting to preload: ${track.id}',
          );
          _pausedTracks.remove(track.id);
          state = state.where((e) => e.track.id != track.id).toList();

        case DownloadStatus.canceled:
        case DownloadStatus.failed:
          logger.i(
            '[DownloadManager] Track failed/canceled, retrying preload: ${track.id}',
          );
          await _deletePartFile(existingTask.savePath);
          state = state.where((e) => e.track.id != track.id).toList();

        case DownloadStatus.completed:
          return;
      }
    }

    final partFile = File('$cachePath.part');
    final downloadedBytes = await partFile.exists()
        ? await partFile.length()
        : 0;

    final newTask = DownloadTask(
      track: track,
      status: DownloadStatus.queued,
      type: DownloadType.preload,
      cancelToken: rhttp.CancelToken(),
      downloadedBytes: downloadedBytes,
      savePath: cachePath,
    );

    state = [...state, newTask];

    await _insertTaskToDb(newTask);
    _startDownloading();
  }

  Future<void> addToQueue(ToneHarborTrackObject track) async {
    final quality = ref.read(audioQualityProvider);
    final cachePath = await getTrackCachePath(track, quality);

    final existingTask = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (existingTask != null) {
      switch (existingTask.status) {
        case DownloadStatus.downloading:
        case DownloadStatus.queued:
          logger.i(
            '[DownloadManager] Track is already downloading or in queue: ${track.id}',
          );
          return;

        case DownloadStatus.paused:
          logger.i(
            '[DownloadManager] Track is paused, converting to normal: ${track.id}',
          );
          _pausedTracks.remove(track.id);
          state = state.where((e) => e.track.id != track.id).toList();

        case DownloadStatus.canceled:
        case DownloadStatus.failed:
          logger.i(
            '[DownloadManager] Track failed/canceled, retrying: ${track.id}',
          );
          await _deletePartFile(existingTask.savePath);
          state = state.where((e) => e.track.id != track.id).toList();

        case DownloadStatus.completed:
          return;
      }
    }

    final partFile = File('$cachePath.part');
    final downloadedBytes = await partFile.exists()
        ? await partFile.length()
        : 0;

    final newTask = DownloadTask(
      track: track,
      status: DownloadStatus.queued,
      type: DownloadType.normal,
      cancelToken: rhttp.CancelToken(),
      downloadedBytes: downloadedBytes,
      savePath: cachePath,
    );

    state = [...state, newTask];
    await _insertTaskToDb(newTask);
    _startDownloading();
  }

  Future<void> addAllToQueue(List<ToneHarborTrackObject> tracks) async {
    final quality = ref.read(audioQualityProvider);
    final trackIdsToRemove = <String>[];
    final tracksToAdd = <ToneHarborTrackObject>[];
    final partFilesToDelete = <String?>[];

    for (final track in tracks) {
      final existingTask = state.firstWhereOrNull(
        (e) => e.track.id == track.id,
      );
      if (existingTask != null) {
        switch (existingTask.status) {
          case DownloadStatus.downloading:
          case DownloadStatus.queued:
            logger.i(
              '[DownloadManager] Track is already downloading or in queue: ${track.id}',
            );
            continue;

          case DownloadStatus.paused:
            logger.i(
              '[DownloadManager] Track is paused, converting to normal: ${track.id}',
            );
            _pausedTracks.remove(track.id);
            trackIdsToRemove.add(track.id);
            tracksToAdd.add(track);

          case DownloadStatus.canceled:
          case DownloadStatus.failed:
            logger.i(
              '[DownloadManager] Track failed/canceled, retrying: ${track.id}',
            );
            partFilesToDelete.add(existingTask.savePath);
            trackIdsToRemove.add(track.id);
            tracksToAdd.add(track);

          case DownloadStatus.completed:
            continue;
        }
      } else {
        tracksToAdd.add(track);
      }
    }

    for (final savePath in partFilesToDelete) {
      await _deletePartFile(savePath);
    }

    if (trackIdsToRemove.isNotEmpty) {
      state = state
          .where((e) => !trackIdsToRemove.contains(e.track.id))
          .toList();
    }

    if (tracksToAdd.isNotEmpty) {
      final newTasks = <DownloadTask>[];
      for (final track in tracksToAdd) {
        final cachePath = await getTrackCachePath(track, quality);
        final partFile = File('$cachePath.part');
        final downloadedBytes = await partFile.exists()
            ? await partFile.length()
            : 0;

        newTasks.add(
          DownloadTask(
            track: track,
            status: DownloadStatus.queued,
            type: DownloadType.normal,
            cancelToken: rhttp.CancelToken(),
            downloadedBytes: downloadedBytes,
            savePath: cachePath,
          ),
        );
      }
      await _insertTasksToDb(newTasks);
      state = [...state, ...newTasks];
      _startDownloading();
    }
  }

  Future<void> pause(ToneHarborTrackObject track) async {
    final task = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (task?.status == DownloadStatus.downloading) {
      _pausedTracks.add(track.id);
      task!.cancelToken.cancel();
      await _setStatus(track, DownloadStatus.paused);
    }
  }

  Future<bool> pauseByTrackId(String trackId) async {
    final task = state.firstWhereOrNull((e) => e.track.id == trackId);
    if (task?.status == DownloadStatus.downloading) {
      _pausedTracks.add(trackId);
      task!.cancelToken.cancel();
      await _setStatus(task.track, DownloadStatus.paused);
      return true;
    }
    return false;
  }

  Future<bool> resumeByTrackId(String trackId) async {
    final task = state.firstWhereOrNull((e) => e.track.id == trackId);
    if (task?.status == DownloadStatus.paused) {
      _pausedTracks.remove(trackId);
      state = state.map((e) {
        if (e.track.id == trackId) {
          return e.copyWith(
            status: DownloadStatus.queued,
            cancelToken: rhttp.CancelToken(),
          );
        }
        return e;
      }).toList();
      await _updateTaskStatusInDb(trackId, DownloadStatus.queued);
      _startDownloading();
      return true;
    }
    return false;
  }

  Future<void> pauseAll() async {
    for (final task in state) {
      if (task.status == DownloadStatus.downloading) {
        await pauseByTrackId(task.track.id);
      }
    }
  }

  void resume(ToneHarborTrackObject track) {
    resumeByTrackId(track.id);
  }

  void resumeAll() {
    final resumed = <String>[];
    for (final task in state) {
      if (task.status == DownloadStatus.paused) {
        resumed.add(task.track.id);
      }
    }
    for (final trackId in resumed) {
      resumeByTrackId(trackId);
    }
  }

  Future<void> retry(ToneHarborTrackObject track) async {
    final task = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (task?.status case DownloadStatus.canceled || DownloadStatus.failed) {
      final savePath =
          task!.savePath ??
          await getTrackCachePath(track, ref.read(audioQualityProvider));

      if (!CacheLockManager.instance.tryLock(savePath)) {
        logger.i(
          '[DownloadManager] Cache locked by another process, cannot retry: ${track.id}',
        );
        return;
      }

      if (task.status == DownloadStatus.failed) {
        try {
          final partialFile = File('$savePath.part');
          if (await partialFile.exists()) {
            await partialFile.delete();
          }
        } catch (e) {
          logger.w(
            '[DownloadManager] Failed to delete partial file: $savePath.part',
          );
        }
      }

      CacheLockManager.instance.unlock(savePath);

      final updatedTask = task.copyWith(
        status: DownloadStatus.queued,
        retryCount: 0,
        cancelToken: rhttp.CancelToken(),
      );
      state = state.map((e) {
        if (e.track.id == track.id) {
          return updatedTask;
        }
        return e;
      }).toList();
      await _insertTaskToDb(updatedTask);
      _pausedTracks.remove(track.id);
      _startDownloading();
    }
  }

  Future<void> cancel(ToneHarborTrackObject track) async {
    final task = state.firstWhereOrNull((e) => e.track.id == track.id);
    final status = task?.status;
    if (status == DownloadStatus.completed ||
        status == DownloadStatus.failed ||
        status == DownloadStatus.canceled) {
      return;
    }
    await _deletePartFile(task?.savePath);
    if (status == DownloadStatus.downloading) {
      task!.cancelToken.cancel();
    }
    if (task?.savePath != null) {
      CacheLockManager.instance.unlock(task!.savePath!);
    }

    _pausedTracks.remove(track.id);
    await _setStatus(track, DownloadStatus.canceled);
  }

  Future<void> cancelAll() async {
    final downloadingTasks = state
        .where((e) => e.status == DownloadStatus.downloading)
        .toList();

    for (final task in downloadingTasks) {
      task.cancelToken.cancel();
    }

    await Future.delayed(const Duration(milliseconds: 100));

    final preloadTasks = state.where((e) => e.type == DownloadType.preload);
    final normalTasks = state.where((e) => e.type == DownloadType.normal);

    await Future.wait(
      state.map((task) async {
        await _deletePartFile(task.savePath);
        task.dispose();
      }),
    );

    _pausedTracks.clear();
    state = [];
    CacheLockManager.instance.clearAll();

    await Future.wait([
      if (normalTasks.isNotEmpty)
        _updateTasksStatusInDb(
          normalTasks.map((e) => e.track.id).toList(),
          DownloadStatus.canceled,
        ),
      if (preloadTasks.isNotEmpty)
        _deleteTasksFromDb(preloadTasks.map((e) => e.track.id).toList()),
    ]);
  }

  Future<void> _setStatus(
    ToneHarborTrackObject track,
    DownloadStatus status,
  ) async {
    final task = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (task == null) return;

    if ((status == DownloadStatus.canceled ||
            status == DownloadStatus.paused) &&
        !task.cancelToken.isCancelled) {
      task.cancelToken.cancel();
    }

    if (status == DownloadStatus.completed ||
        status == DownloadStatus.canceled) {
      state = state.where((e) => e.track.id != track.id).toList();

      if (task.type == DownloadType.preload) {
        await _deleteTaskFromDb(track.id);
        return;
      }
    } else {
      state = state.map((e) {
        if (e.track.id == track.id) {
          return e.copyWith(status: status);
        }
        return e;
      }).toList();
    }
    await _updateTaskStatusInDb(track.id, status);
  }

  Future<void> _updateTaskStatusInDb(
    String trackId,
    DownloadStatus status,
  ) async {
    final db = ref.read(appDatabaseProvider);
    await (db.update(
      db.downloadTaskState,
    )..where((tb) => tb.trackId.equals(trackId))).write(
      DownloadTaskStateCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> _updateTasksStatusInDb(
    List<String> trackIds,
    DownloadStatus status,
  ) async {
    if (trackIds.isEmpty) return;
    final db = ref.read(appDatabaseProvider);
    await (db.update(
      db.downloadTaskState,
    )..where((tb) => tb.trackId.isIn(trackIds))).write(
      DownloadTaskStateCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  void _updateTask(
    ToneHarborTrackObject track, {
    int? downloadedBytes,
    int? totalSizeBytes,
    String? savePath,
  }) {
    state = state.map((e) {
      if (e.track.id == track.id) {
        return e.copyWith(
          downloadedBytes: downloadedBytes ?? e.downloadedBytes,
          totalSizeBytes: totalSizeBytes ?? e.totalSizeBytes,
          savePath: savePath ?? e.savePath,
        );
      }
      return e;
    }).toList();
  }

  int get activeDownloadsCount =>
      state.where((e) => e.status == DownloadStatus.downloading).length;

  int get queuedDownloadsCount =>
      state.where((e) => e.status == DownloadStatus.queued).length;

  int get pausedDownloadsCount =>
      state.where((e) => e.status == DownloadStatus.paused).length;

  int get activeNormalDownloadsCount => state
      .where(
        (e) =>
            e.status == DownloadStatus.downloading &&
            e.type == DownloadType.normal,
      )
      .length;

  int get activePreloadDownloadsCount => state
      .where(
        (e) =>
            e.status == DownloadStatus.downloading &&
            e.type == DownloadType.preload,
      )
      .length;

  int get queuedNormalDownloadsCount => state
      .where(
        (e) =>
            e.status == DownloadStatus.queued && e.type == DownloadType.normal,
      )
      .length;

  int get queuedPreloadDownloadsCount => state
      .where(
        (e) =>
            e.status == DownloadStatus.queued && e.type == DownloadType.preload,
      )
      .length;

  Future<void> _downloadTrack(DownloadTask task) async {
    final quality = ref.read(audioQualityProvider);
    final savePath = await getTrackCachePath(task.track, quality);

    if (!CacheLockManager.instance.tryLock(savePath)) {
      logger.w(
        '[DownloadManager] Cache locked by another process, skipping: ${task.track.id}',
      );
      return;
    }

    bool lockHeld = true;
    try {
      final streamUrl = await ref.read(
        streamUrlProvider(
          id: task.track.id,
          quality: quality,
          container: task.track.container,
        ).future,
      );

      if (task.cancelToken.isCancelled) {
        if (_pausedTracks.contains(task.track.id)) {
          _pausedTracks.remove(task.track.id);
          await _setStatus(task.track, DownloadStatus.paused);
        } else {
          await _setStatus(task.track, DownloadStatus.canceled);
        }
        CacheLockManager.instance.unlock(savePath);
        lockHeld = false;
        return;
      }

      if (streamUrl.isEmpty) {
        throw Exception("No download URL found for selected codec");
      }

      final authHeaders = await ref.read(authHeadersProvider.future);
      if (authHeaders == null) {
        throw Exception("No auth headers available");
      }

      _updateTask(task.track, savePath: savePath);

      final savePathFile = File(savePath);
      final partialPath = '$savePath.part';
      final partialFile = File(partialPath);

      if (await savePathFile.exists()) {
        await _setStatus(task.track, DownloadStatus.completed);
        _completionController.add(task.track);
        CacheLockManager.instance.unlock(savePath);
        lockHeld = false;
        return;
      }

      await partialFile.parent.create(recursive: true);

      int existingBytes = 0;
      if (await partialFile.exists()) {
        existingBytes = await partialFile.length();
        if (existingBytes > 0) {
          logger.i(
            '[DownloadManager] Resuming download from byte $existingBytes for track: ${task.track.id}',
          );
        }
      }

      _updateTask(task.track, downloadedBytes: existingBytes);

      final response = await downloadHttpClientWrapper.getStream(
        streamUrl,
        headers: rhttp.HttpHeaders.rawMap({
          ...authHeaders,
          'range': 'bytes=$existingBytes-',
        }),
        cancelToken: task.cancelToken,
      );

      if (response.statusCode < 400) {
        final sink = partialFile.openWrite(mode: FileMode.writeOnlyAppend);
        int? totalSize;

        final contentRange = response.headers
            .where((h) => h.$1.toLowerCase() == 'content-range')
            .firstOrNull;
        if (contentRange != null) {
          final match = RegExp(
            r'bytes \d+-\d+/(\d+)',
          ).firstMatch(contentRange.$2);
          if (match != null) {
            totalSize = int.parse(match.group(1)!);
            _updateTask(task.track, totalSizeBytes: totalSize);
          }
        }

        var downloadedBytes = existingBytes;
        var lastUpdateTime = DateTime.now();
        var lastBytes = existingBytes;

        try {
          await for (final chunk in response.body) {
            if (task.cancelToken.isCancelled) {
              await sink.close();

              if (_pausedTracks.contains(task.track.id)) {
                _pausedTracks.remove(task.track.id);
                await _setStatus(task.track, DownloadStatus.paused);
              } else {
                if (await partialFile.exists()) {
                  await partialFile.delete();
                }
                await _setStatus(task.track, DownloadStatus.canceled);
              }
              CacheLockManager.instance.unlock(savePath);
              lockHeld = false;
              return;
            }
            sink.add(chunk);
            downloadedBytes += chunk.length;
            task._downloadedBytesStreamController.add(downloadedBytes);

            final now = DateTime.now();
            final elapsed = now.difference(lastUpdateTime).inMilliseconds;
            if (elapsed >= 500) {
              _updateTask(task.track, downloadedBytes: downloadedBytes);
              final bytesPerSecond =
                  (downloadedBytes - lastBytes) * 1000 / elapsed;
              task._downloadSpeedStreamController.add(
                bytesPerSecond / 1024 / 1024,
              );
              lastUpdateTime = now;
              lastBytes = downloadedBytes;
            }
          }
        } catch (e) {
          await sink.close();
          rethrow;
        }

        await sink.close();

        if (!await partialFile.exists()) {
          throw Exception("Partial file not found");
        }

        final partialFileSize = await partialFile.length();
        if (partialFileSize == 0) {
          throw Exception("Downloaded file is empty");
        }

        if (totalSize != null && partialFileSize != totalSize) {
          throw Exception(
            "File size mismatch: expected $totalSize, got $partialFileSize",
          );
        }

        await partialFile.rename(savePath);

        if (!await savePathFile.exists()) {
          throw Exception("Failed to rename partial file to final file");
        }

        await _setStatus(task.track, DownloadStatus.completed);
        _completionController.add(task.track);

        await writeTrackMetadata(
          ref: ref,
          track: task.track,
          cachePath: savePath,
          fileLength: await savePathFile.length(),
        );
      } else {
        throw Exception("HTTP ${response.statusCode}");
      }
    } catch (e, stack) {
      if (e is rhttp.RhttpException) {
        logger.i('[DownloadManager] Download cancelled: ${task.track.id}');
        if (_pausedTracks.contains(task.track.id)) {
          _pausedTracks.remove(task.track.id);
          await _setStatus(task.track, DownloadStatus.paused);
          CacheLockManager.instance.unlock(savePath);
          lockHeld = false;
        } else {
          final partialFile = File('$savePath.part');
          if (await partialFile.exists()) {
            await partialFile.delete();
          }
          await _setStatus(task.track, DownloadStatus.canceled);
          CacheLockManager.instance.unlock(savePath);
          lockHeld = false;
        }
        return;
      }

      if (task.retryCount < _maxRetries) {
        logger.i(
          '[DownloadManager] Retrying download: ${task.track.id}, attempt ${task.retryCount + 1}/$_maxRetries',
        );
        _pausedTracks.remove(task.track.id);
        state = state.map((e) {
          if (e.track.id == task.track.id) {
            return e.copyWith(
              retryCount: e.retryCount + 1,
              status: DownloadStatus.queued,
            );
          }
          return e;
        }).toList();
        await _updateTaskStatusInDb(task.track.id, DownloadStatus.queued);
        await Future.delayed(_retryDelay * (task.retryCount + 1));
        _startDownloading();
        CacheLockManager.instance.unlock(savePath);
        lockHeld = false;
        return;
      }

      final partialFile = File('$savePath.part');
      if (await partialFile.exists()) {
        await partialFile.delete();
      }
      await _setStatus(task.track, DownloadStatus.failed);
      logger.e(
        '[DownloadManager] Download failed after $_maxRetries retries: ${task.track.id}',
        error: e,
        stackTrace: stack,
      );
    } finally {
      if (lockHeld) {
        CacheLockManager.instance.unlock(savePath);
      }
    }
  }

  void _scheduleNextDownload() {
    Future.microtask(() => _startDownloading());
  }

  Future<void> _startDownloading() async {
    if (_isStartingDownloads) return;
    _isStartingDownloads = true;
    try {
      while (_activePreloadDownloads < _maxPreloadDownloads) {
        final queuedTask = state.firstWhereOrNull(
          (task) =>
              task.status == DownloadStatus.queued &&
              task.type == DownloadType.preload,
        );

        if (queuedTask == null) break;

        await _setStatus(queuedTask.track, DownloadStatus.downloading);

        _activePreloadDownloads++;
        _downloadTrack(queuedTask).whenComplete(() {
          _activePreloadDownloads--;
          _scheduleNextDownload();
        });
      }

      while (_activeNormalDownloads < _maxNormalDownloads) {
        final queuedTask = state.firstWhereOrNull(
          (task) =>
              task.status == DownloadStatus.queued &&
              task.type == DownloadType.normal,
        );

        if (queuedTask == null) break;

        await _setStatus(queuedTask.track, DownloadStatus.downloading);

        _activeNormalDownloads++;
        _downloadTrack(queuedTask).whenComplete(() {
          _activeNormalDownloads--;
          _scheduleNextDownload();
        });
      }
    } finally {
      _isStartingDownloads = false;
    }
  }
}
