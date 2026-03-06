import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rhttp/rhttp.dart';
import 'package:shelf/shelf.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';

class PlaybackRoutes {
  final Ref ref;

  PlaybackRoutes(this.ref);

  Map<String, String> _extractHeaders(HttpResponse response) {
    final headers = <String, String>{};
    for (final header in response.headers) {
      headers[header.$1] = header.$2;
    }
    return headers;
  }

  Future<Response> _headStreamSongId(Request request, String songId) async {
    try {
      final streamUrl = await ref.read(streamUrlProvider(id: songId).future);

      if (streamUrl.isEmpty) {
        return Response.notFound("Stream URL not found");
      }

      final authHeaders = await ref.read(authHeadersProvider.future);
      if (authHeaders == null) {
        Future.microtask(() async {
          await ref
              .read(audioStationCookiesInfoProvider.notifier)
              .clearCookie();
          ref.invalidate(authTokenProvider);
        });
        return Response.forbidden("Not authenticated");
      }

      final response = await downloadHttpClientWrapper.getStream(
        streamUrl,
        headers: HttpHeaders.rawMap({
          ...authHeaders,
          'range': request.headers['range'] ?? 'bytes=0-',
        }),
      );

      final headers = _extractHeaders(response);

      return Response(
        response.statusCode,
        headers: {
          'content-type': headers['content-type'] ?? 'audio/mpeg',
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

  Future<Response> _getStreamSongId(Request request, String songId) async {
    try {
      logger.i("request:${request.url.path},songid:${songId}");
      final streamUrl = await ref.read(streamUrlProvider(id: songId).future);

      if (streamUrl.isEmpty) {
        return Response.notFound("Stream URL not found");
      }

      final authHeaders = await ref.read(authHeadersProvider.future);
      if (authHeaders == null) {
        Future.microtask(() async {
          await ref
              .read(audioStationCookiesInfoProvider.notifier)
              .clearCookie();
          ref.invalidate(authTokenProvider);
        });
        return Response.forbidden("Not authenticated");
      }

      final response = await downloadHttpClientWrapper.getStream(
        streamUrl,
        headers: HttpHeaders.rawMap({
          ...authHeaders,
          'range': request.headers['range'] ?? 'bytes=0-',
        }),
      );

      final headers = _extractHeaders(response);

      return Response(
        response.statusCode,
        body: response.body,
        headers: {
          'content-type': headers['content-type'] ?? 'audio/mpeg',
          'content-length': headers['content-length'] ?? '',
          'accept-ranges': 'bytes',
          if (headers['content-range'] != null)
            'content-range': headers['content-range']!,
        },
      );
    } catch (e, stack) {
      logger.e('GET stream error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error');
    }
  }

  Future<Response> _getCover(
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

      final authHeaders = await ref.read(authHeadersProvider.future);
      if (authHeaders == null) {
        Future.microtask(() async {
          await ref
              .read(audioStationCookiesInfoProvider.notifier)
              .clearCookie();
          ref.invalidate(authTokenProvider);
        });
        return Response.forbidden("Not authenticated");
      }

      final response = await downloadHttpClientWrapper.getStream(
        coverUrl,
        headers: HttpHeaders.rawMap({...authHeaders, 'accept': 'image/*'}),
      );

      if (response.statusCode != 200 && response.statusCode != 206) {
        return Response.notFound("Cover not found");
      }

      final headers = _extractHeaders(response);

      return Response(
        response.statusCode,
        body: response.body,
        headers: {
          'content-type': headers['content-type'] ?? 'image/jpeg',
          'content-length': headers['content-length'] ?? '',
          'cache-control': 'public, max-age=86400',
        },
      );
    } catch (e, stack) {
      logger.e('GET cover error', error: e, stackTrace: stack);
      return Response.internalServerError(body: 'Internal server error');
    }
  }

  Future<Response> headStreamSongId(Request request, String songId) =>
      _headStreamSongId(request, songId);

  Future<Response> getStreamSongId(Request request, String songId) =>
      _getStreamSongId(request, songId);

  Future<Response> getCover(
    Request request,
    String albumName,
    String artistName,
  ) => _getCover(request, albumName, artistName);
}

final playbackRoutesProvider = Provider((ref) => PlaybackRoutes(ref));
