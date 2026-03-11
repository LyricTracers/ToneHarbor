import 'dart:ui';

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
    );
  } finally {
    if (keepAliveDuration != null) {
      link.close();
    }
  }
}

@riverpod
class Albums extends _$Albums {
  late int _limit;
  late String _library;
  late String _sortBy;
  late String _sortDirection;
  late String _additional;
  String? _artist;
  Duration? _duration;
  @override
  Future<AlbumResponse?> build({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'asc',
    String additional = 'avg_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 30),
  }) async {
    _limit = limit;
    _library = library;
    _sortBy = sortBy;
    _sortDirection = sortDirection;
    _additional = additional;
    _artist = artist;
    _duration = cacheDuration;
    ref.keepAliveFor(Duration(minutes: 5));
    return await _getAlbums(
      ref: ref,
      limit: _limit,
      offset: offset,
      library: _library,
      sortBy: _sortBy,
      sortDirection: _sortDirection,
      additional: _additional,
      artist: _artist,
      cacheDuration: _duration,
    );
  }

  Future<void> fetchMore() async {
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
        limit: _limit,
        offset: currentAlbums.length,
        library: _library,
        sortBy: _sortBy,
        sortDirection: _sortDirection,
        additional: _additional,
        artist: _artist,
        cacheDuration: _duration,
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
