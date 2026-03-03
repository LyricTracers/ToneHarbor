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
    } catch (e) {
      return Response.internalServerError();
    }
  }

  Future<Response> _getStreamSongId(Request request, String songId) async {
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
        body: response.body,
        headers: {
          'content-type': headers['content-type'] ?? 'audio/mpeg',
          'content-length': headers['content-length'] ?? '',
          'accept-ranges': 'bytes',
          if (headers['content-range'] != null)
            'content-range': headers['content-range']!,
        },
      );
    } catch (e) {
      return Response.internalServerError();
    }
  }

  Future<Response> headStreamSongId(Request request, String songId) =>
      _headStreamSongId(request, songId);

  Future<Response> getStreamSongId(Request request, String songId) =>
      _getStreamSongId(request, songId);
}

final playbackRoutesProvider = Provider((ref) => PlaybackRoutes(ref));
