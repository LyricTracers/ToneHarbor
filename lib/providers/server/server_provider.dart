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

part 'server_provider.g.dart';

final pipelineProvider = Provider((ref) {
  Pipeline pipeline = const Pipeline();
  pipeline = pipeline.addMiddleware(
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
  return pipeline;
});

final serverRouterProvider = Provider((ref) {
  final playbackRoutes = ref.watch(playbackRoutesProvider);

  final router = Router();

  router.get("/ping", (Request request) => Response.ok("pong"));

  router.head("/stream/<songId>", playbackRoutes.headStreamSongId);
  router.get("/stream/<songId>", playbackRoutes.getStreamSongId);
  router.get("/cover/<songId>", playbackRoutes.getCover);
  router.get(
    "/cover-album/<albumName>/<artistName>",
    playbackRoutes.getCoverAlbum,
  );

  return router;
});

@keepAlive
Future<HttpServer> server(Ref ref) async {
  final pipeline = ref.watch(pipelineProvider);
  final router = ref.watch(serverRouterProvider);

  HttpServer? server;
  int attempts = 0;
  const maxAttempts = 10;

  while (server == null && attempts < maxAttempts) {
    try {
      final port = Random().nextInt(17500) + 5000;

      server = await serve(
        pipeline.addHandler(router.call),
        InternetAddress.loopbackIPv4,
        port,
      );

      ToneHarborMedia.serverPort = port;

      logger.i(
        'Playback server started at http://${server.address.host}:${server.port}',
      );
    } catch (e) {
      ToneHarborMedia.serverPort = 0;
      attempts++;
      logger.w('Failed to start server on port, attempt $attempts');
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  if (server == null) {
    ToneHarborMedia.serverPort = 0;
    throw Exception(
      'Failed to start playback server after $maxAttempts attempts',
    );
  }

  ref.onDispose(() async {
    try {
      ToneHarborMedia.serverPort = 0;
      await server?.close();
    } catch (e) {
      // Ignore errors during dispose
    }
  });

  return server;
}
