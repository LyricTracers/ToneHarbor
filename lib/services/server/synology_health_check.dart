import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';

final synologyHealthCheckProvider = Provider((ref) {
  final service = SynologyHealthCheckService(ref);
  ref.onDispose(() => service.dispose());
  return service;
});

class SynologyHealthCheckService with WidgetsBindingObserver {
  final Ref _ref;
  Timer? _healthCheckTimer;
  bool _isChecking = false; // 防止并发检查的标志位

  SynologyHealthCheckService(this._ref) {
    WidgetsBinding.instance.addObserver(this);
  }
  void startPeriodicHealthCheck({
    Duration interval = const Duration(seconds: 60),
  }) {
    _healthCheckTimer?.cancel();

    // 立即执行一次检查
    if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
      _scheduleCheck();
    }
    // 然后启动定时器
    _healthCheckTimer = Timer.periodic(interval, (_) {
      if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
        _scheduleCheck();
      }
    });
  }

  void _scheduleCheck() {
    var serverUrl = _ref.read(serverUrlProvider);
    if (serverUrl.isEmpty) {
      return;
    }
    final cookiesInfoAsync = _ref.read(audioStationCookiesInfoProvider);
    if (cookiesInfoAsync == null || !cookiesInfoAsync.isValid) {
      return;
    }

    final isQuickConnect =
        !serverUrl.contains('.') &&
        !serverUrl.contains(':') &&
        serverUrl.length >= 3;
    if (isQuickConnect) {
      Future.microtask(() => _isSynologyHealthy(serverUrl: serverUrl));
    }
  }

  Future<void> _isSynologyHealthy({required String serverUrl}) async {
    // 如果已经在检查中，直接返回
    if (_isChecking) {
      logger.i('健康检查正在进行中，跳过本次检查');
      return;
    }

    _isChecking = true;
    bool healthy = false;

    try {
      await _ref.read(testConnectionProvider.future);
      healthy = true;
    } catch (e) {
      logger.e('Test connection failed: $e');
    }

    if (!healthy) {
      try {
        _ref.read(requestFlagProvider.notifier).setRequestFlag(true);
        await _ref.read(quickConnectTestProvider(serverUrl).future);
        _ref.invalidate(baseUrlProvider);
      } catch (e) {
        logger.e('QuickConnect test failed: $e');
      } finally {
        _ref.read(requestFlagProvider.notifier).setRequestFlag(false);
      }
    }

    _isChecking = false;
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
