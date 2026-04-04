import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/server/server_provider.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';

final serverHealthCheckProvider = Provider((ref) {
  final service = ServerHealthCheckService(ref);
  ref.onDispose(() => service.dispose());
  return service;
});

class ServerHealthCheckService with WidgetsBindingObserver {
  final Ref _ref;
  Timer? _healthCheckTimer;
  static const int _maxRestartAttempts = 5;

  ServerHealthCheckService(this._ref) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      logger.i('[ServerHealthCheck] App resumed, checking server health...');
      _scheduleCheck();
    }
  }

  void _scheduleCheck() {
    Future.microtask(() => _checkServerHealth());
  }

  Future<bool> _isServerHealthy() async {
    final port = ToneHarborMedia.serverPort;
    if (port == 0) {
      logger.i('[ServerHealthCheck] Server port is 0, server not running');
      return false;
    }

    HttpClient? client;
    try {
      client = HttpClient();
      final request = await client
          .getUrl(Uri.parse('http://${ToneHarborMedia.listenHost}:$port/ping'))
          .timeout(const Duration(seconds: 1));
      final response = await request.close().timeout(
        const Duration(seconds: 1),
      );
      await response.drain();
      return response.statusCode == 200;
    } on TimeoutException {
      logger.i('[ServerHealthCheck] Server health check timeout');
      return false;
    } on SocketException catch (e) {
      logger.i('[ServerHealthCheck] Server connection failed: ${e.message}');
      return false;
    } catch (e) {
      logger.i('[ServerHealthCheck] Server health check failed: $e');
      return false;
    } finally {
      client?.close();
    }
  }

  Future<void> _checkServerHealth() async {
    final serverNotifier = _ref.read(serverControllerProvider.notifier);

    if (!serverNotifier.isReady) {
      logger.i('[ServerHealthCheck] Server is not ready, skip check');
      return;
    }

    final isHealthy = await _isServerHealthy();
    if (!isHealthy) {
      logger.i('[ServerHealthCheck] Server is not healthy, restarting...');
      await _restartServer();
    }
  }

  Future<bool> _restartServer() async {
    for (var attempt = 1; attempt <= _maxRestartAttempts; attempt++) {
      try {
        final server = await _ref
            .read(serverControllerProvider.notifier)
            .restart();
        if (server != null) {
          logger.i(
            '[ServerHealthCheck] Server restarted successfully on port ${server.port}',
          );
          return true;
        }
        logger.w(
          '[ServerHealthCheck] Restart returned null (attempt $attempt/$_maxRestartAttempts)',
        );
      } catch (e, stack) {
        logger.e(
          '[ServerHealthCheck] Failed to restart server (attempt $attempt/$_maxRestartAttempts): $e',
          error: e,
          stackTrace: stack,
        );
      }

      if (attempt < _maxRestartAttempts) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }
    return false;
  }

  void startPeriodicHealthCheck({
    Duration interval = const Duration(seconds: 30),
  }) {
    _healthCheckTimer?.cancel();
    _healthCheckTimer = Timer.periodic(interval, (_) {
      if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
        _scheduleCheck();
      }
    });
  }

  void stopPeriodicHealthCheck() {
    _healthCheckTimer?.cancel();
    _healthCheckTimer = null;
  }

  void dispose() {
    stopPeriodicHealthCheck();
    WidgetsBinding.instance.removeObserver(this);
  }
}
