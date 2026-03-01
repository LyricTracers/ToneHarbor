import 'dart:ui';

import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/artist.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'artists_provider.dependence.dart';
part 'artists_provider.g.dart';

@riverpod
Future<ArtistResponse> artists(
  Ref ref, {
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'name',
  String sortDirection = 'ASC',
  String additional = 'avg_rating',
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getArtists(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration != null) {
      link.close();
    }
  }
}

@keepAlive
Future<ArtistResponse> searchArtists(
  Ref ref, {
  required String filter,
  String library = 'all',
  int limit = 5000,
  int offset = 0,
  String sortBy = 'name',
  String sortDirection = 'asc',
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration,
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _searchArtists(
      ref: ref,
      filter: filter,
      library: library,
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
class ArtistsState extends _$ArtistsState {
  @override
  ArtistResponse? build() {
    return null;
  }

  Future<void> fetchArtists({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'ASC',
    String additional = 'avg_rating',
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    state = null;
    try {
      // 直接调用 getArtists 函数，而不是通过 artistsProvider
      final response = await _getArtists(
        ref: ref,
        limit: limit,
        offset: offset,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        additional: additional,
        cacheDuration: cacheDuration,
      );
      state = response;
    } catch (e) {
      logger.e('获取艺术家列表失败: $e');
      rethrow;
    }
  }
}
