import 'dart:async';
import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rhttp/rhttp.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'preload_track_provider.g.dart';

@keepAlive
class PreloadTrack extends _$PreloadTrack {
  final _preloadingTracks = <String, bool>{};
  final _cancelTokens = <String, CancelToken>{};

  @override
  void build() {}

  Future<void> preloadNextTrack(ToneHarborTrackObject track) async {
    if (track is ToneHarborTrackObjectLocal) {
      logger.i('[PreloadTrack] Skip local track: ${track.id}');
      return;
    }

    if (_preloadingTracks[track.id] == true) {
      logger.i('[PreloadTrack] Already preloading: ${track.id}');
      return;
    }

    _preloadingTracks[track.id] = true;

    try {
      final streamUrl = await ref.read(streamUrlProvider(id: track.id).future);

      if (streamUrl.isEmpty) {
        logger.w('[PreloadTrack] Stream URL is empty for track: ${track.id}');
        return;
      }

      final cachePath = await getTrackCachePath(track);
      final finalCacheFile = File(cachePath);

      if (await finalCacheFile.exists()) {
        logger.i('[PreloadTrack] Track already cached: ${track.id}');
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

      logger.i('[PreloadTrack] Preloading track: ${track.id}');

      final cancelToken = CancelToken();
      _cancelTokens[track.id] = cancelToken;

      final response = await downloadHttpClientWrapper.getStream(
        streamUrl,
        headers: HttpHeaders.rawMap({...authHeaders, 'range': 'bytes=0-'}),
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
        logger.i('[PreloadTrack] Cache complete, renamed to: $cachePath');
      }
    } catch (e, stack) {
      logger.e(
        '[PreloadTrack] Failed to preload track: ${track.id}',
        error: e,
        stackTrace: stack,
      );
    } finally {
      _preloadingTracks.remove(track.id);
      _cancelTokens.remove(track.id);
    }
  }

  void cancelPreload(String trackId) {
    final cancelToken = _cancelTokens[trackId];
    if (cancelToken != null && !cancelToken.isCancelled) {
      cancelToken.cancel();
      logger.i('[PreloadTrack] Cancelling preload: $trackId');
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

  bool isPreloading(String trackId) {
    return _preloadingTracks[trackId] == true;
  }
}
