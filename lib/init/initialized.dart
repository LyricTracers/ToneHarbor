import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:synchronized/synchronized.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/init/app_dependencies.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:logger/logger.dart';

part 'initialized_log.dart';

final defaultColorScheme = appDependencies.defaultColorScheme;
final defaultSongIconProvider = appDependencies.defaultSongIconProvider;
final httpClientWrapper = appDependencies.httpClientWrapper;
final downloadHttpClientWrapper = appDependencies.downloadHttpClientWrapper;
final coverDownloadHttpClientWrapper =
    appDependencies.coverDownloadHttpClientWrapper;
final translateHttpClientWrapper = appDependencies.translateHttpClientWrapper;
final audioStationRequestCache = appDependencies.audioStationRequestCache;
final lyricCache = appDependencies.lyricCache;
final placeholderErrorIconString = appDependencies.placeholderErrorIconString;

const keepAlive = Riverpod(keepAlive: true);

Future<void> initialized() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await SharedPreferencesUtils.initialize();
  await Rhttp.init();
  await MetadataGod.initialize();

  initLogger();
  await audioStationRequestCache.init();
  await lyricCache.init();
  await CacheManager.instance.init();
  await initMusicCacheBaseDir();

  await appDependencies.initColorScheme();
  await appDependencies.initPlaceholderErrorIconString();

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
  if (Platform.isMacOS) {
    await trayManager.setFontSize(SharedPreferencesUtils.getTrayFontSize());
    final ByteData imageData = await rootBundle.load(iconPlaceholder);
    final String base64Image = base64Encode(imageData.buffer.asUint8List());
    await trayManager.setMusicPlayerPopover(defaultArtwork: base64Image);
    await switchIconWithLabel(
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark,
      true,
    );
    TrayManager.instance.updateMusicPlayerArtworkFromUrl("");
  } else {
    await trayManager.setIcon(statusBarIcon);
  }
}
