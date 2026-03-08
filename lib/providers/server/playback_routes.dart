import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rhttp/rhttp.dart' as rhttp;
import 'package:shelf/shelf.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
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

      final quality = ref.read(audioQualityProvider);
      final cachePath = await getTrackCachePath(track, quality);
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
            'content-range': 'bytes 0-$fileLength/$fileLength',
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

      if (track is ToneHarborTrackObjectLocal) {
        return _serveLocalFile(track);
      }

      final quality = ref.read(audioQualityProvider);
      final cachePath = await getTrackCachePath(track, quality);
      final cacheFile = File(cachePath);

      if (await cacheFile.exists()) {
        return _serveCachedFile(cacheFile, quality);
      }

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

  Response _serveCachedFile(File cacheFile, AudioQuality quality) {
    final bytes = cacheFile.readAsBytesSync();
    final fileLength = bytes.length;
    final actualContainer = cacheFile.path.split('.').last;

    return Response(
      200,
      body: bytes,
      headers: {
        'content-type': _getMimeType(actualContainer),
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

    final response = await downloadHttpClientWrapper.getStream(
      streamUrl,
      headers: rhttp.HttpHeaders.rawMap({...authHeaders, 'range': rangeHeader}),
    );

    final headers = _extractHeaders(response);

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

    final trackPartialCacheFile = File('$cachePath.part');
    final cacheKey = cachePath;
    final actualContainer = quality.isTranscode ? 'mp3' : track.container;

    final rangeStart = _parseRangeStart(rangeHeader);
    final isFromStart = rangeStart == 0;

    final contentRange = headers['content-range'] != null
        ? ContentRangeHeader.parse(headers['content-range']!)
        : ContentRangeHeader(0, 0, 0);

    if (!isFromStart) {
      if (await trackPartialCacheFile.exists()) {
        final partLength = await trackPartialCacheFile.length();
        if (partLength == contentRange.total) {
          final finalCacheFile = File(cachePath);
          if (!await finalCacheFile.exists()) {
            await trackPartialCacheFile.rename(cachePath);
          } else {
            await trackPartialCacheFile.delete();
          }
        }
      }
      return Response(
        response.statusCode,
        body: resStream,
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

    final isAlreadyCaching = _cachingLocks[cacheKey] == true;
    if (isAlreadyCaching) {
      return Response(
        response.statusCode,
        body: resStream,
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

    _cachingLocks[cacheKey] = true;

    if (await trackPartialCacheFile.exists()) {
      final partLength = await trackPartialCacheFile.length();
      if (partLength == contentRange.total) {
        final finalCacheFile = File(cachePath);
        if (!await finalCacheFile.exists()) {
          await trackPartialCacheFile.rename(cachePath);
        } else {
          await trackPartialCacheFile.delete();
        }
        _cachingLocks.remove(cacheKey);
        return Response(
          response.statusCode,
          body: resStream,
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
      await trackPartialCacheFile.delete();
    }
    await trackPartialCacheFile.create(recursive: true);

    final partialCacheFileSink = trackPartialCacheFile.openWrite(
      mode: FileMode.writeOnly,
    );

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

        await writeTrackMetadata(
          ref: ref,
          track: track,
          cachePath: cachePath,
          fileLength: fileLength,
        );
        _cachingLocks.remove(cacheKey);
      },
      cancelOnError: true,
    );

    return Response(
      response.statusCode,
      body: resStream,
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

  void _clearAuthOnFailure() {
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
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
