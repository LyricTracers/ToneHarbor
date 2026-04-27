import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/services/audio_player/connection_checker_service.dart';
import 'package:toneharbor/utils/base_funs.dart';

class QuickConnectService with WidgetsBindingObserver {
  final _lanConnectionStreamController = StreamController<bool>.broadcast();
  StreamSubscription<bool>? _connectivitySubscription;
  bool _isMonitoring = false;

  static QuickConnectService? _instance;

  static QuickConnectService get instance {
    _instance ??= QuickConnectService._();
    return _instance!;
  }

  QuickConnectService._() {
    WidgetsBinding.instance.addObserver(this);
  }

  bool get isMonitoring => _isMonitoring;

  void startMonitoring() {
    if (_isMonitoring) return;

    _connectivitySubscription = ConnectionCheckerService
        .instance
        .onConnectivityChanged
        .listen((connected) async {
          if (connected) {
            await checkLANConnection();
          }
        });
    _isMonitoring = true;
    Future.delayed(Duration.zero, () => checkLANConnection());
    logger.d('QuickConnect: 启动局域网监控');
  }

  void stopMonitoring() {
    if (!_isMonitoring) return;

    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
    _isMonitoring = false;
    logger.d('QuickConnect: 停止局域网监控');
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && _isMonitoring) {
      await checkLANConnection();
    }
  }

  bool? isLANConnectedSync;

  Future<bool> checkLANConnection() async {
    final localBaseUrl = SharedPreferencesUtils.getLocalBaseUrl();

    if (localBaseUrl == null || localBaseUrl.isEmpty) {
      isLANConnectedSync = false;
      _lanConnectionStreamController.add(false);
      return false;
    }

    try {
      final uri = Uri.parse(localBaseUrl);
      final host = uri.host;
      final port = uri.port;

      final socket = await Socket.connect(
        host,
        port,
        timeout: const Duration(seconds: 3),
      );
      await socket.close();

      if (isLANConnectedSync != true) {
        logger.d('QuickConnect: 局域网地址可达: $localBaseUrl');
      }

      isLANConnectedSync = true;
      _lanConnectionStreamController.add(true);
      return true;
    } catch (e) {
      if (isLANConnectedSync != false) {
        logger.d('QuickConnect: 局域网地址不可达: $localBaseUrl, 错误: $e');
      }

      isLANConnectedSync = false;
      _lanConnectionStreamController.add(false);
      return false;
    }
  }

  Stream<bool> get onLANConnectivityChanged =>
      _lanConnectionStreamController.stream;

  void dispose() {
    stopMonitoring();
    _lanConnectionStreamController.close();
    WidgetsBinding.instance.removeObserver(this);
    _instance = null;
  }
}
