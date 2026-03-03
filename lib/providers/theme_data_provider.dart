import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/utils/base_utils.dart';
part 'theme_data_provider.g.dart';

@riverpod
class DynamicScheme extends _$DynamicScheme {
  @override
  Future<DynamicSchemeVariant> build() async {
    return await getDynamicSchemeVariant();
  }

  Future<void> setSchemeVariant(DynamicSchemeVariant value) async {
    state = AsyncValue.data(value);
    final prefs = await getSharedPreferences();
    await prefs.setInt(dynamicSchemeKey, value.index);
  }
}

@riverpod
class ContrastLevel extends _$ContrastLevel {
  @override
  Future<double> build() async {
    return await getContrastLevel();
  }

  Future<void> setContrastLevel(double value) async {
    final clampedValue = value.clamp(-1.0, 1.0);
    state = AsyncValue.data(clampedValue);
    final prefs = await getSharedPreferences();
    await prefs.setDouble(contrastLevelKey, clampedValue);
  }
}

@riverpod
Future<ColorScheme> getColorScheme(Ref ref) async {
  final syncSongIcon = getValueWhenReadyWithRef(
    ref,
    syncSongIconProvider,
    true,
  );
  final schemeVariant = await ref.watch(dynamicSchemeProvider.future);
  final contrastLevel = await ref.watch(contrastLevelProvider.future);
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
  Future<bool> build() async {
    return await getSyncSongIcon();
  }

  Future<void> setSyncSongIcon(bool value) async {
    final prefs = await getSharedPreferences();
    await prefs.setBool(syncSongIconKey, value);
    state = AsyncData(value);
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

@riverpod
Future<ImageProvider?> loadDefaultThemeIcon(Ref ref) async {
  return loadDefaultThemeIconWithCache();
}
