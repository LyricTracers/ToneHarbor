import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rhttp/rhttp.dart' as rhttp;
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/audio_player/cache_lock_manager.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/metadata_utils.dart';

part 'download_manager.g.dart';

enum DownloadStatus { queued, downloading, paused, completed, failed, canceled }

class DownloadTask {
  final ToneHarborTrackObject track;
  final DownloadStatus status;
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
  static const int _maxConcurrentDownloads = 3;
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 2);

  final _preloadingTracks = <String>{};
  final _cancelTokens = <String, rhttp.CancelToken>{};
  final _completionController =
      StreamController<ToneHarborTrackObject>.broadcast();
  final _pausedTracks = <String>{};
  int _activeDownloads = 0;
  bool _isStartingDownloads = false;

  Stream<ToneHarborTrackObject> get completionStream =>
      _completionController.stream;

  String _getCacheKey(String trackId, AudioQuality quality) {
    return '${trackId}_${quality.name}';
  }

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
    if (_preloadingTracks.any((key) => key.startsWith('${trackId}_'))) {
      return true;
    }
    return state.any(
      (task) =>
          task.track.id == trackId &&
          (task.status == DownloadStatus.downloading ||
              task.status == DownloadStatus.queued ||
              task.status == DownloadStatus.paused),
    );
  }

  void cancelAllPreloads() {
    for (final entry in _cancelTokens.entries) {
      if (!entry.value.isCancelled) {
        entry.value.cancel();
        logger.i('[DownloadManager] Cancelling preload: ${entry.key}');
      }
    }
    _cancelTokens.clear();
    _preloadingTracks.clear();
  }

  Future<void> preloadNextTrack(ToneHarborTrackObject track) async {
    if (track is ToneHarborTrackObjectLocal) {
      logger.i('[DownloadManager] Skip local track: ${track.id}');
      return;
    }

    final quality = ref.read(audioQualityProvider);
    final cacheKey = _getCacheKey(track.id, quality);

    if (_preloadingTracks.contains(cacheKey)) {
      logger.i(
        '[DownloadManager] Already preloading: ${track.id} at ${quality.name}',
      );
      return;
    }

    final existingTask = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (existingTask != null) {
      if (existingTask.status == DownloadStatus.downloading) {
        logger.i(
          '[DownloadManager] Track is downloading, skip preload: ${track.id}',
        );
        return;
      }
    }

    final cachePath = await getTrackCachePath(track, quality);
    if (!CacheLockManager.instance.tryLock(cachePath)) {
      logger.i(
        '[DownloadManager] Cache locked by another process: ${track.id}',
      );
      return;
    }

    if (existingTask != null && existingTask.status == DownloadStatus.queued) {
      logger.i(
        '[DownloadManager] Track is in queue, remove from queue and preload: ${track.id}',
      );
      state = state.where((e) => e.track.id != track.id).toList();
    }

    _preloadingTracks.add(cacheKey);

    final partialCachePath = '$cachePath.part';
    final partialCacheFile = File(partialCachePath);

    try {
      final streamUrl = await ref.read(
        streamUrlProvider(
          id: track.id,
          quality: quality,
          container: track.container,
        ).future,
      );

      if (streamUrl.isEmpty) {
        logger.w(
          '[DownloadManager] Stream URL is empty for track: ${track.id}',
        );
        if (await partialCacheFile.exists()) {
          await partialCacheFile.delete();
        }
        return;
      }

      final finalCacheFile = File(cachePath);

      if (await finalCacheFile.exists()) {
        logger.i(
          '[DownloadManager] Track already cached: ${track.id} at ${quality.name}',
        );
        if (await partialCacheFile.exists()) {
          await partialCacheFile.delete();
        }
        return;
      }

      final authHeaders = await ref.read(authHeadersProvider.future);
      if (authHeaders == null) {
        logger.w('[DownloadManager] No auth headers available');
        if (await partialCacheFile.exists()) {
          await partialCacheFile.delete();
        }
        Future.microtask(() async {
          await ref
              .read(audioStationCookiesInfoProvider.notifier)
              .clearCookie();
          ref.invalidate(authTokenProvider);
        });
        return;
      }

      logger.i(
        '[DownloadManager] Preloading track: ${track.id} at ${quality.name}',
      );

      final cancelToken = rhttp.CancelToken();
      _cancelTokens[cacheKey] = cancelToken;

      int existingBytes = 0;

      if (await partialCacheFile.exists()) {
        existingBytes = await partialCacheFile.length();
        if (existingBytes > 0) {
          logger.i(
            '[DownloadManager] Resuming preload from byte $existingBytes for track: ${track.id}',
          );
        }
      }

      final response = await downloadHttpClientWrapper.getStream(
        streamUrl,
        headers: rhttp.HttpHeaders.rawMap({
          ...authHeaders,
          'range': 'bytes=$existingBytes-',
        }),
        cancelToken: cancelToken,
      );

      if (response.statusCode != 200 && response.statusCode != 206) {
        logger.w(
          '[DownloadManager] Failed to preload track: ${track.id}, status: ${response.statusCode}',
        );
        if (await partialCacheFile.exists()) {
          await partialCacheFile.delete();
        }
        return;
      }

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
        }
      }

      if (!await partialCacheFile.exists()) {
        await partialCacheFile.create(recursive: true);
      }
      final sink = partialCacheFile.openWrite(mode: FileMode.writeOnlyAppend);

      var cancelled = false;
      try {
        await for (final chunk in response.body) {
          if (cancelToken.isCancelled) {
            cancelled = true;
            logger.i('[DownloadManager] Cancelled: ${track.id}');
            break;
          }
          sink.add(chunk);
        }
      } catch (e) {
        await sink.close();
        rethrow;
      }

      await sink.close();

      if (cancelled) {
        if (await partialCacheFile.exists()) {
          await partialCacheFile.delete();
        }
        return;
      }

      final fileLength = await partialCacheFile.length();
      logger.i(
        '[DownloadManager] Preloaded track: ${track.id}, file length: $fileLength, expected: $totalSize',
      );

      if (totalSize != null && totalSize > 0 && fileLength >= totalSize) {
        if (await finalCacheFile.exists()) {
          await finalCacheFile.delete();
        }
        await partialCacheFile.rename(cachePath);
        logger.i(
          '[DownloadManager] Cache complete, renamed to: $cachePath,title:${track.title},artist:${track.artist}',
        );

        await writeTrackMetadata(
          ref: ref,
          track: track,
          cachePath: cachePath,
          fileLength: fileLength,
        );
      }
    } catch (e, stack) {
      logger.e(
        '[DownloadManager] Failed to preload track: ${track.id}',
        error: e,
        stackTrace: stack,
      );
      if (await partialCacheFile.exists()) {
        await partialCacheFile.delete();
      }
    } finally {
      _preloadingTracks.remove(cacheKey);
      _cancelTokens.remove(cacheKey);
      CacheLockManager.instance.unlock(cachePath);
    }
  }

  void addToQueue(ToneHarborTrackObject track) {
    final quality = ref.read(audioQualityProvider);
    final cacheKey = _getCacheKey(track.id, quality);

    if (_preloadingTracks.contains(cacheKey)) {
      logger.i(
        '[DownloadManager] Track is preloading, skip add to queue: ${track.id}',
      );
      return;
    }

    if (state.any((element) => element.track.id == track.id)) return;
    state = [
      ...state,
      DownloadTask(
        track: track,
        status: DownloadStatus.queued,
        cancelToken: rhttp.CancelToken(),
      ),
    ];
    _startDownloading();
  }

  void addAllToQueue(List<ToneHarborTrackObject> tracks) {
    final quality = ref.read(audioQualityProvider);
    final newTracks = tracks.where((track) {
      if (state.any((e) => e.track.id == track.id)) return false;
      final cacheKey = _getCacheKey(track.id, quality);
      if (_preloadingTracks.contains(cacheKey)) {
        logger.i(
          '[DownloadManager] Track is preloading, skip add to queue: ${track.id}',
        );
        return false;
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
    }
  }

  void cancelPreload(String trackId) {
    final quality = ref.read(audioQualityProvider);
    final cacheKey = _getCacheKey(trackId, quality);
    final cancelToken = _cancelTokens[cacheKey];
    if (cancelToken != null && !cancelToken.isCancelled) {
      cancelToken.cancel();
      logger.i(
        '[DownloadManager] Cancelling preload: $trackId at ${quality.name}',
      );
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
        if (!CacheLockManager.instance.isLocked(task.savePath!)) {
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
      task.dispose();
    }
    _pausedTracks.clear();
    state = [];
  }

  void _setStatus(ToneHarborTrackObject track, DownloadStatus status) {
    state = state.map((e) {
      if (e.track.id == track.id) {
        if ((status == DownloadStatus.canceled ||
                status == DownloadStatus.paused) &&
            !e.cancelToken.isCancelled) {
          e.cancelToken.cancel();
        }

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
    final toRemove = state.where((e) => e.status == DownloadStatus.completed);
    for (final task in toRemove) {
      task.dispose();
    }
    state = state.where((e) => e.status != DownloadStatus.completed).toList();
  }

  void removeFailed() {
    final toRemove = state.where((e) => e.status == DownloadStatus.failed);
    for (final task in toRemove) {
      task.dispose();
    }
    state = state.where((e) => e.status != DownloadStatus.failed).toList();
  }

  void removeCanceled() {
    final toRemove = state.where((e) => e.status == DownloadStatus.canceled);
    for (final task in toRemove) {
      task.dispose();
    }
    state = state.where((e) => e.status != DownloadStatus.canceled).toList();
  }

  Future<void> removeTask(ToneHarborTrackObject track) async {
    final task = state.firstWhereOrNull((e) => e.track.id == track.id);
    if (task != null) {
      if (task.status == DownloadStatus.downloading) {
        task.cancelToken.cancel();
      }

      if (task.savePath != null) {
        if (!CacheLockManager.instance.isLocked(task.savePath!)) {
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

      task.dispose();
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

  Future<void> _downloadTrack(DownloadTask task) async {
    final quality = ref.read(audioQualityProvider);
    final savePath = await getTrackCachePath(task.track, quality);

    if (!CacheLockManager.instance.tryLock(savePath)) {
      logger.i(
        '[DownloadManager] Cache locked by another process: ${task.track.id}',
      );
      _setStatus(task.track, DownloadStatus.failed);
      _pausedTracks.remove(task.track.id);
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

      if (!await partialFile.parent.exists()) {
        await partialFile.parent.create(recursive: true);
      }

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
        }
        return;
      }

      if (task.retryCount < _maxRetries) {
        logger.i(
          '[DownloadManager] Retrying download: ${task.track.id}, attempt ${task.retryCount + 1}/$_maxRetries',
        );
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
      while (_activeDownloads < _maxConcurrentDownloads) {
        final queuedTask = state.firstWhereOrNull(
          (task) => task.status == DownloadStatus.queued,
        );

        if (queuedTask == null) break;

        _activeDownloads++;
        _downloadTrack(queuedTask).whenComplete(() {
          _activeDownloads--;
          _scheduleNextDownload();
        });
      }
    } finally {
      _isStartingDownloads = false;
    }
  }
}
