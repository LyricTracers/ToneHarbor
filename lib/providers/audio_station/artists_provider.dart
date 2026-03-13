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
class SearchArtist extends _$SearchArtist {
  @override
  Future<ArtistResponse> build({
    required String filter,
    String library = 'all',
    int limit = 5000,
    int offset = 0,
    String sortBy = 'name',
    String sortDirection = 'asc',
    Duration? cacheDuration = const Duration(minutes: 30),
  }) async {
    ref.keepAliveFor(Duration(minutes: 5));
    return await _searchArtists(
      ref: ref,
      filter: filter,
      library: library,
      limit: limit,
      offset: offset,
      sortBy: sortBy,
      sortDirection: sortDirection,
      cacheDuration: cacheDuration,
      groupKey: "search",
    );
  }
}

@riverpod
class Artists extends _$Artists with ExtraProvider<ArtistResponse> {
  @override
  Future<ArtistResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'all',
    String sortBy = 'name',
    String sortDirection = 'ASC',
    String additional = 'avg_rating',
    Duration? cacheDuration = const Duration(minutes: 30),
  }) async {
    duration = cacheDuration;
    groupKey = 'artists';
    ref.keepAliveFor(Duration(minutes: 5));
    return await _getArtists(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      cacheDuration: duration,
      groupKey: groupKey,
    );
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value!.data;
    if (currentData == null) return;

    final currentTotal = currentData.total;
    final currentArtists = currentData.artists ?? [];

    if (currentArtists.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await _getArtists(
        ref: ref,
        limit: limit,
        offset: currentArtists.length,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        additional: additional,
        cacheDuration: duration,
        groupKey: groupKey,
      );

      final newArtists = newState.data?.artists ?? [];
      final mergedArtists = [...currentArtists, ...newArtists];

      state = AsyncData(
        newState.copyWith(
          data: newState.data?.copyWith(
            artists: mergedArtists,
            total: currentTotal,
          ),
        ),
      );
    } catch (e) {
      logger.e('加载更多artists失败: $e');
      state = AsyncData(oldState!);
    }
  }
}
