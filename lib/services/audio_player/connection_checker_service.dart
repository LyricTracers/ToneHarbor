import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:toneharbor/init/initialized.dart';

class ConnectionCheckerService with WidgetsBindingObserver {
  final _connectionStreamController = StreamController<bool>.broadcast();
  final HttpClient client;

  static final _instance = ConnectionCheckerService._();

  static ConnectionCheckerService get instance => _instance;

  ConnectionCheckerService._() : client = HttpClient() {
    Timer? timer;
    WidgetsBinding.instance.addObserver(this);
    onConnectivityChanged.listen((connected) {
      try {
        if (!connected && timer == null) {
          timer = Timer.periodic(const Duration(seconds: 30), (timer) async {
            if (WidgetsBinding.instance.lifecycleState ==
                AppLifecycleState.paused) {
              return;
            }
            await isConnected;
          });
        } else {
          timer?.cancel();
          timer = null;
        }
      } catch (e, stack) {
        logger.i("ConnectionCheckerService error: $e, $stack");
      }
    });

    Connectivity().onConnectivityChanged.listen((event) async {
      logger.i("Connectivity event: $event");
      await isConnected;
    });

    isConnected;
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await isConnected;
    }
  }

  final vpnNames = [
    'tun',
    'tap',
    'ppp',
    'pptp',
    'l2tp',
    'ipsec',
    'vpn',
    'wireguard',
    'openvpn',
    'softether',
    'proton',
    'strongswan',
    'cisco',
    'forticlient',
    'fortinet',
    'hideme',
    'hidemy',
    'hideman',
    'hidester',
    'lightway',
  ];

  Future<bool> isVpnActive() async {
    final interfaces = await NetworkInterface.list(
      includeLoopback: false,
      type: InternetAddressType.any,
    );

    if (interfaces.isEmpty) {
      return false;
    }

    return interfaces.any(
      (interface) =>
          vpnNames.any((name) => interface.name.toLowerCase().contains(name)),
    );
  }

  Future<bool> doesConnectTo(String address) async {
    try {
      final result = await InternetAddress.lookup(
        address,
      ).timeout(const Duration(seconds: 5));
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        return false;
      }
      final request = await client.headUrl(Uri.parse('https://$address'));
      request.followRedirects = false;
      final response = await request.close().timeout(
        const Duration(seconds: 5),
      );
      return response.statusCode >= 200 && response.statusCode < 400;
    } catch (_) {
      return false;
    }
  }

  Future<bool> _isConnected() async {
    return await doesConnectTo('www.baidu.com') ||
        await doesConnectTo('google.com') ||
        await isVpnActive();
  }

  bool? isConnectedSync;

  Future<bool> get isConnected async {
    final connected = await _isConnected();
    if (isConnectedSync == null || connected != isConnectedSync) {
      _connectionStreamController.add(connected);
    }
    isConnectedSync = connected;
    return connected;
  }

  Stream<bool> get onConnectivityChanged => _connectionStreamController.stream;
}
