import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/utils/base_utils.dart';
part 'theme_data_provider.g.dart';

@riverpod
class DynamicScheme extends _$DynamicScheme {
  @override
  DynamicSchemeVariant build() {
    return SharedPreferencesUtils.getDynamicSchemeVariant();
  }

  Future<void> setSchemeVariant(DynamicSchemeVariant value) async {
    state = value;
    await SharedPreferencesUtils.setDynamicSchemeVariant(value);
  }
}

@riverpod
class ContrastLevel extends _$ContrastLevel {
  @override
  double build() {
    return SharedPreferencesUtils.getContrastLevel();
  }

  Future<void> setContrastLevel(double value) async {
    final clampedValue = value.clamp(-1.0, 1.0);
    state = clampedValue;
    await SharedPreferencesUtils.setContrastLevel(clampedValue);
  }
}

@riverpod
Future<ColorScheme> getColorScheme(Ref ref) async {
  final syncSongIcon = ref.watch(syncSongIconProvider);
  final schemeVariant = ref.watch(dynamicSchemeProvider);
  final contrastLevel = ref.watch(contrastLevelProvider);
  return await FrostedColorSchemeGenerator.generate(
    imageProvider: syncSongIcon
        ? await ref.watch(songIconProvider.future)
        : await ref.watch(loadDefaultThemeIconProvider.future) ??
              defaultSongIconProvider,
    schemeVariant: schemeVariant,
    contrastLevel: contrastLevel,
  );
}

@riverpod
class SyncSongIcon extends _$SyncSongIcon {
  @override
  bool build() {
    return SharedPreferencesUtils.getSyncSongIcon();
  }

  Future<void> setSyncSongIcon(bool value) async {
    state = value;
    await SharedPreferencesUtils.setSyncSongIcon(value);
  }
}

@keepAlive
class SongIconBase64 extends _$SongIconBase64 {
  @override
  String build() {
    return '';
  }

  void setBase64(String value) async {
    state = value;
  }
}

@riverpod
class SongIcon extends _$SongIcon {
  @override
  Future<ImageProvider> build() async {
    final base64 = ref.watch(songIconBase64Provider);
    if (base64.isEmpty) {
      return defaultSongIconProvider;
    }

    String imageData = base64;
    if (base64.startsWith('data:image/')) {
      final commaIndex = base64.indexOf(',');
      if (commaIndex != -1) {
        imageData = base64.substring(commaIndex + 1);
      } else {
        return defaultSongIconProvider;
      }
    } else {
      return defaultSongIconProvider;
    }
    try {
      return MemoryImage(base64Decode(imageData));
    } catch (e) {
      return defaultSongIconProvider;
    }
  }
}

@keepAlive
Future<ImageProvider?> loadDefaultThemeIcon(Ref ref) async {
  final savedPath = SharedPreferencesUtils.getDefaultThemeIcon();

  if (savedPath.isEmpty) {
    logger.i('loadDefaultThemeIcon: no saved path');
    return null;
  }

  try {
    final file = File(savedPath);
    logger.i('Loading default theme icon from: ${file.path}');
    if (!await file.exists()) {
      logger.i('loadDefaultThemeIcon: file does not exist');
      return null;
    }

    final bytes = await file.readAsBytes();
    logger.i('loadDefaultThemeIcon: loaded ${bytes.length} bytes');
    return MemoryImage(bytes);
  } catch (e) {
    logger.e('loadDefaultThemeIcon: error - $e');
    return null;
  }
}
