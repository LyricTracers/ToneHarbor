import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rhttp/rhttp.dart' as rhttp;
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
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
    ref.onDispose(() {
      for (final task in state) {
        if (task.status == DownloadStatus.downloading) {
          task.cancelToken.cancel();
        }
        task.dispose();
      }
      _completionController.close();
    });

    return [];
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
    final pausedTasks = <DownloadTask>[];

    for (final task in state) {
      if (task.type == DownloadType.preload &&
          (task.status == DownloadStatus.downloading ||
              task.status == DownloadStatus.queued ||
              task.status == DownloadStatus.paused)) {
        if (task.status == DownloadStatus.paused) {
          pausedTasks.add(task);
        } else {
          task.cancelToken.cancel();
        }
        _pausedTracks.remove(task.track.id);
      }
    }

    for (final task in pausedTasks) {
      if (task.savePath != null) {
        final partialFile = File('${task.savePath}.part');
        if (await partialFile.exists()) {
          try {
            await partialFile.delete();
          } catch (e) {
            logger.w(
              '[DownloadManager] Failed to delete partial file: ${task.savePath}.part',
            );
          }
        }
      }
    }

    state = state.map((e) {
      if (e.type == DownloadType.preload &&
          (e.status == DownloadStatus.downloading ||
              e.status == DownloadStatus.queued ||
              e.status == DownloadStatus.paused)) {
        return e.copyWith(status: DownloadStatus.canceled);
      }
      return e;
    }).toList();
  }

  Future<void> preloadNextTrack(ToneHarborTrackObject track) async {
    if (track is ToneHarborTrackObjectLocal) {
      logger.i('[DownloadManager] Skip local track: ${track.id}');
      return;
    }

    final quality = ref.read(audioQualityProvider);

    final existingTask = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (existingTask != null) {
      if (existingTask.status == DownloadStatus.downloading) {
        logger.i(
          '[DownloadManager] Track is downloading, skip preload: ${track.id}',
        );
        return;
      }
      if (existingTask.type == DownloadType.preload) {
        logger.i(
          '[DownloadManager] Already preloading: ${track.id} at ${quality.name}',
        );
        return;
      }
    }

    final cachePath = await getTrackCachePath(track, quality);

    if (existingTask != null && existingTask.status == DownloadStatus.queued) {
      logger.i(
        '[DownloadManager] Track is in queue, remove from queue and preload: ${track.id}',
      );
      state = state.where((e) => e.track.id != track.id).toList();
    }

    state = [
      ...state,
      DownloadTask(
        track: track,
        status: DownloadStatus.queued,
        type: DownloadType.preload,
        cancelToken: rhttp.CancelToken(),
        savePath: cachePath,
      ),
    ];

    _startDownloading();
  }

  void addToQueue(ToneHarborTrackObject track) {
    final existingTask = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (existingTask != null) {
      if (existingTask.status == DownloadStatus.downloading ||
          existingTask.status == DownloadStatus.queued) {
        logger.i(
          '[DownloadManager] Track is already downloading or in queue: ${track.id}',
        );
        return;
      }
    }

    state = [
      ...state,
      DownloadTask(
        track: track,
        status: DownloadStatus.queued,
        type: DownloadType.normal,
        cancelToken: rhttp.CancelToken(),
      ),
    ];
    _startDownloading();
  }

  void addAllToQueue(List<ToneHarborTrackObject> tracks) {
    final newTracks = tracks.where((track) {
      final existingTask = state.firstWhereOrNull(
        (e) => e.track.id == track.id,
      );
      if (existingTask != null) {
        if (existingTask.status == DownloadStatus.downloading ||
            existingTask.status == DownloadStatus.queued) {
          logger.i(
            '[DownloadManager] Track is already downloading or in queue: ${track.id}',
          );
          return false;
        }
      }
      return true;
    }).toList();
    if (newTracks.isEmpty) return;

    state = [
      ...state,
      ...newTracks.map(
        (e) => DownloadTask(
          track: e,
          status: DownloadStatus.queued,
          type: DownloadType.normal,
          cancelToken: rhttp.CancelToken(),
        ),
      ),
    ];
    _startDownloading();
  }

  void pause(ToneHarborTrackObject track) {
    final task = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (task?.status == DownloadStatus.downloading) {
      _pausedTracks.add(track.id);
      task!.cancelToken.cancel();
      _setStatus(track, DownloadStatus.paused);
    }
  }

  bool pauseByTrackId(String trackId) {
    final task = state.firstWhereOrNull((e) => e.track.id == trackId);
    if (task?.status == DownloadStatus.downloading) {
      _pausedTracks.add(trackId);
      task!.cancelToken.cancel();
      _setStatus(task.track, DownloadStatus.paused);
      return true;
    }
    return false;
  }

  bool resumeByTrackId(String trackId) {
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
      _startDownloading();
      return true;
    }
    return false;
  }

  void pauseAll() {
    for (final task in state) {
      if (task.status == DownloadStatus.downloading) {
        _pausedTracks.add(task.track.id);
        task.cancelToken.cancel();
        _setStatus(task.track, DownloadStatus.paused);
      }
    }
  }

  void resume(ToneHarborTrackObject track) {
    final task = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (task?.status == DownloadStatus.paused) {
      _pausedTracks.remove(track.id);
      state = state.map((e) {
        if (e.track.id == track.id) {
          return e.copyWith(
            status: DownloadStatus.queued,
            cancelToken: rhttp.CancelToken(),
          );
        }
        return e;
      }).toList();
      _startDownloading();
    }
  }

  void resumeAll() {
    state = state.map((e) {
      if (e.status == DownloadStatus.paused) {
        _pausedTracks.remove(e.track.id);
        return e.copyWith(
          status: DownloadStatus.queued,
          cancelToken: rhttp.CancelToken(),
        );
      }
      return e;
    }).toList();
    _startDownloading();
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

      try {
        final partialFile = File('$savePath.part');
        if (await partialFile.exists()) {
          await partialFile.delete();
        }
      } finally {
        CacheLockManager.instance.unlock(savePath);
      }

      state = state.map((e) {
        if (e.track.id == track.id) {
          return e.copyWith(
            status: DownloadStatus.queued,
            retryCount: 0,
            cancelToken: rhttp.CancelToken(),
            downloadedBytes: 0,
          );
        }
        return e;
      }).toList();
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
    _pausedTracks.remove(track.id);

    if (status == DownloadStatus.downloading) {
      task!.cancelToken.cancel();
    } else if (status == DownloadStatus.queued) {
      _setStatus(track, DownloadStatus.canceled);
    } else if (status == DownloadStatus.paused) {
      _setStatus(track, DownloadStatus.canceled);
    }
  }

  Future<void> clearAll() async {
    final tasksToClean = <DownloadTask>[];
    for (final task in state) {
      if (task.status == DownloadStatus.downloading) {
        task.cancelToken.cancel();
      }
      tasksToClean.add(task);
    }

    for (final task in tasksToClean) {
      if (task.savePath != null) {
        final partialFile = File('${task.savePath}.part');
        if (await partialFile.exists()) {
          try {
            await partialFile.delete();
          } catch (e) {
            logger.w(
              '[DownloadManager] Failed to delete partial file: ${task.savePath}.part',
            );
          }
        }
      }
      task.dispose();
    }
    _pausedTracks.clear();
    state = [];
  }

  void _setStatus(ToneHarborTrackObject track, DownloadStatus status) {
    final task = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (task == null) return;

    if ((status == DownloadStatus.canceled ||
            status == DownloadStatus.paused) &&
        !task.cancelToken.isCancelled) {
      task.cancelToken.cancel();
    }

    state = state.map((e) {
      if (e.track.id == track.id) {
        return e.copyWith(status: status);
      }
      return e;
    }).toList();
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

  void removeCompleted() {
    state = state.where((e) {
      if (e.status == DownloadStatus.completed) {
        e.dispose();
        return false;
      }
      return true;
    }).toList();
  }

  void removeFailed() {
    state = state.where((e) {
      if (e.status == DownloadStatus.failed) {
        e.dispose();
        return false;
      }
      return true;
    }).toList();
  }

  void removeCanceled() {
    state = state.where((e) {
      if (e.status == DownloadStatus.canceled) {
        e.dispose();
        return false;
      }
      return true;
    }).toList();
  }

  Future<void> removeTask(ToneHarborTrackObject track) async {
    final task = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (task != null) {
      if (task.status == DownloadStatus.downloading) {
        task.cancelToken.cancel();
      }

      if (task.savePath != null) {
        final partialFile = File('${task.savePath}.part');
        if (await partialFile.exists()) {
          try {
            await partialFile.delete();
          } catch (e) {
            logger.w(
              '[DownloadManager] Failed to delete partial file: ${task.savePath}.part',
            );
          }
        }
      }

      task.dispose();
      _pausedTracks.remove(track.id);
      state = state.where((e) => e.track.id != track.id).toList();
    }
  }

  int get activeDownloadsCount =>
      state.where((e) => e.status == DownloadStatus.downloading).length;

  int get queuedDownloadsCount =>
      state.where((e) => e.status == DownloadStatus.queued).length;

  int get completedDownloadsCount =>
      state.where((e) => e.status == DownloadStatus.completed).length;

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
      logger.i(
        '[DownloadManager] Cache locked by another process: ${task.track.id}',
      );
      _setStatus(task.track, DownloadStatus.queued);
      _scheduleNextDownload();
      return;
    }

    bool lockHeld = true;
    try {
      _setStatus(task.track, DownloadStatus.downloading);
      final streamUrl = await ref.read(
        streamUrlProvider(
          id: task.track.id,
          quality: quality,
          container: task.track.container,
        ).future,
      );

      if (task.cancelToken.isCancelled) {
        if (_pausedTracks.contains(task.track.id)) {
          _setStatus(task.track, DownloadStatus.paused);
        } else {
          _setStatus(task.track, DownloadStatus.canceled);
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
        _setStatus(task.track, DownloadStatus.completed);
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
                _setStatus(task.track, DownloadStatus.paused);
                CacheLockManager.instance.unlock(savePath);
                lockHeld = false;
              } else {
                if (await partialFile.exists()) {
                  await partialFile.delete();
                }
                _setStatus(task.track, DownloadStatus.canceled);
                CacheLockManager.instance.unlock(savePath);
                lockHeld = false;
              }
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

        if (await partialFile.exists()) {
          await partialFile.rename(savePath);
        }

        if (!await savePathFile.exists()) {
          throw Exception("Failed to rename partial file to final file");
        }

        _setStatus(task.track, DownloadStatus.completed);
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
          _setStatus(task.track, DownloadStatus.paused);
          CacheLockManager.instance.unlock(savePath);
          lockHeld = false;
        } else {
          final partialFile = File('$savePath.part');
          if (await partialFile.exists()) {
            await partialFile.delete();
          }
          _setStatus(task.track, DownloadStatus.canceled);
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
      _setStatus(task.track, DownloadStatus.failed);
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
