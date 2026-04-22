import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/api_cache_providers.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'storage_provider.g.dart';

enum StorageCategory {
  cacheLow,
  cacheMedium,
  cacheHigh,
  cacheOriginal,
  cacheCover,
  cacheLyrics,
  cacheApi,
  other;

  String localizedLabel(AppLocalizations l10n) {
    switch (this) {
      case StorageCategory.cacheLow:
        return l10n.quality_low;
      case StorageCategory.cacheMedium:
        return l10n.quality_medium;
      case StorageCategory.cacheHigh:
        return l10n.quality_high;
      case StorageCategory.cacheOriginal:
        return l10n.quality_original;
      case StorageCategory.cacheCover:
        return l10n.storage_cache_cover;
      case StorageCategory.cacheLyrics:
        return l10n.storage_cache_lyrics;
      case StorageCategory.cacheApi:
        return l10n.storage_cache_api;
      case StorageCategory.other:
        return l10n.storage_other;
    }
  }

  static StorageCategory fromQuality(AudioQuality quality) {
    return switch (quality) {
      AudioQuality.low => StorageCategory.cacheLow,
      AudioQuality.medium => StorageCategory.cacheMedium,
      AudioQuality.high => StorageCategory.cacheHigh,
      AudioQuality.original => StorageCategory.cacheOriginal,
    };
  }
}

class StorageInfo {
  final StorageCategory category;
  final String path;
  final List<String> additionalPaths;
  final int size;
  final double percentage;
  final bool canDelete;

  const StorageInfo({
    required this.category,
    required this.path,
    this.additionalPaths = const [],
    required this.size,
    this.percentage = 0,
    this.canDelete = true,
  });

  String get formattedSize => formatBytes(size);

  StorageInfo withPercentage(double p) => StorageInfo(
    category: category,
    path: path,
    additionalPaths: additionalPaths,
    size: size,
    percentage: p,
    canDelete: canDelete,
  );
}

Future<int> _getDirectorySize(Directory dir) async {
  if (!await dir.exists()) return 0;

  int size = 0;
  try {
    await for (final entity in dir.list(recursive: true, followLinks: false)) {
      if (entity is File) size += await entity.length();
    }
  } catch (_) {}
  return size;
}

Future<Directory> _getAppBaseDir() async {
  if (Platform.isAndroid) {
    final dirs = await getExternalCacheDirectories();
    return dirs!.first;
  }
  return getApplicationSupportDirectory();
}

Future<StorageInfo?> _createStorageInfo({
  required StorageCategory category,
  required Future<String> Function() getPath,
  bool canDelete = true,
}) async {
  final path = await getPath();
  final dir = Directory(path);
  if (!await dir.exists()) return null;

  final size = await _getDirectorySize(dir);
  if (size == 0) return null;

  return StorageInfo(
    category: category,
    path: path,
    size: size,
    canDelete: canDelete,
  );
}

Future<List<StorageInfo>> _getStorageInfos() async {
  final infos = <StorageInfo>[];
  final appDir = await _getAppBaseDir();
  int knownSize = 0;

  for (final quality in AudioQuality.values) {
    final info = await _createStorageInfo(
      category: StorageCategory.fromQuality(quality),
      getPath: () => getMusicCacheDir(quality),
    );
    if (info != null) {
      infos.add(info);
      knownSize += info.size;
    }
  }

  final coverPath = await getCoverCacheDir();
  final coverSize = await _getDirectorySize(Directory(coverPath));
  if (coverSize > 0) {
    infos.add(
      StorageInfo(
        category: StorageCategory.cacheCover,
        path: coverPath,
        size: coverSize,
      ),
    );
    knownSize += coverSize;
  }

  final lyricsPath = p.join(appDir.path, 'lyrics_cache');
  final lyricsSize = await _getDirectorySize(Directory(lyricsPath));
  if (lyricsSize > 0) {
    infos.add(
      StorageInfo(
        category: StorageCategory.cacheLyrics,
        path: lyricsPath,
        size: lyricsSize,
      ),
    );
    knownSize += lyricsSize;
  }

  final apiCachePath = p.join(appDir.path, 'audio_station_api');
  final apiCacheSize = await _getDirectorySize(Directory(apiCachePath));
  if (apiCacheSize > 0) {
    infos.add(
      StorageInfo(
        category: StorageCategory.cacheApi,
        path: apiCachePath,
        size: apiCacheSize,
      ),
    );
    knownSize += apiCacheSize;
  }

  final totalSize = await _getDirectorySize(appDir);
  final otherSize = (totalSize - knownSize).clamp(0, totalSize);

  if (otherSize > 0) {
    infos.add(
      StorageInfo(
        category: StorageCategory.other,
        path: appDir.path,
        size: otherSize,
        canDelete: false,
      ),
    );
  }

  final total = infos.fold<int>(0, (sum, info) => sum + info.size);
  return total > 0
      ? infos
            .map((info) => info.withPercentage(info.size / total * 100))
            .toList()
      : infos;
}

@riverpod
Future<List<StorageInfo>> storageInfo(Ref ref) async {
  ref.keepAliveFor(Duration(minutes: 5));
  return _getStorageInfos();
}

final clearStorageProvider = Provider((ref) {
  return (StorageInfo info) async {
    switch (info.category) {
      case StorageCategory.cacheLow:
      case StorageCategory.cacheMedium:
      case StorageCategory.cacheHigh:
      case StorageCategory.cacheOriginal:
        final quality = _qualityFromCategory(info.category);
        await LocalMusicStateService.removeAllByQuality(
          ref.read(appDatabaseProvider),
          quality,
        );
        break;
      case StorageCategory.cacheCover:
        final dir = Directory(info.path);
        if (await dir.exists()) {
          await dir.delete(recursive: true);
          await dir.create(recursive: true);
        }
        ref.invalidate(fetchCoverBytesProvider);
        ref.invalidate(fetchCloudMusicCoverBytesProvider);
        break;
      case StorageCategory.cacheLyrics:
        await clearLyricCache();
        ref.invalidate(getLyricsProvider);
        ref.invalidate(currentLyricsProvider);
        ref.invalidate(combinedSearchProvider);
        break;
      case StorageCategory.cacheApi:
        await clearAudioStationRequestCache();
        invalidateApiCacheProviders(ref);
        break;
      case StorageCategory.other:
        break;
    }
    ref.invalidate(storageInfoProvider);
  };
});

AudioQuality _qualityFromCategory(StorageCategory category) {
  return switch (category) {
    StorageCategory.cacheLow => AudioQuality.low,
    StorageCategory.cacheMedium => AudioQuality.medium,
    StorageCategory.cacheHigh => AudioQuality.high,
    StorageCategory.cacheOriginal => AudioQuality.original,
    _ => throw ArgumentError('Invalid category: $category'),
  };
}
