import 'dart:io';
import 'dart:math';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/server/playback_routes.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'server_provider.g.dart';

final pipelineProvider = Provider<Pipeline>((ref) {
  return const Pipeline().addMiddleware(
    logRequests(
      logger: (message, isError) {
        if (isError) {
          logger.e('[Server Error] $message');
        } else {
          logger.i('[Server Info] $message');
        }
      },
    ),
  );
});

final serverRouterProvider = Provider<Router>((ref) {
  final playbackRoutes = ref.watch(playbackRoutesProvider);
  final router = Router();

  router.get("/ping", (Request request) => Response.ok("pong"));

  router.head("/stream/<songId>", playbackRoutes.headStreamSongId);
  router.get("/stream/<songId>", playbackRoutes.getStreamSongId);
  router.get("/cover/<songId>", playbackRoutes.getCover);
  router.get("/cover-artist/<artistName>", playbackRoutes.getCoverArtist);
  router.get(
    "/cover-album/<albumName>/<artistName>",
    playbackRoutes.getCoverAlbum,
  );
  router.get("/log", getLog);

  return router;
});

Future<Response> getLog(Request request) async {
  final logFilePath = await getLogFilePath();
  final file = File(logFilePath);

  if (!await file.exists()) {
    return Response.notFound("Log file not found");
  }

  return Response(
    200,
    body: file.openRead(),
    headers: {'content-type': 'text/plain; charset=utf-8'},
  );
}

@Riverpod(keepAlive: true)
class ServerController extends _$ServerController {
  Pipeline get _pipeline => ref.read(pipelineProvider);
  Router get _router => ref.read(serverRouterProvider);

  bool _isRestarting = false;

  @override
  Future<HttpServer> build() async {
    final savedPort = SharedPreferencesUtils.getServerPort();
    final server = await _startServer(preferredPort: savedPort);

    ref.onDispose(() {
      ToneHarborMedia.serverPort = 0;
      server.close();
    });

    return server;
  }

  Future<HttpServer> _startServer({int? preferredPort}) async {
    HttpServer? server;
    int attempts = 0;
    const maxAttempts = 10;

    while (server == null && attempts < maxAttempts) {
      final port = attempts == 0 && (preferredPort ?? 0) > 0
          ? preferredPort!
          : Random().nextInt(17500) + 5000;

      try {
        server = await serve(
          _pipeline.addHandler(_router.call),
          ToneHarborMedia.listenHost,
          port,
        );

        ToneHarborMedia.serverPort = port;
        await SharedPreferencesUtils.setServerPort(port);

        logger.i(
          'Playback server started at http://${server.address.host}:${server.port}',
        );
      } catch (e) {
        ToneHarborMedia.serverPort = 0;
        attempts++;
        logger.w('Failed to start server on port $port, attempt $attempts: $e');
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }

    if (server == null) {
      ToneHarborMedia.serverPort = 0;
      throw Exception(
        'Failed to start playback server after $maxAttempts attempts',
      );
    }

    return server;
  }

  bool get isReady => state.hasValue && !state.isLoading && !_isRestarting;

  Future<HttpServer?> restart() async {
    if (_isRestarting) {
      logger.w('[ServerController] Already restarting, skip');
      return null;
    }

    _isRestarting = true;

    try {
      final currentState = state;

      if (currentState.hasValue) {
        try {
          await currentState.value!.close();
        } catch (e) {
          logger.w('[ServerController] Error closing server: $e');
        }
      }

      ToneHarborMedia.serverPort = 0;
      state = const AsyncLoading();

      await Future.delayed(const Duration(milliseconds: 200));

      final server = await _startServer();
      state = AsyncData(server);
      return server;
    } catch (e, stack) {
      state = AsyncError(e, stack);
      logger.e('[ServerController] Restart failed: $e', stackTrace: stack);
      return null;
    } finally {
      _isRestarting = false;
    }
  }
}
