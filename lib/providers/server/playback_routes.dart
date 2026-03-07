import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:rhttp/rhttp.dart' as rhttp;
import 'package:shelf/shelf.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';

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
  final _cachingLocks = <String, bool>{};

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
      logger.i('[PlaybackRoutes] HEAD request for track: $songId');

      final track = _getTrackById(songId);

      if (track == null) {
        logger.e('[PlaybackRoutes] HEAD: Track not found: $songId');
        return Response.notFound("Track not found in current queue");
      }

      if (track is ToneHarborTrackObjectLocal) {
        final file = File(track.path);
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

      final cachePath = await getTrackCachePath(track);
      final cacheFile = File(cachePath);

      if (await cacheFile.exists()) {
        final fileLength = await cacheFile.length();
        logger.i(
          '[PlaybackRoutes] HEAD: Serving cached file: $songId, size: $fileLength',
        );
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

      logger.i('[PlaybackRoutes] HEAD: Forwarding to remote stream: $songId');

      final streamUrl = await ref.read(streamUrlProvider(id: songId).future);
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

      return Response(
        response.statusCode,
        headers: {
          'content-type':
              headers['content-type'] ?? _getMimeType(track.container),
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
      logger.i('[PlaybackRoutes] GET request for track: $songId');

      final track = _getTrackById(songId);

      if (track == null) {
        logger.e('[PlaybackRoutes] GET: Track not found: $songId');
        return Response.notFound("Track not found in current queue");
      }

      logger.i(
        '[PlaybackRoutes] Found track: ${track.id}, container: ${track.container}',
      );

      if (track is ToneHarborTrackObjectLocal) {
        return _serveLocalFile(track);
      }

      final cachePath = await getTrackCachePath(track);
      final cacheFile = File(cachePath);

      if (await cacheFile.exists()) {
        final fileLength = await cacheFile.length();
        logger.i(
          '[PlaybackRoutes] GET: Serving cached file: $songId, size: $fileLength',
        );
        return _serveCachedFile(cacheFile, track);
      }

      logger.i('[PlaybackRoutes] GET: Serving remote stream for: $songId');
      return await _serveRemoteStream(request, songId, track, cachePath);
    } catch (e, stack) {
      logger.e('GET stream error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error: $e');
    }
  }

  Response _serveLocalFile(ToneHarborTrackObjectLocal track) {
    final file = File(track.path);
    final bytes = file.readAsBytesSync();
    final fileLength = bytes.length;

    return Response(
      200,
      body: bytes,
      headers: {
        'content-type': _getMimeType(track.container),
        'content-length': '${fileLength - 1}',
        'accept-ranges': 'bytes',
        'content-range': 'bytes 0-${fileLength - 1}/$fileLength',
        'connection': 'close',
      },
    );
  }

  Response _serveCachedFile(File cacheFile, ToneHarborTrackObject track) {
    final bytes = cacheFile.readAsBytesSync();
    final fileLength = bytes.length;

    return Response(
      200,
      body: bytes,
      headers: {
        'content-type': _getMimeType(track.container),
        'content-length': '${fileLength - 1}',
        'accept-ranges': 'bytes',
        'content-range': 'bytes 0-${fileLength - 1}/$fileLength',
        'connection': 'close',
      },
    );
  }

  Future<Response> _serveRemoteStream(
    Request request,
    String songId,
    ToneHarborTrackObject track,
    String cachePath,
  ) async {
    final streamUrl = await ref.read(streamUrlProvider(id: songId).future);

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

    logger.i('[PlaybackRoutes] Requesting remote stream');

    final rangeHeader = request.headers['range'] ?? 'bytes=0-';

    final response = await downloadHttpClientWrapper.getStream(
      streamUrl,
      headers: rhttp.HttpHeaders.rawMap({...authHeaders, 'range': rangeHeader}),
    );

    final headers = _extractHeaders(response);

    logger.i(
      '[PlaybackRoutes] Remote response status: ${response.statusCode}, headers: $headers',
    );

    if (response.statusCode != 200 && response.statusCode != 206) {
      return Response(response.statusCode, body: 'Remote server error');
    }

    final contentType = headers['content-type'] ?? '';
    if (contentType == 'application/vnd.apple.mpegurl') {
      logger.i('[PlaybackRoutes] M3U8 stream detected, redirecting');
      return Response(
        301,
        headers: {
          'location': streamUrl,
          'content-type': 'application/vnd.apple.mpegurl',
        },
      );
    }

    final resStream = response.body.asBroadcastStream();

    final trackPartialCacheFile = File('$cachePath.part');
    final cacheKey = songId;

    final rangeStart = _parseRangeStart(rangeHeader);
    final isFromStart = rangeStart == 0;

    final isAlreadyCaching = _cachingLocks[cacheKey] == true;
    if (isAlreadyCaching && isFromStart) {
      logger.i('[PlaybackRoutes] Already caching $cacheKey, skip caching');
      return Response(
        response.statusCode,
        body: resStream,
        headers: {
          'content-type':
              headers['content-type'] ?? _getMimeType(track.container),
          'content-length': headers['content-length'] ?? '',
          'accept-ranges': 'bytes',
          if (headers['content-range'] != null)
            'content-range': headers['content-range']!,
        },
      );
    }

    _cachingLocks[cacheKey] = true;

    if (isFromStart) {
      if (await trackPartialCacheFile.exists()) {
        await trackPartialCacheFile.delete();
      }
      await trackPartialCacheFile.create(recursive: true);
    } else {
      if (await trackPartialCacheFile.exists()) {
        final existingLength = await trackPartialCacheFile.length();
        if (existingLength != rangeStart) {
          logger.w(
            '[PlaybackRoutes] Partial file size $existingLength != range start $rangeStart, deleting',
          );
          await trackPartialCacheFile.delete();
          await trackPartialCacheFile.create(recursive: true);
        }
      } else {
        await trackPartialCacheFile.create(recursive: true);
      }
    }

    final writeMode = isFromStart
        ? FileMode.writeOnly
        : FileMode.writeOnlyAppend;

    final partialCacheFileSink = trackPartialCacheFile.openWrite(
      mode: writeMode,
    );

    final contentRange = headers['content-range'] != null
        ? ContentRangeHeader.parse(headers['content-range']!)
        : ContentRangeHeader(0, 0, 0);

    resStream.listen(
      (data) {
        partialCacheFileSink.add(data);
      },
      onError: (e, stack) {
        logger.e(
          '[CacheStream] Error caching stream',
          error: e,
          stackTrace: stack,
        );
        partialCacheFileSink.close();
        _cachingLocks.remove(cacheKey);
      },
      onDone: () async {
        await partialCacheFileSink.close();

        final fileLength = await trackPartialCacheFile.length();
        if (fileLength != contentRange.total) {
          logger.w(
            '[CacheStream] Incomplete download: $fileLength != ${contentRange.total}',
          );
          _cachingLocks.remove(cacheKey);
          return;
        }

        final finalCacheFile = File(cachePath);
        if (await finalCacheFile.exists()) {
          await finalCacheFile.delete();
        }
        await trackPartialCacheFile.rename(cachePath);
        logger.i('[CacheStream] Cache complete: $cachePath');

        await _writeMetadata(track, cachePath, fileLength);
        _cachingLocks.remove(cacheKey);
      },
      cancelOnError: true,
    );

    return Response(
      response.statusCode,
      body: resStream,
      headers: {
        'content-type':
            headers['content-type'] ?? _getMimeType(track.container),
        'content-length': headers['content-length'] ?? '',
        'accept-ranges': 'bytes',
        if (headers['content-range'] != null)
          'content-range': headers['content-range']!,
      },
    );
  }

  void _clearAuthOnFailure() {
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
  }

  Future<void> _writeMetadata(
    ToneHarborTrackObject track,
    String cachePath,
    int fileLength,
  ) async {
    try {
      if (track.container.toLowerCase() == 'weba' ||
          track.container.toLowerCase() == 'webm') {
        return;
      }

      final coverUrl = await ref.read(
        coverUrlProvider(
          albumName: track.album,
          albumArtistName: track.artist,
        ).future,
      );

      Uint8List? imageBytes;
      if (coverUrl.isNotEmpty) {
        imageBytes = await _getCoverBytes(coverUrl);
      }

      final metadata = track.toMetadata(
        fileLength: fileLength,
        imageBytes: imageBytes,
      );

      await MetadataGod.writeMetadata(file: cachePath, metadata: metadata);
      logger.i('[Metadata] Written metadata for: $cachePath');
    } catch (e, stack) {
      logger.e(
        '[Metadata] Failed to write metadata',
        error: e,
        stackTrace: stack,
      );
    }
  }

  Future<Uint8List?> _getCoverBytes(String coverUrl) async {
    try {
      final coverCacheDir = await getMusicCacheDir();
      final coverCachePath = '$coverCacheDir/covers';
      final coverCacheDir2 = Directory(coverCachePath);
      if (!await coverCacheDir2.exists()) {
        await coverCacheDir2.create(recursive: true);
      }

      final cacheKey = coverUrl.hashCode.toString();
      final cacheFile = File('$coverCachePath/$cacheKey');

      if (await cacheFile.exists()) {
        logger.i('[Metadata] Using cached cover: $cacheKey');
        return await cacheFile.readAsBytes();
      }

      final authHeaders = await ref.read(authHeadersProvider.future);
      if (authHeaders == null) {
        return null;
      }

      final response = await downloadHttpClientWrapper.getBytes(
        coverUrl,
        headers: rhttp.HttpHeaders.rawMap({
          ...authHeaders,
          'accept': 'image/*',
        }),
      );

      final bytes = response.body;
      await cacheFile.writeAsBytes(bytes);
      logger.i('[Metadata] Cached cover: $cacheKey');
      return bytes;
    } catch (e) {
      logger.w('[Metadata] Failed to get cover: $e');
      return null;
    }
  }

  Future<Response> getCover(
    Request request,
    String albumName,
    String artistName,
  ) async {
    try {
      final coverUrl = await ref.read(
        coverUrlProvider(
          albumName: Uri.decodeComponent(albumName),
          albumArtistName: Uri.decodeComponent(artistName),
        ).future,
      );

      if (coverUrl.isEmpty) {
        return Response.notFound("Cover not found");
      }

      final imageBytes = await _getCoverBytes(coverUrl);
      if (imageBytes == null) {
        return Response.notFound("Cover not found");
      }

      return Response(
        200,
        body: imageBytes,
        headers: {
          'content-type': 'image/jpeg',
          'content-length': '${imageBytes.length}',
          'cache-control': 'public, max-age=86400',
        },
      );
    } catch (e, stack) {
      logger.e('GET cover error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error');
    }
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
