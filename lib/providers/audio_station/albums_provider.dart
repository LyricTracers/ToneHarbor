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
Future<AlbumResponse> albums(
  Ref ref, {
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'name',
  String sortDirection = 'asc',
  String additional = 'avg_rating',
  String? artist,
  Duration? cacheDuration,
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
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
    );
  } finally {
    if (keepAliveDuration != null) {
      link.close();
    }
  }
}

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

@keepAlive
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
class AlbumsState extends _$AlbumsState {
  @override
  AlbumResponse? build() {
    return null;
  }

  Future<void> fetchAlbums({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'asc',
    String additional = 'avg_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    state = null;
    try {
      final response = await _getAlbums(
        ref: ref,
        limit: limit,
        offset: offset,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        additional: additional,
        artist: artist,
        cacheDuration: cacheDuration,
      );
      state = response;
    } catch (e) {
      logger.e('获取专辑列表失败: $e');
      rethrow;
    }
  }
}
