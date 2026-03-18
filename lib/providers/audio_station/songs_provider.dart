import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'songs_provider.dependence.dart';
part 'songs_provider.g.dart';

void updateRating(Ref ref, SongListResponse songsResponse) {
  var songs = songsResponse.data?.songs;
  if (songs == null || songs.isEmpty) {
    return;
  }
  var songRating = ref.read(songRatingProvider.notifier);
  var ids = <String>[];
  for (var song in songs) {
    var id = song.id;
    var rating = song.additional?.songRating?.rating ?? 0;
    if (rating == 5) {
      ids.add(id);
    }
  }
  songRating.addFavorites(ids);
}

@keepAlive
class SongRating extends _$SongRating {
  @override
  Set<String> build() {
    return <String>{};
  }

  Future<SetRatingResponse> setRating({
    required String id,
    int rating = 5,
  }) async {
    try {
      var result = await _setRating(ref: ref, id: id, rating: rating);
      if (result.success) {
        if (rating == 5) {
          addFavorite(id);
        } else {
          removeFavorite(id);
        }
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  void addFavorite(String id) {
    if (!state.contains(id)) {
      state = {...state, id};
    }
  }

  void addFavorites(Iterable<String> ids) {
    state = {...state, ...ids};
  }

  void removeFavorite(String id) {
    if (state.contains(id)) {
      final newState = {...state}..remove(id);
      state = newState;
    }
  }
}

@riverpod
class SongCommon extends _$SongCommon {
  @override
  void build() {
    ref.keepAliveFor(Duration(minutes: 5));
  }

  Future<LyricsResponse> lyrics({
    required String id,
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    return await _getLyrics(ref: ref, id: id, cacheDuration: cacheDuration);
  }

  Future<SearchLyricsResponse> searchLyrics({
    required String title,
    String? artist,
    int limit = 10,
    String additional = 'full_lyrics',
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    return await _searchLyrics(
      ref: ref,
      title: title,
      artist: artist,
      limit: limit,
      additional: additional,
      cacheDuration: cacheDuration,
    );
  }

  Future<SongInfoResponse> songInfo({
    required String id,
    String additional = 'song_rating',
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    return await _getSongInfo(
      ref: ref,
      id: id,
      additional: additional,
      cacheDuration: cacheDuration,
    );
  }

  Future<GetNumberOfPlugInsResponse> numberOfPlugIns({
    Duration? cacheDuration = const Duration(hours: 24),
  }) async {
    return await _getNumberOfPlugIns(ref: ref, cacheDuration: cacheDuration);
  }
}

@riverpod
class RandomSongs extends _$RandomSongs with ExtraProvider<SongListResponse> {
  @override
  Future<SongListResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration,
  }) async {
    ref.keepAliveFor(Duration(minutes: 30));
    duration = cacheDuration;
    groupKey = 'randomSongs';
    if (extraSortBy.isEmpty && extraSortDirection.isEmpty) {
      extraSortBy = 'random';
      extraSortDirection = 'ASC';
    }
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      additional: additional,
      sortBy: extraSortBy,
      sortDirection: extraSortDirection,
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {
    if (extraSortBy == sortBy && extraSortDirection == sortDirection) {
      return;
    }

    final oldState = state.value;
    state = AsyncLoading();
    try {
      final newState = await _getSongs(
        ref: ref,
        limit: limit,
        offset: 0,
        library: library,
        additional: additional,
        sortBy: sortBy,
        sortDirection: sortDirection,
        cacheDuration: duration,
        group: groupKey,
      );
      state = AsyncData(newState);
    } catch (e) {
      logger.e('set Sort randomSongs失败: $e');
      state = AsyncData(oldState!);
    } finally {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
  }

  @override
  Future<void> loadMore() async {}
}

@riverpod
class FavoriteSongs extends _$FavoriteSongs
    with ExtraProvider<SongListResponse> {
  @override
  Future<SongListResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'desc',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration = const Duration(minutes: 30),
  }) async {
    ref.keepAliveFor(Duration(minutes: 5));
    duration = cacheDuration;
    groupKey = 'favoriteSongs';
    if (extraSortBy.isEmpty && extraSortDirection.isEmpty) {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
    var result = await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      additional: additional,
      sortBy: extraSortBy,
      sortDirection: extraSortDirection,
      songRatingMeq: 5,
      cacheDuration: duration,
      group: groupKey,
    );
    return result;
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {
    if (extraSortBy == sortBy && extraSortDirection == sortDirection) {
      return;
    }

    final oldState = state.value;
    state = AsyncLoading();
    try {
      final newState = await _getSongs(
        ref: ref,
        limit: limit,
        offset: 0,
        library: library,
        additional: additional,
        sortBy: sortBy,
        sortDirection: sortDirection,
        songRatingMeq: 5,
        cacheDuration: duration,
        group: groupKey,
      );
      state = AsyncData(newState);
    } catch (e) {
      logger.e('set Sort favoriteSongs失败: $e');
      state = AsyncData(oldState!);
    } finally {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value!.data;
    if (currentData == null) return;

    final currentTotal = currentData.total ?? 0;
    final currentSongs = currentData.songs;

    if (currentSongs.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await _getSongs(
        ref: ref,
        limit: limit,
        offset: currentSongs.length,
        library: library,
        additional: additional,
        sortBy: extraSortBy,
        sortDirection: extraSortDirection,
        songRatingMeq: 5,
        cacheDuration: duration,
        group: groupKey,
      );

      final newSongs = newState.data?.songs ?? [];
      final mergedSongs = [...currentSongs, ...newSongs];

      state = AsyncData(
        newState.copyWith(
          data: newState.data?.copyWith(
            songs: mergedSongs,
            total: currentTotal,
          ),
        ),
      );
    } catch (e) {
      logger.e('加载更多songs失败: $e');
      state = AsyncData(oldState!);
    }
  }
}

@riverpod
class ArtistSongs extends _$ArtistSongs with ExtraProvider<SongListResponse> {
  @override
  Future<SongListResponse> build({
    required String artist,
    int limit = 100,
    int offset = 0,
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    ref.keepAliveFor(Duration(minutes: 5));
    duration = cacheDuration;
    groupKey = 'artistSongs';

    if (extraSortBy.isEmpty && extraSortDirection.isEmpty) {
      extraSortBy = 'artist';
      extraSortDirection = 'ASC';
    }
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      artist: artist,
      cacheDuration: duration,
      group: groupKey,
      sortBy: extraSortBy,
      sortDirection: extraSortDirection,
    );
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {
    if (extraSortBy == sortBy && extraSortDirection == sortDirection) {
      return;
    }

    final oldState = state.value;
    state = AsyncLoading();
    try {
      final newState = await _getSongs(
        ref: ref,
        limit: limit,
        offset: 0,
        artist: artist,
        cacheDuration: duration,
        group: groupKey,
        sortBy: sortBy,
        sortDirection: sortDirection,
      );
      state = AsyncData(newState);
    } catch (e) {
      logger.e('set Sort artistSongs失败: $e');
      state = AsyncData(oldState!);
    } finally {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value!.data;
    if (currentData == null) return;

    final currentTotal = currentData.total ?? 0;
    final currentSongs = currentData.songs;

    if (currentSongs.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await _getSongs(
        ref: ref,
        limit: limit,
        offset: currentSongs.length,
        artist: artist,
        cacheDuration: duration,
        group: groupKey,
      );

      final newSongs = newState.data?.songs ?? [];
      final mergedSongs = [...currentSongs, ...newSongs];

      state = AsyncData(
        newState.copyWith(
          data: newState.data?.copyWith(
            songs: mergedSongs,
            total: currentTotal,
          ),
        ),
      );
    } catch (e) {
      logger.e('加载更多songs失败: $e');
      state = AsyncData(oldState!);
    }
  }
}

@riverpod
Future<SongListResponse> searchSongs(
  Ref ref, {
  required String title,
  String library = 'all',
  int limit = 5000,
  int offset = 0,
  String sortDirection = 'asc',
  String additional = 'song_tag,song_audio,song_rating',
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration,
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _searchSongs(
      ref: ref,
      title: title,
      library: library,
      limit: limit,
      offset: offset,
      sortDirection: sortDirection,
      additional: additional,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
class AlbumSongs extends _$AlbumSongs with ExtraProvider<SongListResponse> {
  @override
  Future<SongListResponse> build({
    required String album,
    required String albumArtist,
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'DESC',
    String additional = 'song_tag,song_audio,song_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    ref.keepAliveFor(Duration(minutes: 5));
    duration = cacheDuration;
    groupKey = 'albumSongs';
    if (extraSortBy.isEmpty && extraSortDirection.isEmpty) {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
    return await _getAlbumSongs(
      ref: ref,
      album: album,
      albumArtist: albumArtist,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: extraSortBy,
      sortDirection: extraSortDirection,
      additional: additional,
      artist: artist,
      cacheDuration: duration,
    );
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {
    if (extraSortBy == sortBy && extraSortDirection == sortDirection) {
      return;
    }

    final oldState = state.value;
    state = AsyncLoading();
    try {
      final newState = await _getAlbumSongs(
        ref: ref,
        album: album,
        albumArtist: albumArtist,
        limit: limit,
        offset: 0,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        additional: additional,
        artist: artist,
        cacheDuration: duration,
      );
      state = AsyncData(newState);
    } catch (e) {
      logger.e('set Sort albumSongs失败: $e');
      state = AsyncData(oldState!);
    } finally {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value!.data;
    if (currentData == null) return;

    final currentTotal = currentData.total ?? 0;
    final currentSongs = currentData.songs;

    if (currentSongs.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await _getAlbumSongs(
        ref: ref,
        album: album,
        albumArtist: albumArtist,
        limit: limit,
        offset: currentSongs.length,
        library: library,
        sortBy: extraSortBy,
        sortDirection: extraSortDirection,
        additional: additional,
        artist: artist,
        cacheDuration: duration,
      );

      final newSongs = newState.data?.songs ?? [];
      final mergedSongs = [...currentSongs, ...newSongs];

      state = AsyncData(
        newState.copyWith(
          data: newState.data?.copyWith(
            songs: mergedSongs,
            total: currentTotal,
          ),
        ),
      );
    } catch (e) {
      logger.e('加载更多albumSongs失败: $e');
      state = AsyncData(oldState!);
    }
  }
}

@riverpod
class Songs extends _$Songs with ExtraProvider<SongListResponse> {
  @override
  Future<SongListResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'artist',
    String sortDirection = 'ASC',
    String additional = 'song_tag,song_audio,song_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 30),
    String group = 'songs',
  }) async {
    ref.keepAliveFor(Duration(minutes: 5));
    duration = cacheDuration;
    groupKey = group;
    if (extraSortBy.isEmpty && extraSortDirection.isEmpty) {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: extraSortBy,
      sortDirection: extraSortDirection,
      additional: additional,
      artist: artist,
      cacheDuration: duration,
      group: groupKey,
    );
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {
    if (extraSortBy == sortBy && extraSortDirection == sortDirection) {
      return;
    }

    final oldState = state.value;
    state = AsyncLoading();
    try {
      final newState = await _getSongs(
        ref: ref,
        limit: limit,
        offset: 0,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        additional: additional,
        artist: artist,
        cacheDuration: duration,
        group: groupKey,
      );
      state = AsyncData(newState);
    } catch (e) {
      logger.e('set Sort songs失败: $e');
      state = AsyncData(oldState!);
    } finally {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value!.data;
    if (currentData == null) return;

    final currentTotal = currentData.total ?? 0;
    final currentSongs = currentData.songs;

    if (currentSongs.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await _getSongs(
        ref: ref,
        limit: limit,
        offset: currentSongs.length,
        library: library,
        sortBy: extraSortBy,
        sortDirection: extraSortDirection,
        additional: additional,
        artist: artist,
        cacheDuration: duration,
        group: groupKey,
      );

      final newSongs = newState.data?.songs ?? [];
      final mergedSongs = [...currentSongs, ...newSongs];

      state = AsyncData(
        newState.copyWith(
          data: newState.data?.copyWith(
            songs: mergedSongs,
            total: currentTotal,
          ),
        ),
      );
    } catch (e) {
      logger.e('加载更多songs失败: $e');
      state = AsyncData(oldState!);
    }
  }
}
