import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/album.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'albums_provider.dependence.dart';
part 'albums_provider.g.dart';

@riverpod
Future<AlbumResponse> randomAlbums(
  Ref ref, {
  int limit = 20,
  Duration? cacheDuration,
  Duration? keepAliveDuration,
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getAlbums(
      ref: ref,
      limit: limit,
      sortBy: 'random',
      sortDirection: 'desc',
      cacheDuration: cacheDuration,
      groupKey: "randomAlbums",
    );
  } finally {
    if (keepAliveDuration != null) {
      link.close();
    }
  }
}

@riverpod
Future<AlbumResponse> recentAlbums(
  Ref ref, {
  int limit = 20,
  Duration? cacheDuration = const Duration(days: 1),
  Duration? keepAliveDuration = const Duration(minutes: 20),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getAlbums(
      ref: ref,
      limit: limit,
      sortBy: 'time',
      sortDirection: 'desc',
      cacheDuration: cacheDuration,
      groupKey: "recentAlbums",
    );
  } finally {
    if (keepAliveDuration != null) {
      link.close();
    }
  }
}

@riverpod
Future<AlbumResponse> artistAlbums(
  Ref ref, {
  required String artist,
  int limit = 100,
  Duration? cacheDuration,
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getAlbums(
      ref: ref,
      limit: limit,
      artist: artist,
      cacheDuration: cacheDuration,
      groupKey: "artistAlbums",
    );
  } finally {
    if (keepAliveDuration != null) {
      link.close();
    }
  }
}

@riverpod
Future<AlbumResponse> searchAlbums(
  Ref ref, {
  required String filter,
  int limit = 100,
  int offset = 0,
  String sortBy = 'name',
  String sortDirection = 'asc',
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration,
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _searchAlbums(
      ref: ref,
      filter: filter,
      limit: limit,
      offset: offset,
      sortBy: sortBy,
      sortDirection: sortDirection,
      cacheDuration: cacheDuration,
      groupKey: "search",
    );
  } finally {
    if (keepAliveDuration != null) {
      link.close();
    }
  }
}

@riverpod
class Albums extends _$Albums with ExtraProvider<AlbumResponse> {
  @override
  Future<AlbumResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'asc',
    String additional = 'avg_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 30),
  }) async {
    duration = cacheDuration;
    groupKey = "albums";
    ref.keepAliveFor(Duration(minutes: 5));
    return await _getAlbums(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      artist: artist,
      cacheDuration: cacheDuration,
      groupKey: groupKey,
    );
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value!.data;
    if (currentData == null) return;

    final currentTotal = currentData.total;
    final currentAlbums = currentData.albums ?? [];

    if (currentAlbums.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await _getAlbums(
        ref: ref,
        limit: limit,
        offset: currentAlbums.length,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        additional: additional,
        artist: artist,
        cacheDuration: duration,
        groupKey: groupKey,
      );

      final newAlbums = newState.data?.albums ?? [];
      final mergedAlbums = [...currentAlbums, ...newAlbums];

      state = AsyncData(
        newState.copyWith(
          data: newState.data?.copyWith(
            albums: mergedAlbums,
            total: currentTotal,
          ),
        ),
      );
    } catch (e) {
      logger.e('加载更多Albums失败: $e');
      state = AsyncData(oldState!);
    }
  }
}
