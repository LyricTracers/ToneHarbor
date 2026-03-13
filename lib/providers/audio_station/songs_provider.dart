import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'songs_provider.dependence.dart';
part 'songs_provider.g.dart';

@riverpod
class SongCommon extends _$SongCommon {
  @override
  void build() {
    ref.keepAliveFor(Duration(minutes: 5));
  }

  Future<SetRatingResponse> setRating({
    required String id,
    int rating = 5,
  }) async {
    return await _setRating(ref: ref, id: id, rating: rating);
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
Future<SongListResponse> randomSongs(
  Ref ref, {
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String additional = 'song_tag,song_audio,song_rating',
  Duration? cacheDuration,
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      additional: additional,
      sortBy: 'random',
      cacheDuration: cacheDuration,
      group: 'randomSongs',
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
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
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      additional: additional,
      sortBy: sortBy,
      sortDirection: sortDirection,
      songRatingMeq: 5,
      cacheDuration: duration,
      group: groupKey,
    );
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
        sortBy: sortBy,
        sortDirection: sortDirection,
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
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      artist: artist,
      cacheDuration: duration,
      group: groupKey,
    );
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
    String sortBy = 'song_rating',
    String sortDirection = 'DESC',
    String additional = 'song_tag,song_audio,song_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    ref.keepAliveFor(Duration(minutes: 5));
    duration = cacheDuration;
    groupKey = 'albumSongs';
    return await _getAlbumSongs(
      ref: ref,
      album: album,
      albumArtist: albumArtist,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      artist: artist,
      cacheDuration: duration,
    );
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
        sortBy: sortBy,
        sortDirection: sortDirection,
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
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      artist: artist,
      cacheDuration: duration,
      group: groupKey,
    );
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
        sortBy: sortBy,
        sortDirection: sortDirection,
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
