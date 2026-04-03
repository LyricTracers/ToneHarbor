import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
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
  final schemeVariant = ref.watch(dynamicSchemeProvider);
  final contrastLevel = ref.watch(contrastLevelProvider);
  final imageProvider = ref.watch(getImageProviderProvider);
  return await FrostedColorSchemeGenerator.generate(
    imageProvider: imageProvider.value ?? defaultSongIconProvider,
    schemeVariant: schemeVariant,
    contrastLevel: contrastLevel,
  );
}

@riverpod
AsyncValue<ImageProvider> getImageProvider(Ref ref) {
  final syncSongIcon = ref.watch(syncSongIconProvider);

  if (syncSongIcon) {
    final songIcon = ref.watch(songIconProvider);
    return songIcon.when(
      data: (icon) => AsyncValue.data(icon ?? defaultSongIconProvider),
      loading: () => AsyncValue.data(defaultSongIconProvider),
      error: (_, __) => AsyncValue.data(defaultSongIconProvider),
    );
  }

  final defaultIcon = ref.watch(loadDefaultThemeIconProvider);
  return defaultIcon.when(
    data: (icon) => AsyncValue.data(icon ?? defaultSongIconProvider),
    loading: () => AsyncValue.data(defaultSongIconProvider),
    error: (_, __) => AsyncValue.data(defaultSongIconProvider),
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

@riverpod
class SongIcon extends _$SongIcon {
  @override
  Future<ImageProvider?> build() async {
    final activeTrackId = ref.watch(
      audioPlayerStateProvider.select((state) => state.activeTrackId),
    );
    if (activeTrackId == null) {
      return null;
    }
    final activeTrack = ref.read(audioPlayerStateProvider).activeTrack;
    if (activeTrack == null) {
      return null;
    }
    final cacheKey = activeTrack.id.isNotEmpty
        ? activeTrack.id
        : sanitizeCacheKey("${activeTrack.artist}-${activeTrack.album}");
    final asyncValue = ref.watch(
      fetchCoverBytesProvider(
        songId: activeTrack.id,
        albumName: activeTrack.album,
        artistName: activeTrack.artist,
        key: cacheKey,
        liveKeepDuration: const Duration(minutes: 1),
      ),
    );
    return asyncValue.when(
      data: (bytes) =>
          bytes == null ? defaultSongIconProvider : MemoryImage(bytes),
      loading: () => defaultSongIconProvider,
      error: (_, __) => defaultSongIconProvider,
    );
  }
}

@riverpod
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
