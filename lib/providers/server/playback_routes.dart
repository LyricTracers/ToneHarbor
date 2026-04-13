import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:rhttp/rhttp.dart' as rhttp;
import 'package:shelf/shelf.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/audio_player/cache_lock_manager.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/services/cloud_music/song_url.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/metadata_utils.dart';

class ContentRangeHeader {
  final int start;
  final int end;
  final int total;

  ContentRangeHeader(this.start, this.end, this.total);

  factory ContentRangeHeader.parse(String value) {
    if (value.isEmpty) {
      throw FormatException('Invalid Content-Range header: $value');
    }

    final parts = value.split(' ');
    if (parts.length != 2) {
      throw FormatException('Invalid Content-Range header: $value');
    }

    final rangeParts = parts[1].split('/');
    if (rangeParts.length != 2) {
      throw FormatException('Invalid Content-Range header: $value');
    }

    final range = rangeParts[0].split('-');
    if (range.length != 2) {
      throw FormatException('Invalid Content-Range header: $value');
    }

    return ContentRangeHeader(
      int.parse(range[0]),
      int.parse(range[1]),
      int.parse(rangeParts[1]),
    );
  }
}

class PlaybackRoutes {
  final Ref ref;

  PlaybackRoutes(this.ref);

  int _parseRangeStart(String rangeHeader) {
    if (rangeHeader.isEmpty) return 0;
    final parts = rangeHeader.split('=');
    if (parts.length != 2) return 0;
    final range = parts[1].split('-');
    if (range.isEmpty) return 0;
    return int.tryParse(range[0]) ?? 0;
  }

  String _getMimeType(String container) {
    return switch (container.toLowerCase()) {
      'mp3' => 'audio/mpeg',
      'flac' => 'audio/flac',
      'wav' => 'audio/wav',
      'm4a' => 'audio/mp4',
      'mp4' => 'audio/mp4',
      'aac' => 'audio/aac',
      'ogg' => 'audio/ogg',
      'oga' => 'audio/ogg',
      'opus' => 'audio/opus',
      'webm' => 'audio/webm',
      'weba' => 'audio/webm',
      'wma' => 'audio/x-ms-wma',
      'ape' => 'audio/x-ape',
      'alac' => 'audio/alac',
      _ => 'audio/mpeg',
    };
  }

  Map<String, String> _extractHeaders(rhttp.HttpStreamResponse response) {
    final headers = <String, String>{};
    for (final header in response.headers) {
      headers[header.$1.toLowerCase()] = header.$2;
    }
    return headers;
  }

  Response _buildStreamResponse({
    required int statusCode,
    required Stream<List<int>> body,
    required Map<String, String> headers,
    required String actualContainer,
  }) {
    logger.i(
      '[PlaybackRoutes] _buildStreamResponse: statusCode=$statusCode, content-type=${headers['content-type']}, content-length=${headers['content-length']}, content-range=${headers['content-range']}',
    );
    return Response(
      statusCode,
      body: body,
      headers: {
        'content-type':
            headers['content-type'] ?? _getMimeType(actualContainer),
        'content-length': headers['content-length'] ?? '',
        'accept-ranges': 'bytes',
        if (headers['content-range'] != null)
          'content-range': headers['content-range']!,
      },
    );
  }

  ToneHarborTrackObject? _getTrackById(String trackId) {
    final tracks = ref.read(audioPlayerStateProvider).tracks;

    for (final track in tracks) {
      if (track.id == trackId) {
        return track;
      }
    }

    final medias = audioPlayer.playlist.medias;
    for (final media in medias) {
      final mediaTrack = ToneHarborMedia.media(media).track;
      if (mediaTrack.id == trackId) {
        return mediaTrack;
      }
    }

    return null;
  }

  Future<Response> headStreamSongId(Request request, String songId) async {
    try {
      final track = _getTrackById(songId);

      if (track == null) {
        logger.e('[PlaybackRoutes] HEAD: Track not found: $songId');
        return Response.notFound("Track not found in current queue");
      }

      if (track.isLocal) {
        final file = File(await track.getPath());
        if (!await file.exists()) {
          return Response.notFound("Local file not found");
        }
        final fileLength = await file.length();
        return Response(
          200,
          headers: {
            'content-type': _getMimeType(track.container),
            'content-length': '$fileLength',
            'accept-ranges': 'bytes',
            'content-range': 'bytes 0-$fileLength/$fileLength',
          },
        );
      }

      if (track.isCloudMusic) {
        final cachedPath = await findCloudMusicCachePath(
          track.id,
          track.title,
          track.artist,
        );
        if (cachedPath != null) {
          final cacheFile = File(cachedPath);
          if (await cacheFile.exists()) {
            final fileLength = await cacheFile.length();
            final extension = cacheFile.path.split('.').last.toLowerCase();
            return Response(
              200,
              headers: {
                'content-type': _getMimeType(extension),
                'content-length': '$fileLength',
                'accept-ranges': 'bytes',
              },
            );
          }
        }

        final songId = int.tryParse(track.id);
        if (songId == null) {
          return Response.notFound("Invalid song ID");
        }

        final songUrlData = await getSongUrl(ref, songId: songId);
        if (songUrlData == null || songUrlData.url.isEmpty) {
          return Response.notFound("Failed to get song URL");
        }

        try {
          final response = await downloadHttpClientWrapper.head(
            songUrlData.url,
            headers: rhttp.HttpHeaders.rawMap({'range': 'bytes=0-'}),
          );

          final headers = <String, String>{};
          for (final header in response.headers) {
            headers[header.$1.toLowerCase()] = header.$2;
          }

          return Response(
            response.statusCode,
            headers: {
              'content-type':
                  headers['content-type'] ??
                  _getMimeType(songUrlData.fileExtension),
              'content-length': headers['content-length'] ?? '',
              'accept-ranges': 'bytes',
              if (headers['content-range'] != null)
                'content-range': headers['content-range']!,
            },
          );
        } catch (e) {
          logger.e('[PlaybackRoutes] HEAD cloud music error: $e');
          return Response.notFound("Failed to get song info");
        }
      }

      final quality = ref.read(audioQualityProvider);
      final cachePath = getTrackCachePath(track, quality);
      final cacheFile = File(cachePath);

      if (await cacheFile.exists()) {
        final fileLength = await cacheFile.length();
        final actualContainer = cacheFile.path.split('.').last;
        return Response(
          200,
          headers: {
            'content-type': _getMimeType(actualContainer),
            'content-length': '$fileLength',
            'accept-ranges': 'bytes',
          },
        );
      }

      final streamUrl = await ref.read(
        streamUrlProvider(id: songId, container: track.container).future,
      );
      if (streamUrl.isEmpty) {
        return Response.notFound("Stream URL not found");
      }

      final authHeaders = await ref.read(authHeadersProvider.future);
      if (authHeaders == null) {
        _clearAuthOnFailure();
        return Response.forbidden("Not authenticated");
      }

      final response = await downloadHttpClientWrapper.head(
        streamUrl,
        headers: rhttp.HttpHeaders.rawMap({
          ...authHeaders,
          'range': 'bytes=0-',
        }),
      );

      final headers = <String, String>{};
      for (final header in response.headers) {
        headers[header.$1.toLowerCase()] = header.$2;
      }

      final actualContainer = quality.isTranscode ? 'mp3' : track.container;

      return Response(
        response.statusCode,
        headers: {
          'content-type':
              headers['content-type'] ?? _getMimeType(actualContainer),
          'content-length': headers['content-length'] ?? '',
          'accept-ranges': 'bytes',
          if (headers['content-range'] != null)
            'content-range': headers['content-range']!,
        },
      );
    } catch (e, stack) {
      logger.e('HEAD stream error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error');
    }
  }

  Future<Response> getStreamSongId(Request request, String songId) async {
    try {
      final track = _getTrackById(songId);

      if (track == null) {
        logger.e('[PlaybackRoutes] GET: Track not found: $songId');
        return Response.notFound("Track not found in current queue");
      }

      if (track.isLocal) {
        return _serveLocalFile(request, track);
      }

      if (track.isCloudMusic) {
        return _serveCloudMusicStream(request, track);
      }

      final quality = ref.read(audioQualityProvider);
      String cachePath = getTrackCachePath(track, quality);
      final cacheFile = File(cachePath);

      if (await cacheFile.exists()) {
        logger.i('[PlaybackRoutes] Serving from cache: $cachePath');
        return _serveCachedFile(request, cacheFile, quality);
      }

      logger.i('[PlaybackRoutes] No cache, streaming from remote: $cachePath');

      return await _serveRemoteStream(
        request,
        songId,
        track,
        cachePath,
        quality,
      );
    } catch (e, stack) {
      logger.e(
        '[PlaybackRoutes] GET: stream error',
        error: e,
        stackTrace: stack,
      );
      return Response.internalServerError(body: 'Internal server error: $e');
    }
  }

  Future<Response> _serveCloudMusicStream(
    Request request,
    ToneHarborTrackObject track,
  ) async {
    if (track is! ToneHarborTrackObjectCloudMusic) {
      return Response.notFound("Invalid track type");
    }

    final songId = int.tryParse(track.id);
    if (songId == null) {
      return Response.notFound("Invalid song ID");
    }

    final cachedPath = await findCloudMusicCachePath(
      track.id,
      track.title,
      track.artist,
    );
    if (cachedPath != null) {
      logger.i('[PlaybackRoutes] Serving cloud music from cache: $cachedPath');
      final cacheFile = File(cachedPath);
      if (await cacheFile.exists()) {
        return _serveCachedFile(request, cacheFile, AudioQuality.high);
      }
    }

    final songUrlData = await getSongUrl(
      ref,
      songId: songId,
      skipFreeTrial: false,
    );
    if (songUrlData == null || songUrlData.url.isEmpty) {
      logger.e('[PlaybackRoutes] Failed to get cloud music URL: ${track.id}');
      return Response.notFound("Failed to get song URL");
    }

    final container = songUrlData.fileExtension;
    final cachePath = getCloudMusicCachePath(
      track.id,
      track.title,
      track.artist,
      container,
    );

    final rangeHeader = request.headers['range'] ?? 'bytes=0-';
    logger.i(
      '[PlaybackRoutes] Cloud music stream: songId=${track.id}, range=$rangeHeader',
    );

    try {
      final response = await downloadHttpClientWrapper.getStream(
        songUrlData.url,
        headers: rhttp.HttpHeaders.rawMap({'range': rangeHeader}),
      );

      final headers = _extractHeaders(response);

      if (response.statusCode != 200 && response.statusCode != 206) {
        return Response(response.statusCode, body: 'Remote server error');
      }

      final resStream = response.body.asBroadcastStream();

      final partialCacheFile = File(
        getTrackCachePathPart(track, AudioQuality.high),
      );
      final cacheKey = cachePath;

      final rangeStart = _parseRangeStart(rangeHeader);
      final isFromStart = rangeStart == 0;

      final contentRangeHeader = headers['content-range'];
      final contentLengthHeader = headers['content-length'];
      int? totalSize;
      if (contentRangeHeader != null) {
        try {
          final parsed = ContentRangeHeader.parse(contentRangeHeader);
          totalSize = parsed.total;
        } catch (_) {}
      } else if (contentLengthHeader != null) {
        totalSize = int.tryParse(contentLengthHeader);
      }

      if (!isFromStart) {
        if (totalSize != null && await partialCacheFile.exists()) {
          final partLength = await partialCacheFile.length();
          if (partLength == totalSize) {
            if (!await File(cachePath).exists()) {
              await partialCacheFile.rename(cachePath);
            } else {
              await partialCacheFile.delete();
            }
          }
        }
        return _buildStreamResponse(
          statusCode: response.statusCode,
          body: resStream,
          headers: headers,
          actualContainer: container,
        );
      }

      final shouldCache = !songUrlData.isFreeTrial;
      if (!shouldCache) {
        logger.w(
          '[PlaybackRoutes] Free trial song, streaming without cache: ${track.id}',
        );
        return _buildStreamResponse(
          statusCode: response.statusCode,
          body: resStream,
          headers: headers,
          actualContainer: container,
        );
      }

      final isAlreadyCaching = CacheLockManager.instance.isLocked(cacheKey);
      if (isAlreadyCaching) {
        return _buildStreamResponse(
          statusCode: response.statusCode,
          body: resStream,
          headers: headers,
          actualContainer: container,
        );
      }

      if (!CacheLockManager.instance.tryLock(cacheKey)) {
        logger.w('[PlaybackRoutes] Failed to acquire lock for: $cacheKey');
        return _buildStreamResponse(
          statusCode: response.statusCode,
          body: resStream,
          headers: headers,
          actualContainer: container,
        );
      }

      if (totalSize != null && await partialCacheFile.exists()) {
        final partLength = await partialCacheFile.length();
        if (partLength == totalSize) {
          if (!await File(cachePath).exists()) {
            await partialCacheFile.rename(cachePath);
          } else {
            await partialCacheFile.delete();
          }
          CacheLockManager.instance.unlock(cacheKey);
          return _buildStreamResponse(
            statusCode: response.statusCode,
            body: resStream,
            headers: headers,
            actualContainer: container,
          );
        }
        await partialCacheFile.delete();
      }

      await partialCacheFile.create(recursive: true);
      final partialCacheFileSink = partialCacheFile.openWrite(
        mode: FileMode.writeOnly,
      );

      var lockReleased = false;
      void releaseLock() {
        if (!lockReleased) {
          lockReleased = true;
          CacheLockManager.instance.unlock(cacheKey);
        }
      }

      final responseStreamController = StreamController<List<int>>();

      var cacheFileSinkClosed = false;
      var responseStreamClosed = false;
      Future<void> closeCacheFileSink() async {
        if (!cacheFileSinkClosed) {
          cacheFileSinkClosed = true;
          await partialCacheFileSink.close();
        }
      }

      Future<void> closeResponseStream() async {
        if (!responseStreamClosed) {
          responseStreamClosed = true;
          await responseStreamController.close();
        }
      }

      final subscription = resStream.listen(
        (data) {
          if (!cacheFileSinkClosed) {
            partialCacheFileSink.add(data);
          }
          if (!responseStreamClosed) {
            responseStreamController.add(data);
          }
        },
        onError: (e, stack) {
          logger.e(
            '[CacheStream] Error caching cloud music stream',
            error: e,
            stackTrace: stack,
          );
          closeCacheFileSink();
          if (partialCacheFile.existsSync()) {
            partialCacheFile.deleteSync();
          }
          if (!responseStreamClosed) {
            responseStreamController.addError(e, stack);
          }
          releaseLock();
          closeResponseStream();
        },
        onDone: () async {
          await closeCacheFileSink();

          final fileLength = await partialCacheFile.length();
          final isComplete = totalSize != null
              ? fileLength == totalSize
              : fileLength > 0;
          if (!isComplete) {
            logger.w(
              '[CacheStream] Incomplete download: $fileLength (expected: $totalSize)',
            );
            if (await partialCacheFile.exists()) {
              await partialCacheFile.delete();
            }
            releaseLock();
            await closeResponseStream();
            return;
          }

          if (await File(cachePath).exists()) {
            await File(cachePath).delete();
          }
          await partialCacheFile.rename(cachePath);
          await LocalMusicStateService.addToLocalMusicState(
            ref.read(appDatabaseProvider),
            track,
            AudioQuality.high,
            actualContainer: container,
            actualFileSize: fileLength,
            actualBitrate: songUrlData.bitrate,
          );
          await writeTrackMetadata(
            ref: ref,
            track: track,
            cachePath: cachePath,
            fileLength: fileLength,
          );
          releaseLock();
          await closeResponseStream();
        },
        cancelOnError: true,
      );

      responseStreamController.onCancel = () async {
        await closeCacheFileSink();
        subscription.cancel();
        if (await partialCacheFile.exists()) {
          await partialCacheFile.delete();
        }
        releaseLock();
        await closeResponseStream();
      };

      return _buildStreamResponse(
        statusCode: response.statusCode,
        body: responseStreamController.stream,
        headers: headers,
        actualContainer: container,
      );
    } catch (e, stack) {
      logger.e(
        '[PlaybackRoutes] Cloud music stream error',
        error: e,
        stackTrace: stack,
      );
      return Response.internalServerError(body: 'Internal server error: $e');
    }
  }

  Future<Response> _serveLocalFile(
    Request request,
    ToneHarborTrackObject track,
  ) async {
    final file = File(await track.getPath());
    if (!await file.exists()) {
      return Response.notFound("Local file not found");
    }
    final fileLength = await file.length();
    final rangeHeader = request.headers['range'];

    if (rangeHeader != null) {
      final rangeStart = _parseRangeStart(rangeHeader);
      final rangeEnd = fileLength - 1;
      final stream = file.openRead(rangeStart, rangeEnd + 1);
      return Response(
        206,
        body: stream,
        headers: {
          'content-type': _getMimeType(track.container),
          'content-length': '${rangeEnd - rangeStart + 1}',
          'accept-ranges': 'bytes',
          'content-range': 'bytes $rangeStart-$rangeEnd/$fileLength',
        },
      );
    }

    return Response(
      200,
      body: file.openRead(),
      headers: {
        'content-type': _getMimeType(track.container),
        'content-length': '$fileLength',
        'accept-ranges': 'bytes',
      },
    );
  }

  Future<Response> _serveCachedFile(
    Request request,
    File cacheFile,
    AudioQuality quality,
  ) async {
    if (!await cacheFile.exists()) {
      return Response.notFound("Cache file not found");
    }
    final fileLength = await cacheFile.length();
    logger.i(
      '[PlaybackRoutes] _serveCachedFile: path=${cacheFile.path}, fileLength=$fileLength',
    );
    final actualContainer = cacheFile.path.split('.').last;
    logger.i('[PlaybackRoutes] File extension: $actualContainer');

    final metadataOffset = await MetadataGod.getMetadataOffset(
      file: cacheFile.path,
    );
    logger.i(
      '[PlaybackRoutes] Metadata offset: $metadataOffset, fileLength: $fileLength',
    );

    final rangeHeader = request.headers['range'];
    if (rangeHeader != null) {
      final rangeStart = _parseRangeStart(rangeHeader);
      final adjustedRangeStart = rangeStart + metadataOffset;
      final rangeEnd = fileLength - 1;

      if (adjustedRangeStart >= fileLength) {
        return Response(416, headers: {'content-range': 'bytes */$fileLength'});
      }

      final stream = cacheFile.openRead(adjustedRangeStart, rangeEnd + 1);
      logger.i(
        '[PlaybackRoutes] Serving partial content: original=$rangeStart, adjusted=$adjustedRangeStart, bytes $rangeStart-${fileLength - metadataOffset - 1}/${fileLength - metadataOffset}',
      );
      return Response(
        206,
        body: stream,
        headers: {
          'content-type': _getMimeType(actualContainer),
          'content-length': '${rangeEnd - adjustedRangeStart + 1}',
          'accept-ranges': 'bytes',
          'content-range':
              'bytes $rangeStart-${fileLength - metadataOffset - 1}/${fileLength - metadataOffset}',
        },
      );
    }

    return Response(
      200,
      body: cacheFile.openRead(metadataOffset),
      headers: {
        'content-type': _getMimeType(actualContainer),
        'content-length': '${fileLength - metadataOffset}',
        'accept-ranges': 'bytes',
      },
    );
  }

  Future<Response> _serveRemoteStream(
    Request request,
    String songId,
    ToneHarborTrackObject track,
    String cachePath,
    AudioQuality quality,
  ) async {
    final streamUrl = await ref.read(
      streamUrlProvider(id: songId, container: track.container).future,
    );

    if (streamUrl.isEmpty) {
      logger.e('[PlaybackRoutes] Stream URL is empty for: $songId');
      return Response.notFound("Stream URL not found");
    }

    final authHeaders = await ref.read(authHeadersProvider.future);
    if (authHeaders == null) {
      logger.e('[PlaybackRoutes] No auth headers');
      _clearAuthOnFailure();
      return Response.forbidden("Not authenticated");
    }

    final rangeHeader = request.headers['range'] ?? 'bytes=0-';

    logger.i('[PlaybackRoutes] GET stream: songId=$songId, range=$rangeHeader');

    final response = await downloadHttpClientWrapper.getStream(
      streamUrl,
      headers: rhttp.HttpHeaders.rawMap({...authHeaders, 'range': rangeHeader}),
    );

    final headers = _extractHeaders(response);

    logger.i(
      '[PlaybackRoutes] Upstream response: statusCode=${response.statusCode}, content-range=${headers['content-range']}, content-length=${headers['content-length']}',
    );

    if (response.statusCode != 200 && response.statusCode != 206) {
      return Response(response.statusCode, body: 'Remote server error');
    }

    final contentType = headers['content-type'] ?? '';
    if (contentType == 'application/vnd.apple.mpegurl') {
      return Response(
        301,
        headers: {
          'location': streamUrl,
          'content-type': 'application/vnd.apple.mpegurl',
        },
      );
    }

    final resStream = response.body.asBroadcastStream();
    final cacheKey = getTrackCachePathPart(track, quality);
    final trackPartialCacheFile = File(cacheKey);
    final actualContainer = quality.isTranscode ? 'mp3' : track.container;

    final rangeStart = _parseRangeStart(rangeHeader);
    final isFromStart = rangeStart == 0;

    logger.i(
      '[PlaybackRoutes] Range processing: rangeStart=$rangeStart, isFromStart=$isFromStart',
    );

    final contentRangeHeader = headers['content-range'];
    final contentLengthHeader = headers['content-length'];
    int? totalSize;
    if (contentRangeHeader != null) {
      try {
        final parsed = ContentRangeHeader.parse(contentRangeHeader);
        totalSize = parsed.total;
      } catch (_) {}
    } else if (contentLengthHeader != null) {
      totalSize = int.tryParse(contentLengthHeader);
    }

    if (!isFromStart) {
      if (totalSize != null && await trackPartialCacheFile.exists()) {
        final partLength = await trackPartialCacheFile.length();
        if (partLength == totalSize) {
          if (!await File(cachePath).exists()) {
            await trackPartialCacheFile.rename(cachePath);
          } else {
            await trackPartialCacheFile.delete();
          }
        }
      }
      return _buildStreamResponse(
        statusCode: response.statusCode,
        body: resStream,
        headers: headers,
        actualContainer: actualContainer,
      );
    }

    final isAlreadyCaching = CacheLockManager.instance.isLocked(cacheKey);
    if (isAlreadyCaching) {
      return _buildStreamResponse(
        statusCode: response.statusCode,
        body: resStream,
        headers: headers,
        actualContainer: actualContainer,
      );
    }

    if (!CacheLockManager.instance.tryLock(cacheKey)) {
      logger.w('[PlaybackRoutes] Failed to acquire lock for: $cacheKey');
      return _buildStreamResponse(
        statusCode: response.statusCode,
        body: resStream,
        headers: headers,
        actualContainer: actualContainer,
      );
    }

    if (totalSize != null && await trackPartialCacheFile.exists()) {
      final partLength = await trackPartialCacheFile.length();
      logger.i(
        '[PlaybackRoutes] Partial cache exists: partLength=$partLength, totalSize=$totalSize',
      );
      if (partLength == totalSize) {
        if (!await File(cachePath).exists()) {
          await trackPartialCacheFile.rename(cachePath);
        } else {
          await trackPartialCacheFile.delete();
        }
        CacheLockManager.instance.unlock(cacheKey);
        logger.i(
          '[PlaybackRoutes] Partial cache complete, renaming to final cache',
        );
        return _buildStreamResponse(
          statusCode: response.statusCode,
          body: resStream,
          headers: headers,
          actualContainer: actualContainer,
        );
      }
      logger.w(
        '[PlaybackRoutes] Partial cache incomplete, deleting and re-downloading',
      );
      await trackPartialCacheFile.delete();
    }
    logger.i('[PlaybackRoutes] Creating new partial cache file');
    await trackPartialCacheFile.create(recursive: true);

    final partialCacheFileSink = trackPartialCacheFile.openWrite(
      mode: FileMode.writeOnly,
    );

    var lockReleased = false;
    void releaseLock() {
      if (!lockReleased) {
        lockReleased = true;
        CacheLockManager.instance.unlock(cacheKey);
      }
    }

    final responseStreamController = StreamController<List<int>>();

    var cacheFileSinkClosed = false;
    var responseStreamClosed = false;
    Future<void> closeCacheFileSink() async {
      if (!cacheFileSinkClosed) {
        cacheFileSinkClosed = true;
        await partialCacheFileSink.close();
      }
    }

    Future<void> closeResponseStream() async {
      if (!responseStreamClosed) {
        responseStreamClosed = true;
        await responseStreamController.close();
      }
    }

    final subscription = resStream.listen(
      (data) {
        if (!cacheFileSinkClosed) {
          partialCacheFileSink.add(data);
        }
        if (!responseStreamClosed) {
          responseStreamController.add(data);
        }
      },
      onError: (e, stack) {
        logger.e(
          '[CacheStream] Error caching stream',
          error: e,
          stackTrace: stack,
        );
        closeCacheFileSink();
        if (trackPartialCacheFile.existsSync()) {
          trackPartialCacheFile.deleteSync();
        }
        if (!responseStreamClosed) {
          responseStreamController.addError(e, stack);
        }
        releaseLock();
        closeResponseStream();
      },
      onDone: () async {
        await closeCacheFileSink();

        final fileLength = await trackPartialCacheFile.length();
        final isComplete = totalSize != null
            ? fileLength == totalSize
            : fileLength > 0;
        if (!isComplete) {
          logger.w(
            '[CacheStream] Incomplete download: $fileLength (expected: $totalSize)',
          );
          if (await trackPartialCacheFile.exists()) {
            await trackPartialCacheFile.delete();
          }
          releaseLock();
          await closeResponseStream();
          return;
        }

        if (await File(cachePath).exists()) {
          await File(cachePath).delete();
        }
        await trackPartialCacheFile.rename(cachePath);
        await LocalMusicStateService.addToLocalMusicState(
          ref.read(appDatabaseProvider),
          track,
          quality,
          actualContainer: actualContainer,
        );
        await writeTrackMetadata(
          ref: ref,
          track: track,
          cachePath: cachePath,
          fileLength: fileLength,
        );
        releaseLock();
        await closeResponseStream();
      },
      cancelOnError: true,
    );

    responseStreamController.onCancel = () async {
      await closeCacheFileSink();
      subscription.cancel();
      if (await trackPartialCacheFile.exists()) {
        await trackPartialCacheFile.delete();
      }
      releaseLock();
      await closeResponseStream();
    };

    return _buildStreamResponse(
      statusCode: response.statusCode,
      body: responseStreamController.stream,
      headers: headers,
      actualContainer: actualContainer,
    );
  }

  void _clearAuthOnFailure() {
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      // ref.invalidate(authTokenProvider);
    });
  }

  Future<Response> getCoverArtist(Request request, String artistName) async {
    try {
      final coverUrl = await ref.read(
        coverUrlByArtistProvider(
          artistName: Uri.decodeComponent(artistName),
        ).future,
      );

      if (coverUrl.isEmpty) {
        return Response.notFound("Cover not found");
      }

      final cacheKey = sanitizeCacheKey('${Uri.decodeComponent(artistName)}-');
      final imageBytes = await getCoverBytes(ref, coverUrl, cacheKey);
      if (imageBytes == null) {
        return Response.notFound("Cover not found");
      }

      final contentType = _detectImageContentType(imageBytes);

      return Response(
        200,
        body: imageBytes,
        headers: {
          'content-type': contentType,
          'content-length': '${imageBytes.length}',
          'cache-control': 'public, max-age=86400',
        },
      );
    } catch (e, stack) {
      logger.e('GET cover error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error');
    }
  }

  Future<Response> getCoverAlbum(
    Request request,
    String albumName,
    String artistName,
  ) async {
    try {
      var album = Uri.decodeComponent(albumName);
      var artist = Uri.decodeComponent(artistName);

      final coverUrl = await ref.read(
        coverUrlByAlbumProvider(
          albumName: album,
          albumArtistName: artist,
        ).future,
      );

      if (coverUrl.isEmpty) {
        return Response.notFound("Cover not found");
      }

      final cacheKey = sanitizeCacheKey('$artist-$album');
      final imageBytes = await getCoverBytes(ref, coverUrl, cacheKey);
      if (imageBytes == null) {
        return Response.notFound("Cover not found");
      }

      final contentType = _detectImageContentType(imageBytes);

      return Response(
        200,
        body: imageBytes,
        headers: {
          'content-type': contentType,
          'content-length': '${imageBytes.length}',
          'cache-control': 'public, max-age=86400',
        },
      );
    } catch (e, stack) {
      logger.e('GET cover error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error');
    }
  }

  Future<Response> getCover(Request request, String songId) async {
    try {
      final coverUrl = await ref.read(
        coverUrlBySongIdProvider(songId: songId).future,
      );

      if (coverUrl.isEmpty) {
        return Response.notFound("Cover not found");
      }

      final imageBytes = await getCoverBytes(ref, coverUrl, songId);
      if (imageBytes == null) {
        return Response.notFound("Cover not found");
      }

      final contentType = _detectImageContentType(imageBytes);

      return Response(
        200,
        body: imageBytes,
        headers: {
          'content-type': contentType,
          'content-length': '${imageBytes.length}',
          'cache-control': 'public, max-age=86400',
        },
      );
    } catch (e, stack) {
      logger.e('GET cover error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error');
    }
  }

  String _detectImageContentType(Uint8List bytes) {
    if (bytes.length < 8) return 'image/jpeg';

    final header = bytes.sublist(0, 8);

    if (header[0] == 0xFF && header[1] == 0xD8) {
      return 'image/jpeg';
    }
    if (header[0] == 0x89 &&
        header[1] == 0x50 &&
        header[2] == 0x4E &&
        header[3] == 0x47 &&
        header[4] == 0x0D &&
        header[5] == 0x0A &&
        header[6] == 0x1A &&
        header[7] == 0x0A) {
      return 'image/png';
    }
    if (header[0] == 0x47 && header[1] == 0x49 && header[2] == 0x46) {
      return 'image/gif';
    }
    if (header[0] == 0x52 &&
        header[1] == 0x49 &&
        header[2] == 0x46 &&
        header[3] == 0x46 &&
        bytes.length > 12 &&
        bytes[8] == 0x57 &&
        bytes[9] == 0x45 &&
        bytes[10] == 0x42 &&
        bytes[11] == 0x50) {
      return 'image/webp';
    }
    if (header[0] == 0x42 && header[1] == 0x4D) {
      return 'image/bmp';
    }

    return 'image/jpeg';
  }

  Future<Response> togglePlayback(Request request) async {
    try {
      audioPlayer.isPlaying
          ? await audioPlayer.pause()
          : await audioPlayer.resume();
      return Response.ok("Playback toggled");
    } catch (e, stack) {
      logger.e('Toggle playback error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error');
    }
  }

  Future<Response> previousTrack(Request request) async {
    try {
      await audioPlayer.skipToPrevious();
      return Response.ok("Previous track");
    } catch (e, stack) {
      logger.e('Previous track error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error');
    }
  }

  Future<Response> nextTrack(Request request) async {
    try {
      await audioPlayer.skipToNext();
      return Response.ok("Next track");
    } catch (e, stack) {
      logger.e('Next track error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error');
    }
  }
}

final playbackRoutesProvider = Provider((ref) => PlaybackRoutes(ref));
