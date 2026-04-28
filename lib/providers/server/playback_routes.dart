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

  Future<Response> _buildHeadForLocalFile(File file, String container) async {
    final fileLength = await file.length();
    return Response(
      206,
      headers: {
        'content-type': _getMimeType(container),
        'content-length': '$fileLength',
        'accept-ranges': 'bytes',
        'content-range': 'bytes 0-${fileLength - 1}/$fileLength',
      },
    );
  }

  Response _buildHeadFromRemoteResponse(
    rhttp.HttpTextResponse response, {
    String fallbackMimeType = 'audio/mpeg',
  }) {
    final headers = <String, String>{};
    for (final header in response.headers) {
      headers[header.$1.toLowerCase()] = header.$2;
    }
    return Response(
      response.statusCode,
      headers: {
        'content-type': headers['content-type'] ?? fallbackMimeType,
        if (headers['content-length'] != null)
          'content-length': headers['content-length']!,
        'accept-ranges': 'bytes',
        if (headers['content-range'] != null)
          'content-range': headers['content-range']!,
      },
    );
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
        if (headers['content-length'] != null)
          'content-length': headers['content-length']!,
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
        return await _buildHeadForLocalFile(file, track.container);
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
            final extension = cacheFile.path.split('.').last.toLowerCase();
            return await _buildHeadForLocalFile(cacheFile, extension);
          }
        }

        final cid = int.tryParse(track.id);
        if (cid == null) return Response.notFound("Invalid song ID");

        final songUrlData = await getSongUrl(ref, songId: cid);
        if (songUrlData == null || songUrlData.url.isEmpty) {
          return Response.notFound("Failed to get song URL");
        }

        try {
          final response = await downloadHttpClientWrapper.head(
            songUrlData.url,
            headers: rhttp.HttpHeaders.rawMap({'range': 'bytes=0-'}),
          );
          return _buildHeadFromRemoteResponse(
            response,
            fallbackMimeType: _getMimeType(songUrlData.fileExtension),
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
        final actualContainer = cacheFile.path.split('.').last;
        return await _buildHeadForLocalFile(cacheFile, actualContainer);
      }

      final streamUrl = await ref.read(
        streamUrlProvider(id: songId, container: track.container).future,
      );
      if (streamUrl.isEmpty) return Response.notFound("Stream URL not found");

      final authHeaders = ref.read(authHeadersProvider);
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

      final actualContainer = quality.isTranscode ? 'mp3' : track.container;
      return _buildHeadFromRemoteResponse(
        response,
        fallbackMimeType: _getMimeType(actualContainer),
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
        return await _serveLocalFile(request, track);
      }

      if (track.isCloudMusic) {
        return await _serveCloudMusicStream(request, track);
      }

      final quality = ref.read(audioQualityProvider);
      String cachePath = getTrackCachePath(track, quality);
      final cacheFile = File(cachePath);

      if (await cacheFile.exists()) {
        logger.i('[PlaybackRoutes] Serving from cache: $cachePath');
        return await _serveCachedFile(request, cacheFile, quality);
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
        return await _serveCachedFile(request, cacheFile, AudioQuality.high);
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

    final response = await downloadHttpClientWrapper.getStream(
      songUrlData.url,
      headers: rhttp.HttpHeaders.rawMap({'range': rangeHeader}),
    );

    final headers = _extractHeaders(response);
    logger.i(
      '[PlaybackRoutes] Upstream response: statusCode=${response.statusCode}, '
      'content-range=${headers['content-range']}, '
      'content-length=${headers['content-length']}',
    );

    if (response.statusCode != 200 && response.statusCode != 206) {
      return Response(response.statusCode, body: 'Remote server error');
    }

    final resStream = response.body.asBroadcastStream();
    final actualContainer = container;

    int? totalSize;
    if (headers['content-range'] != null) {
      try {
        totalSize = ContentRangeHeader.parse(headers['content-range']!).total;
      } catch (_) {}
    } else if (headers['content-length'] != null) {
      totalSize = int.tryParse(headers['content-length']!);
    }

    if (totalSize == null) {
      try {
        final headResponse = await downloadHttpClientWrapper.head(
          songUrlData.url,
        );
        final headHeaders = <String, String>{};
        for (final header in headResponse.headers) {
          headHeaders[header.$1.toLowerCase()] = header.$2;
        }
        if (headHeaders['content-length'] != null) {
          totalSize = int.tryParse(headHeaders['content-length']!);
          logger.i(
            '[PlaybackRoutes] HEAD request got content-length: $totalSize',
          );
        }
      } catch (e) {
        logger.w('[PlaybackRoutes] HEAD request failed: $e');
      }
    }

    if (totalSize != null && headers['content-length'] == null) {
      headers['content-length'] = '$totalSize';
    }

    final partialCacheFile = File(
      getTrackCachePathPart(track, AudioQuality.high, specialPath: "partial"),
    );

    // Free trial 不缓存
    if (songUrlData.isFreeTrial) {
      logger.w(
        '[PlaybackRoutes] Free trial song, streaming without cache: ${track.id}',
      );
      return _buildStreamResponse(
        statusCode: response.statusCode,
        body: resStream,
        headers: headers,
        actualContainer: actualContainer,
      );
    }

    return _cacheStreamResponse(
      request: request,
      resStream: resStream,
      headers: headers,
      statusCode: response.statusCode,
      track: track,
      cachePath: cachePath,
      partialCacheFile: partialCacheFile,
      cacheKey: cachePath,
      totalSize: totalSize,
      actualContainer: actualContainer,
      quality: AudioQuality.high,
      checkPartialOnNonStart: true,
      onFinalize: (path, length) async {
        await LocalMusicStateService.addToLocalMusicState(
          ref.read(appDatabaseProvider),
          track,
          AudioQuality.high,
          actualContainer: actualContainer,
          actualFileSize: length,
          actualBitrate: songUrlData.bitrate,
        );
        await writeTrackMetadata(
          ref: ref,
          track: track,
          cachePath: path,
          fileLength: length,
        );
      },
    );
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

  Future<void> _finalizeCache({
    required Ref ref,
    required ToneHarborTrackObject track,
    required AudioQuality quality,
    required String cachePath,
    required String actualContainer,
    required int fileLength,
  }) async {
    try {
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
      logger.i('[Cache] Successfully finalized cache: $cachePath');
    } catch (e, s) {
      logger.e(
        '[Cache] Failed to update database/metadata for $cachePath',
        error: e,
        stackTrace: s,
      );
      // 不抛出异常，缓存文件仍可用
    }
  }

  Future<Response> _cacheStreamResponse({
    required Request request,
    required Stream<List<int>> resStream,
    required Map<String, String> headers,
    required int statusCode,
    required ToneHarborTrackObject track,
    required String cachePath,
    required File partialCacheFile,
    required String cacheKey,
    required int? totalSize,
    required String actualContainer,
    required AudioQuality quality,
    required Future<void> Function(String path, int length) onFinalize,
    bool checkPartialOnNonStart = false,
  }) async {
    final rangeHeader = request.headers['range'] ?? 'bytes=0-';
    final rangeStart = _parseRangeStart(rangeHeader);
    final isFromStart = rangeStart == 0;
    logger.i(
      '[PlaybackRoutes] Range processing: rangeStart=$rangeStart, isFromStart=$isFromStart',
    );

    final finalCacheFile = File(cachePath);

    // 非从头请求
    if (!isFromStart) {
      if (checkPartialOnNonStart &&
          totalSize != null &&
          await partialCacheFile.exists()) {
        final partLength = await partialCacheFile.length();
        if (partLength == totalSize) {
          if (!await finalCacheFile.exists()) {
            await partialCacheFile.rename(cachePath);
            await onFinalize(cachePath, partLength);
            return await _serveCachedFile(request, finalCacheFile, quality);
          } else {
            await partialCacheFile.delete();
          }
        }
      }
      return _buildStreamResponse(
        statusCode: statusCode,
        body: resStream,
        headers: headers,
        actualContainer: actualContainer,
      );
    }

    // --- 以下均为从头请求（Range: bytes=0-）逻辑 ---

    // 检查最终缓存是否存在（无锁检查，快速路径）
    try {
      if (await finalCacheFile.exists()) {
        logger.i('[PlaybackRoutes] Final cache exists, serving local file');
        return await _serveCachedFile(request, finalCacheFile, quality);
      }
    } catch (e) {
      logger.w(
        '[PlaybackRoutes] Failed to check final cache, will stream',
        error: e,
      );
    }

    // 放弃缓存的快速路径：无法确定 totalSize 或 totalSize 为 0
    if (totalSize == null || totalSize == 0) {
      logger.w(
        '[PlaybackRoutes] No valid totalSize ($totalSize), skipping cache',
      );
      return _buildStreamResponse(
        statusCode: statusCode,
        body: resStream,
        headers: headers,
        actualContainer: actualContainer,
      );
    }

    // 尝试获取缓存锁
    if (!CacheLockManager.instance.tryLock(cacheKey)) {
      logger.i(
        '[PlaybackRoutes] Another request is caching $cacheKey, streaming directly',
      );
      return _buildStreamResponse(
        statusCode: statusCode,
        body: resStream,
        headers: headers,
        actualContainer: actualContainer,
      );
    }

    var lockReleased = false;
    void releaseLock() {
      if (!lockReleased) {
        lockReleased = true;
        CacheLockManager.instance.unlock(cacheKey);
      }
    }

    StreamSubscription<List<int>>? subscription;
    var sinkClosed = false;
    var controllerClosed = false;
    StreamController<List<int>>? responseStreamController;
    IOSink? partialCacheFileSink;

    Future<void> closeSink() async {
      if (!sinkClosed) {
        sinkClosed = true;
        try {
          await partialCacheFileSink?.flush();
        } catch (_) {}
        try {
          await partialCacheFileSink?.close();
        } catch (_) {}
      }
    }

    Future<void> closeController() async {
      if (!controllerClosed) {
        controllerClosed = true;
        try {
          await responseStreamController?.close();
        } catch (_) {}
      }
    }

    Future<void> deletePartialFile() async {
      try {
        if (await partialCacheFile.exists()) {
          await partialCacheFile.delete();
        }
      } catch (e) {
        logger.w('[PlaybackRoutes] Failed to delete partial file', error: e);
      }
    }

    Future<void> performCleanup() async {
      await closeSink();
      await deletePartialFile();
      await closeController();
    }

    Future<void> fullCleanup() async {
      await subscription?.cancel();
      await performCleanup();
      releaseLock();
    }

    var cleanupCalled = false;
    Future<void> cleanupOnce() async {
      if (cleanupCalled) return;
      cleanupCalled = true;
      await fullCleanup();
    }

    try {
      if (await partialCacheFile.exists()) {
        final partLength = await partialCacheFile.length();
        logger.i(
          '[PlaybackRoutes] Partial cache exists: partLength=$partLength, totalSize=$totalSize',
        );
        if (partLength == totalSize) {
          if (!await finalCacheFile.exists()) {
            await partialCacheFile.rename(cachePath);
            await onFinalize(cachePath, partLength);
            releaseLock();
            logger.i(
              '[PlaybackRoutes] Partial cache complete, serving final cache',
            );
            return await _serveCachedFile(request, finalCacheFile, quality);
          } else {
            await partialCacheFile.delete();
            releaseLock();
            logger.i('[PlaybackRoutes] Final cache already exists, serving it');
            return await _serveCachedFile(request, finalCacheFile, quality);
          }
        }
        logger.w(
          '[PlaybackRoutes] Partial cache incomplete, deleting and re-downloading',
        );
        await partialCacheFile.delete();
      }

      logger.i('[PlaybackRoutes] Creating new partial cache file');
      await partialCacheFile.create(recursive: true);
      partialCacheFileSink = partialCacheFile.openWrite(
        mode: FileMode.writeOnly,
      );
      responseStreamController = StreamController<List<int>>();

      subscription = resStream.listen(
        (data) {
          if (!sinkClosed) partialCacheFileSink?.add(data);
          if (!controllerClosed) responseStreamController?.add(data);
        },
        onError: (e, stack) {
          logger.e(
            '[CacheStream] Error caching stream',
            error: e,
            stackTrace: stack,
          );
          if (!controllerClosed) responseStreamController?.addError(e, stack);
        },
        onDone: () async {
          try {
            await closeSink();
            final fileLength = await partialCacheFile.length();
            if (fileLength != totalSize) {
              logger.w(
                '[CacheStream] Incomplete download: $fileLength (expected: $totalSize)',
              );
              await cleanupOnce();
              return;
            }
            if (await finalCacheFile.exists()) {
              try {
                await finalCacheFile.delete();
              } catch (_) {}
            }
            await partialCacheFile.rename(cachePath);
            await onFinalize(cachePath, fileLength);
            await closeController();
            releaseLock();
          } catch (e, s) {
            logger.e(
              '[CacheStream] Finalization error',
              error: e,
              stackTrace: s,
            );
            await closeSink();
            await deletePartialFile();
            await closeController();
            releaseLock();
          }
        },
        cancelOnError: true,
      );

      responseStreamController.onCancel = () async => await cleanupOnce();

      return _buildStreamResponse(
        statusCode: statusCode,
        body: responseStreamController.stream,
        headers: headers,
        actualContainer: actualContainer,
      );
    } catch (e, s) {
      logger.e('[PlaybackRoutes] Setup failed', error: e, stackTrace: s);
      await performCleanup();
      releaseLock();
      return Response.internalServerError(body: 'Stream setup error');
    }
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

    final authHeaders = ref.read(authHeadersProvider);
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
      '[PlaybackRoutes] Upstream response: statusCode=${response.statusCode}, '
      'content-range=${headers['content-range']}, '
      'content-length=${headers['content-length']}',
    );

    if (response.statusCode != 200 && response.statusCode != 206) {
      return Response(response.statusCode, body: 'Remote server error');
    }

    final contentType = headers['content-type'] ?? '';
    if (contentType == 'application/vnd.apple.mpegurl') {
      return _buildStreamResponse(
        statusCode: response.statusCode,
        body: response.body.asBroadcastStream(),
        headers: headers,
        actualContainer: 'm3u8',
      );
    }

    final resStream = response.body.asBroadcastStream();
    final actualContainer = quality.isTranscode ? 'mp3' : track.container;

    int? totalSize;
    if (response.statusCode == 206) {
      if (headers['content-range'] != null) {
        try {
          totalSize = ContentRangeHeader.parse(headers['content-range']!).total;
        } catch (_) {}
      }
    } else {
      totalSize = headers['content-length'] != null
          ? int.tryParse(headers['content-length']!)
          : null;
    }

    if (totalSize == null) {
      try {
        final headResponse = await downloadHttpClientWrapper.head(
          streamUrl,
          headers: rhttp.HttpHeaders.rawMap(authHeaders),
        );
        final headHeaders = <String, String>{};
        for (final header in headResponse.headers) {
          headHeaders[header.$1.toLowerCase()] = header.$2;
        }
        if (headHeaders['content-length'] != null) {
          totalSize = int.tryParse(headHeaders['content-length']!);
          logger.i(
            '[PlaybackRoutes] HEAD request got content-length: $totalSize',
          );
        }
      } catch (e) {
        logger.w('[PlaybackRoutes] HEAD request failed: $e');
      }
    }

    if (totalSize != null && headers['content-length'] == null) {
      headers['content-length'] = '$totalSize';
    }

    return _cacheStreamResponse(
      request: request,
      resStream: resStream,
      headers: headers,
      statusCode: response.statusCode,
      track: track,
      cachePath: cachePath,
      partialCacheFile: File(
        getTrackCachePathPart(track, quality, specialPath: "partial"),
      ),
      cacheKey: getTrackCachePathPart(track, quality, specialPath: "partial"),
      totalSize: totalSize,
      actualContainer: actualContainer,
      quality: quality,
      onFinalize: (path, length) => _finalizeCache(
        ref: ref,
        track: track,
        quality: quality,
        cachePath: path,
        actualContainer: actualContainer,
        fileLength: length,
      ),
    );
  }

  // 辅助函数：解析 Range 头起始字节
  int _parseRangeStart(String rangeHeader) {
    final match = RegExp(r'bytes=(\d+)-').firstMatch(rangeHeader);
    if (match != null) {
      return int.tryParse(match.group(1)!) ?? 0;
    }
    return 0;
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
