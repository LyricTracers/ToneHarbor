import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/server/playback_routes.dart';

part 'server_provider.g.dart';

class ToneHarborMedia {
  static int serverPort = 0;

  static String get host =>
      Platform.isWindows ? "localhost" : InternetAddress.loopbackIPv4.address;

  static String getStreamUrl(String songId) {
    return "http://$host:$serverPort/stream/$songId";
  }
}

final pipelineProvider = Provider((ref) {
  Pipeline pipeline = const Pipeline();
  if (kDebugMode) {
    pipeline = pipeline.addMiddleware(logRequests());
  }
  return pipeline;
});

final serverRouterProvider = Provider((ref) {
  final playbackRoutes = ref.watch(playbackRoutesProvider);

  final router = Router();

  router.get("/ping", (Request request) => Response.ok("pong"));

  router.head("/stream/<songId>", playbackRoutes.headStreamSongId);
  router.get("/stream/<songId>", playbackRoutes.getStreamSongId);

  return router;
});

@riverpod
Future<HttpServer> server(Ref ref) async {
  final pipeline = ref.watch(pipelineProvider);
  final router = ref.watch(serverRouterProvider);

  HttpServer? server;
  int attempts = 0;
  const maxAttempts = 10;

  while (server == null && attempts < maxAttempts) {
    try {
      final port = Random().nextInt(17500) + 5000;
      ToneHarborMedia.serverPort = port;

      server = await serve(
        pipeline.addHandler(router.call),
        InternetAddress.loopbackIPv4,
        port,
      );

      logger.i(
        'Playback server at http://${server.address.host}:${server.port}',
      );
    } catch (e) {
      attempts++;
      logger.w('Failed to start server on port, attempt $attempts');
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  if (server == null) {
    throw Exception(
      'Failed to start playback server after $maxAttempts attempts',
    );
  }

  ref.onDispose(() {
    server?.close();
  });

  return server;
}
