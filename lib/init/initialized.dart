import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:synchronized/synchronized.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'package:logger/logger.dart';

part 'initialized_log.dart';

late final ColorScheme defaultColorScheme;
late final ImageProvider defaultSongIconProvider;
late final HttpClientWrapper httpClientWrapper;
late final PersistentApiCache<Map<String, dynamic>> audioStationRequestCache;

const keepAlive = Riverpod(keepAlive: true);

Future<void> initialized() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Rhttp.init();
  initLogger();
  initHttpClientWrapper();
  await initAudioStationRequestCache();
  await CacheManager.instance.init();
  await LyricsCacheKeyManager().initDatabase();
  defaultSongIconProvider = const AssetImage(iconPlaceholder);
  defaultColorScheme = await FrostedColorSchemeGenerator.generate(
    imageProvider: defaultSongIconProvider,
  );
  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    _initTray();
    await WindowManager.instance.ensureInitialized();
    await windowManager.waitUntilReadyToShow(null, () async {
      await windowManager.setPreventClose(true);
    });
  }
  WidgetsBinding.instance.addPostFrameCallback((_) {
    FlutterNativeSplash.remove();
  });
}

Future<void> _initTray() async {
  await trayManager.setFontSize(await getTrayFontSize());
  await trayManager.setIcon(statusBarIcon);
  if (Platform.isMacOS) {
    final ByteData imageData = await rootBundle.load(iconPlaceholder);
    final String base64Image = base64Encode(imageData.buffer.asUint8List());
    await trayManager.setMusicPlayerPopover(defaultArtwork: base64Image);
  }
}

void initHttpClientWrapper() {
  httpClientWrapper = HttpClientWrapper(
    settings: const ClientSettings(
      timeoutSettings: TimeoutSettings(
        timeout: Duration(seconds: 60),
        connectTimeout: Duration(seconds: 15),
      ),
    ),
    retryInterceptor: RetryInterceptor(
      maxRetries: 3,
      delay: (attempt) => Duration(milliseconds: 500 * (attempt + 1)),
      beforeRetry: (attempt, request, response, exception) async {
        logger.w('after【Retrying $attempt count】 throw $exception');
        return request;
      },
    ),
    loggingInterceptor: LoggingInterceptor(logger: logger),
  );
}

Future<void> initAudioStationRequestCache() async {
  audioStationRequestCache = PersistentApiCache<Map<String, dynamic>>(
    'audio_station_api',
    options: const CacheOptions(
      enabled: true,
      defaultDuration: Duration(minutes: 30),
    ),
  );
  await audioStationRequestCache.init();
}
