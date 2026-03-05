import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lyric/core/lyric_model.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:synchronized/synchronized.dart';
import 'package:toneharbor/services/hive/hive_service.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'package:logger/logger.dart';

part 'initialized_log.dart';

late final ColorScheme defaultColorScheme;
late final ImageProvider defaultSongIconProvider;
late final HttpClientWrapper httpClientWrapper;
late final HttpClientWrapper downloadHttpClientWrapper;
late final PersistentApiCache<Map<String, dynamic>> audioStationRequestCache;
late final PersistentApiCache<Map<String, dynamic>> lyricCache;

const keepAlive = Riverpod(keepAlive: true);

Future<void> initialized() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await Rhttp.init();
  await HiveService.initialize();
  initLogger();
  initHttpClientWrapper();
  await initPersistentApiCache();
  // await LyricsCacheKeyManager().initDatabase();
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

  downloadHttpClientWrapper = HttpClientWrapper(
    settings: const ClientSettings(
      timeoutSettings: TimeoutSettings(
        timeout: Duration(minutes: 30),
        connectTimeout: Duration(seconds: 30),
      ),
    ),
    loggingInterceptor: LoggingInterceptor(logger: logger),
  );
}

Future<void> initPersistentApiCache() async {
  audioStationRequestCache = PersistentApiCache<Map<String, dynamic>>(
    'audio_station_api',
    options: const CacheOptions(
      enabled: true,
      defaultDuration: Duration(minutes: 30),
    ),
  );
  lyricCache = PersistentApiCache<Map<String, dynamic>>(
    'lyrics_cache',
    options: const CacheOptions(
      enabled: true,
      defaultDuration: Duration(days: 365),
    ),
    backend: CacheStorageBackend.file,
  );
  await audioStationRequestCache.init();
  //群晖歌词缓存
  await lyricCache.init();
  //第三方歌词缓存
  await CacheManager.instance.init();
}
