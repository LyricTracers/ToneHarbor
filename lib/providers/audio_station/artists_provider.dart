import 'dart:ui';

import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/artist.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/excetions.dart';

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
}) async {
  return await getArtists(
    ref: ref,
    limit: limit,
    offset: offset,
    library: library,
    sortBy: sortBy,
    sortDirection: sortDirection,
    additional: additional,
    cacheDuration: cacheDuration,
  );
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
      final response = await getArtists(
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
