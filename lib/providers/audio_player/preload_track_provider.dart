import 'dart:async';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rhttp/rhttp.dart' as rhttp;
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/metadata_utils.dart';

part 'preload_track_provider.g.dart';

@keepAlive
class PreloadTrack extends _$PreloadTrack {
  final _preloadingTracks = <String, bool>{};
  final _cancelTokens = <String, rhttp.CancelToken>{};

  String _getCacheKey(String trackId, AudioQuality quality) {
    return '${trackId}_${quality.name}';
  }

  @override
  void build() {}

  Future<void> preloadNextTrack(ToneHarborTrackObject track) async {
    if (track is ToneHarborTrackObjectLocal) {
      logger.i('[PreloadTrack] Skip local track: ${track.id}');
      return;
    }

    final quality = ref.read(audioQualityProvider);
    final cacheKey = _getCacheKey(track.id, quality);

    if (_preloadingTracks[cacheKey] == true) {
      logger.i(
        '[PreloadTrack] Already preloading: ${track.id} at ${quality.name}',
      );
      return;
    }

    _preloadingTracks[cacheKey] = true;

    try {
      final streamUrl = await ref.read(
        streamUrlProvider(
          id: track.id,
          quality: quality,
          container: track.container,
        ).future,
      );

      if (streamUrl.isEmpty) {
        logger.w('[PreloadTrack] Stream URL is empty for track: ${track.id}');
        return;
      }

      final cachePath = await getTrackCachePath(track, quality);
      final finalCacheFile = File(cachePath);

      if (await finalCacheFile.exists()) {
        logger.i(
          '[PreloadTrack] Track already cached: ${track.id} at ${quality.name}',
        );
        return;
      }

      final authHeaders = await ref.read(authHeadersProvider.future);
      if (authHeaders == null) {
        logger.w('[PreloadTrack] No auth headers available');
        Future.microtask(() async {
          await ref
              .read(audioStationCookiesInfoProvider.notifier)
              .clearCookie();
          ref.invalidate(authTokenProvider);
        });
        return;
      }

      logger.i(
        '[PreloadTrack] Preloading track: ${track.id} at ${quality.name}',
      );

      final cancelToken = rhttp.CancelToken();
      _cancelTokens[cacheKey] = cancelToken;

      final response = await downloadHttpClientWrapper.getStream(
        streamUrl,
        headers: rhttp.HttpHeaders.rawMap({
          ...authHeaders,
          'range': 'bytes=0-',
        }),
        cancelToken: cancelToken,
      );

      if (response.statusCode != 200 && response.statusCode != 206) {
        logger.w(
          '[PreloadTrack] Failed to preload track: ${track.id}, status: ${response.statusCode}',
        );
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

      final partialCachePath = '$cachePath.part';
      final partialCacheFile = File(partialCachePath);

      if (!await partialCacheFile.exists()) {
        await partialCacheFile.create(recursive: true);
      }
      final sink = partialCacheFile.openWrite(mode: FileMode.writeOnlyAppend);

      var cancelled = false;
      try {
        await for (final chunk in response.body) {
          if (cancelToken.isCancelled) {
            cancelled = true;
            logger.i('[PreloadTrack] Cancelled: ${track.id}');
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
        return;
      }

      final fileLength = await partialCacheFile.length();
      logger.i(
        '[PreloadTrack] Preloaded track: ${track.id}, file length: $fileLength, expected: $totalSize',
      );

      if (totalSize != null && totalSize > 0 && fileLength >= totalSize) {
        if (await finalCacheFile.exists()) {
          await finalCacheFile.delete();
        }
        await partialCacheFile.rename(cachePath);
        logger.i(
          '[PreloadTrack] Cache complete, renamed to: $cachePath,title:${track.title},artist:${track.artist}',
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
        '[PreloadTrack] Failed to preload track: ${track.id}',
        error: e,
        stackTrace: stack,
      );
    } finally {
      _preloadingTracks.remove(cacheKey);
      _cancelTokens.remove(cacheKey);
    }
  }

  void cancelPreload(String trackId, {AudioQuality? quality}) {
    quality ??= SharedPreferencesUtils.getAudioQuality();
    final cacheKey = _getCacheKey(trackId, quality);
    final cancelToken = _cancelTokens[cacheKey];
    if (cancelToken != null && !cancelToken.isCancelled) {
      cancelToken.cancel();
      logger.i(
        '[PreloadTrack] Cancelling preload: $trackId at ${quality.name}',
      );
    }
  }

  void cancelAllPreloads() {
    for (final entry in _cancelTokens.entries) {
      if (!entry.value.isCancelled) {
        entry.value.cancel();
        logger.i('[PreloadTrack] Cancelling preload: ${entry.key}');
      }
    }
    _cancelTokens.clear();
    _preloadingTracks.clear();
  }

  bool isPreloading(String trackId, {AudioQuality? quality}) {
    quality ??= SharedPreferencesUtils.getAudioQuality();
    return _preloadingTracks[_getCacheKey(trackId, quality)] == true;
  }
}
