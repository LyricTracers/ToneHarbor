import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/albums.dart';
import 'package:toneharbor/services/cloud_music/artists.dart';
import 'package:toneharbor/services/cloud_music/playlists.dart';
import 'package:toneharbor/services/cloud_music/search.dart';
import 'package:toneharbor/services/cloud_music/user.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'cloud_music_provider.g.dart';

@riverpod
bool shouldUseCloudMusicHome(Ref ref) {
  final apiState = ref.watch(cloudMusicApiUrlsProvider);
  return apiState.useAsHome && apiState.defaultUrl.isNotEmpty;
}

@riverpod
class RecommendPlaylists extends _$RecommendPlaylists
    with ExtraProvider<CloudMusicPlaylistDataList> {
  @override
  Future<CloudMusicPlaylistDataList> build({
    int limit = 10,
    Duration? cacheDuration = const Duration(minutes: 60),
  }) async {
    ref.keepAliveFor(Duration(minutes: 5));
    return await recommendPlaylists(
      ref,
      limit: limit,
      cacheDuration: cacheDuration,
    );
  }

  @override
  Future<void> loadMore() async {}

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

Future<CloudMusicPlaylistDataList> recommendPlaylists(
  Ref ref, {
  int limit = 10,
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final apiState = ref.watch(cloudMusicApiUrlsProvider);
  final loginState = ref.watch(cloudMusicAuthStateProvider);
  if (apiState.defaultUrl.isNotEmpty) {
    if (loginState) {
      final playlists = await Future.wait([
        dailyRecommendPlaylist(ref, cacheDuration: cacheDuration),
        recommendPlaylist(ref, limit: limit, cacheDuration: cacheDuration),
      ]);
      final dailyRecommend = playlists[0];
      final recommend = playlists[1];
      final playlistsList = [
        ...dailyRecommend,
        ...recommend,
      ].take(limit).toList();
      return CloudMusicPlaylistDataList(
        playlists: playlistsList,
        total: playlistsList.length,
      );
    } else {
      final playlistsList = await recommendPlaylist(
        ref,
        limit: limit,
        cacheDuration: cacheDuration,
      );
      return CloudMusicPlaylistDataList(
        playlists: playlistsList,
        total: playlistsList.length,
      );
    }
  }
  return const CloudMusicPlaylistDataList(playlists: [], total: 0);
}

@riverpod
Future<List<CloudMusicArtistData>> recommendTopArtist(
  Ref ref, {
  int limit = 6,
  Duration? cacheDuration = const Duration(minutes: 60),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  final apiState = ref.watch(cloudMusicApiUrlsProvider);
  final type = ref.read(cloudMusicLanguageProvider);
  if (apiState.defaultUrl.isNotEmpty) {
    try {
      final artists = await toplistOfArtists(
        ref,
        type: type.value,
        cacheDuration: cacheDuration,
      );
      if (artists.length <= limit) {
        return artists;
      }
      final indices = <int>{};
      final random = Random();
      while (indices.length < limit) {
        indices.add(random.nextInt(artists.length));
      }
      return indices.map((i) => artists[i]).toList();
    } finally {
      if (keepAliveDuration == null) {
        link.close();
      }
    }
  }
  return const [];
}

@riverpod
class CloudMusicPlaylistDetail extends _$CloudMusicPlaylistDetail {
  @override
  Future<CloudMusicPlaylistDetailData?> build(int playlistId) async {
    ref.keepAliveFor(Duration(minutes: 1));
    return await getPlaylistDetail(ref, id: playlistId);
  }

  Future<void> loadMore({int loadNum = 100}) async {
    final current = state.value;
    if (current == null) return;

    final trackIds = current.trackIds;
    final tracks = current.tracks ?? [];

    if (trackIds == null || tracks.length >= trackIds.length) return;

    final startIndex = tracks.length;
    final endIndex = (startIndex + loadNum).clamp(0, trackIds.length);

    if (startIndex >= endIndex) return;

    final idsToLoad = trackIds
        .sublist(startIndex, endIndex)
        .map((t) => t.id)
        .toList();

    if (idsToLoad.isEmpty) return;

    state = const AsyncValue.loading();

    try {
      final newTracks = await getTrackDetail(ref, ids: idsToLoad);

      state = AsyncValue.data(
        current.copyWith(tracks: [...tracks, ...newTracks]),
      );
    } catch (e) {
      state = AsyncValue.data(current);
    }
  }

  bool get hasMore {
    final current = state.value;
    if (current == null || current.trackIds == null) return false;
    final tracks = current.tracks ?? [];
    return tracks.length < current.trackIds!.length;
  }

  int get totalTracks {
    final current = state.value;
    if (current == null || current.trackIds == null) return 0;
    return current.trackIds!.length;
  }

  int get loadedTracks {
    final current = state.value;
    if (current == null) return 0;
    return current.tracks?.length ?? 0;
  }
}

@keepAlive
class CloudUserInfo extends _$CloudUserInfo {
  @override
  Future<CloudMusicUserData?> build() async {
    final loginState = ref.watch(cloudMusicAuthStateProvider);
    if (loginState) {
      return getUserInfo(ref);
    }
    return null;
  }
}

@riverpod
class CloudMusicPlaylistCatlist extends _$CloudMusicPlaylistCatlist
    with ExtraProvider<CloudMusicPlaylistDataList> {
  @override
  Future<CloudMusicPlaylistDataList> build({
    required String cat,
    int limit = 50,
    int offset = 0,
    Duration? cacheDuration = const Duration(minutes: 60),
  }) async {
    ref.keepAliveFor(Duration(minutes: 1));
    return await getPlaylistCatlist(
      ref,
      cat: cat,
      limit: limit,
      offset: offset,
      cacheDuration: cacheDuration,
    );
  }

  @override
  Future<void> loadMore() async {
    final currentData = state.value;
    if (currentData == null) {
      return;
    }

    final currentTotal = currentData.total ?? 0;
    final currentPlaylists = currentData.playlists;

    if (currentPlaylists.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await getPlaylistCatlist(
        ref,
        cat: cat,
        limit: limit,
        offset: currentPlaylists.length,
        cacheDuration: duration,
      );

      final newPlaylists = newState.playlists;
      final mergedPlaylists = [...currentPlaylists, ...newPlaylists];

      state = AsyncData(
        newState.copyWith(playlists: mergedPlaylists, total: currentTotal),
      );
    } catch (e) {
      logger.e('加载更多playlists失败: $e');
      state = AsyncData(oldState!);
    }
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

@riverpod
class CloudMusicArtistDetail extends _$CloudMusicArtistDetail {
  @override
  CloudMusicAristDetailData build(
    CloudMusicArtistData artistData, {
    Duration? cacheDuration = const Duration(days: 30),
  }) {
    ref.keepAliveFor(Duration(minutes: 5));
    getArtistDetail();
    getAlbums();
    getSimilarArtists();
    return CloudMusicAristDetailData(
      artist: artistData,
      hotAlbumsFlag: 1,
      hotSongFlag: 1,
      similarArtistsFlag: 1,
    );
  }

  Future<void> getArtistDetail() async {
    try {
      var detail = await cloudArtistDetail(
        ref,
        artistData: artistData,
        cacheDuration: cacheDuration,
      );
      if (detail.hotSongs != null) {
        final trackIds = detail.hotSongs!.map((t) => t.songId).toList();
        final tracks = await getTrackDetail(ref, ids: trackIds);
        detail = detail.copyWith(hotSongs: tracks);
      }
      state = state.copyWith(
        hotSongFlag: 0,
        hotSongs: detail.hotSongs,
        artist: detail.artist,
      );
    } catch (e) {
      state = state.copyWith(hotSongFlag: -1);
      logger.e('加载artist detail失败: $e');
    }
  }

  Future<void> getAlbums() async {
    try {
      var detail = await cloudArtistAlbums(
        ref,
        artistData: artistData,
        cacheDuration: cacheDuration,
      );
      state = state.copyWith(hotAlbumsFlag: 0, hotAlbums: detail.hotAlbums);
    } catch (e) {
      state = state.copyWith(hotAlbumsFlag: -1);
      logger.e('加载artist albums失败: $e');
    }
  }

  Future<void> getSimilarArtists() async {
    try {
      var detail = await similarArtists(
        ref,
        artistId: artistData.id,
        cacheDuration: cacheDuration,
      );
      state = state.copyWith(similarArtistsFlag: 0, similarArtists: detail);
      logger.i('加载artist similar artists成功: $detail');
    } catch (e) {
      state = state.copyWith(similarArtistsFlag: -1);
      logger.e('加载artist similar artists失败: $e');
    }
  }
}

@riverpod
Future<CloudMusicAlbumDetailData?> getCloudAlbumDetail(
  Ref ref, {
  required int albumId,
  Duration? keepAliveDuration = const Duration(minutes: 5),
  Duration? cacheDuration = const Duration(days: 30),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await cloudAlbumDetail(
      ref,
      albumId: albumId,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
class CloudLikelistState extends _$CloudLikelistState
    with ExtraProvider<ToneHarborTrackObjectList> {
  @override
  Future<ToneHarborTrackObjectList> build() async {
    ref.keepAliveFor(Duration(minutes: 5));
    return await cloudLikeList(ref);
  }

  Future<void> updateLike(ToneHarborTrackObjectCloudMusic track) async {
    bool flag = isLike(track.id);

    bool isSuccess = await cloudLikeTrack(track.id, !flag, ref);
    if (isSuccess) {
      if (flag) {
        final songs = List<ToneHarborTrackObject>.from(state.value!.songs);
        songs.removeWhere((t) => t.id == track.id);
        if (songs.isNotEmpty) {
          state = AsyncData(ToneHarborTrackObjectListData(songs: songs));
        } else {
          state = AsyncData(ToneHarborTrackObjectListEmpty());
        }
      } else {
        final songs = List<ToneHarborTrackObject>.from(state.value!.songs);
        if (!songs.any((t) => t.id == track.id)) {
          songs.add(track);
        }
        state = AsyncData(ToneHarborTrackObjectListData(songs: songs));
      }
    }
  }

  bool isLike(String trackId) {
    if (state.value != null && state.value is ToneHarborTrackObjectListData) {
      return state.value!.songs.any((t) => t.id == trackId);
    }
    return false;
  }

  @override
  Future<void> loadMore() async {}

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

@riverpod
class CloudDailyRecommend extends _$CloudDailyRecommend
    with ExtraProvider<ToneHarborTrackObjectList> {
  @override
  Future<ToneHarborTrackObjectList> build() async {
    ref.keepAliveFor(Duration(minutes: 5));
    return await getDailyRecommend(ref);
  }

  @override
  Future<void> loadMore() async {}

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

@riverpod
class CloudToplist extends _$CloudToplist
    with ExtraProvider<CloudMusicPlaylistDataList> {
  @override
  Future<CloudMusicPlaylistDataList> build({
    Duration? cacheDuration = const Duration(minutes: 60),
  }) async {
    ref.keepAliveFor(Duration(minutes: 5));
    return await getToplist(ref, cacheDuration: cacheDuration);
  }

  @override
  Future<void> loadMore() async {}

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

@riverpod
class CloudMusicArtistAllSongs extends _$CloudMusicArtistAllSongs
    with ExtraProvider<ToneHarborTrackObjectList> {
  @override
  Future<ToneHarborTrackObjectList> build({
    required String artistId,
    int limit = 50,
    int offset = 0,
    String order = 'hot', //hot ,time 按照热门或者时间排序
    Duration? cacheDuration = const Duration(minutes: 60),
  }) async {
    ref.keepAliveFor(Duration(minutes: 1));
    return await getArtistAllSongs(
      ref,
      artistId: artistId,
      limit: limit,
      offset: offset,
      order: order,
      cacheDuration: cacheDuration,
    );
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value;
    if (currentData == null || currentData is! ToneHarborTrackObjectListData) {
      return;
    }

    final currentTotal = currentData.total ?? 0;
    final currentSongs = currentData.songs;

    if (currentSongs.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await getArtistAllSongs(
        ref,
        artistId: artistId,
        limit: limit,
        offset: currentSongs.length,
        order: order,
        cacheDuration: cacheDuration,
      );

      if (newState is! ToneHarborTrackObjectListData) {
        return;
      }
      final newSongs = newState.songs;
      final mergedSongs = [...currentSongs, ...newSongs];

      state = AsyncData(
        newState.copyWith(songs: mergedSongs, total: currentTotal),
      );
    } catch (e) {
      logger.e('加载更多songs失败: $e');
      state = AsyncData(oldState!);
    }
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

@riverpod
class CloudMusicAlbumNew extends _$CloudMusicAlbumNew
    with ExtraProvider<CloudAlbumListData> {
  @override
  Future<CloudAlbumListData> build({
    int limit = 30,
    int offset = 0,
    required String area,
    Duration? cacheDuration = const Duration(minutes: 60),
  }) async {
    ref.keepAliveFor(Duration(minutes: 1));
    return await cloudAlbumNew(
      ref,
      area: area,
      limit: limit,
      offset: offset,
      cacheDuration: cacheDuration,
    );
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value;
    if (currentData == null || currentData.albums == null) {
      return;
    }

    final currentTotal = currentData.total ?? 0;
    final currentAlbums = currentData.albums!;

    if (currentAlbums.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await cloudAlbumNew(
        ref,
        area: area,
        limit: limit,
        offset: currentAlbums.length,
        cacheDuration: cacheDuration,
      );

      if (newState.albums == null) {
        return;
      }
      final newAlbums = newState.albums!;
      final mergedAlbums = [...currentAlbums, ...newAlbums];

      state = AsyncData(
        newState.copyWith(albums: mergedAlbums, total: currentTotal),
      );
    } catch (e) {
      logger.e('加载更多albums失败: $e');
      state = AsyncData(oldState!);
    }
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

@riverpod
class CloudMusicArtistGroupList extends _$CloudMusicArtistGroupList
    with ExtraProvider<CloudArtistListData> {
  @override
  Future<CloudArtistListData> build({
    int limit = 50,
    int offset = 0,
    String initial = '',
    Duration? cacheDuration = const Duration(minutes: 60),
    required int area,
    required int type,
  }) async {
    ref.keepAliveFor(Duration(minutes: 1));
    return await cloudArtistListData(
      ref,
      type: type,
      area: area,
      limit: limit,
      offset: offset,
      initial: initial,
      cacheDuration: cacheDuration,
    );
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value;
    if (currentData == null || currentData.artists == null) {
      return;
    }

    if (currentData.more == false) return;
    final currentArtists = currentData.artists!;

    final oldState = state.value;
    try {
      final newState = await cloudArtistListData(
        ref,
        type: type,
        area: area,
        limit: limit,
        offset: currentArtists.length,
        cacheDuration: cacheDuration,
      );

      if (newState.artists == null) {
        return;
      }
      final newArtists = newState.artists!;
      final mergedArtists = [...currentArtists, ...newArtists];

      state = AsyncData(
        newState.copyWith(artists: mergedArtists, more: newState.more),
      );
    } catch (e) {
      logger.e('加载更多artists失败: $e');
      state = AsyncData(oldState!);
    }
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

@riverpod
class CloudMusicSearchSongs extends _$CloudMusicSearchSongs
    with ExtraProvider<CloudSongsListData> {
  @override
  Future<CloudSongsListData> build({
    int limit = 30,
    int offset = 0,
    required String query,
    Duration? cacheDuration = const Duration(minutes: 60),
  }) async {
    ref.keepAliveFor(Duration(minutes: 1));
    return await cloudSearchSongs(
      ref,
      query: query,
      limit: limit,
      offset: offset,
      cacheDuration: cacheDuration,
    );
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value;
    if (currentData == null || currentData.songs == null) {
      return;
    }

    if (currentData.hasMore == false) return;
    final currentSongs = currentData.songs!;

    final oldState = state.value;
    try {
      final newState = await cloudSearchSongs(
        ref,
        query: query,
        limit: limit,
        offset: currentSongs.length,
        cacheDuration: cacheDuration,
      );

      if (newState.songs == null || newState.songs!.isEmpty) {
        return;
      }
      final newSongs = newState.songs!;
      final mergedSongs = [...currentSongs, ...newSongs];

      state = AsyncData(
        newState.copyWith(
          songs: mergedSongs,
          hasMore: newState.hasMore,
          songCount: newState.songCount,
        ),
      );
    } catch (e) {
      logger.e('加载更多songs失败: $e');
      state = AsyncData(oldState!);
    }
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

@riverpod
class CloudMusicSearchArtists extends _$CloudMusicSearchArtists
    with ExtraProvider<CloudArtistListData> {
  @override
  Future<CloudArtistListData> build({
    int limit = 30,
    int offset = 0,
    required String query,
    Duration? cacheDuration = const Duration(minutes: 60),
  }) async {
    ref.keepAliveFor(Duration(minutes: 1));
    return await cloudSearchArtists(
      ref,
      query: query,
      limit: limit,
      offset: offset,
      cacheDuration: cacheDuration,
    );
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value;
    if (currentData == null || currentData.artists == null) {
      return;
    }

    if (currentData.more == false) return;
    final currentArtists = currentData.artists!;

    final oldState = state.value;
    try {
      final newState = await cloudSearchArtists(
        ref,
        query: query,
        limit: limit,
        offset: currentArtists.length,
        cacheDuration: cacheDuration,
      );

      if (newState.artists == null || newState.artists!.isEmpty) {
        return;
      }
      final newArtists = newState.artists!;
      final mergedArtists = [...currentArtists, ...newArtists];

      state = AsyncData(
        newState.copyWith(
          artists: mergedArtists,
          more: newState.more,
          hasMore: newState.hasMore,
          artistCount: newState.artistCount,
        ),
      );
    } catch (e) {
      logger.e('加载更多artists失败: $e');
      state = AsyncData(oldState!);
    }
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

@riverpod
class CloudMusicSearchAlbums extends _$CloudMusicSearchAlbums
    with ExtraProvider<CloudAlbumListData> {
  @override
  Future<CloudAlbumListData> build({
    int limit = 30,
    int offset = 0,
    required String query,
    Duration? cacheDuration = const Duration(minutes: 60),
  }) async {
    ref.keepAliveFor(Duration(minutes: 1));
    return await cloudSearchAlbums(
      ref,
      query: query,
      limit: limit,
      offset: offset,
      cacheDuration: cacheDuration,
    );
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value;
    if (currentData == null || currentData.albums == null) {
      return;
    }
    final count = currentData.albumCount ?? 0;
    final currentAlbums = currentData.albums!;

    if (count <= currentAlbums.length) return;

    final oldState = state.value;
    try {
      final newState = await cloudSearchAlbums(
        ref,
        query: query,
        limit: limit,
        offset: currentAlbums.length,
        cacheDuration: cacheDuration,
      );

      if (newState.albums == null || newState.albums!.isEmpty) {
        return;
      }
      final newAlbums = newState.albums!;
      final mergedAlbums = [...currentAlbums, ...newAlbums];

      state = AsyncData(
        newState.copyWith(
          albums: mergedAlbums,
          albumCount: newState.albumCount,
        ),
      );
    } catch (e) {
      logger.e('加载更多albums失败: $e');
      state = AsyncData(oldState!);
    }
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}

@riverpod
class CloudMusicSearchPlaylists extends _$CloudMusicSearchPlaylists
    with ExtraProvider<CloudMusicPlaylistDataList> {
  @override
  Future<CloudMusicPlaylistDataList> build({
    int limit = 30,
    int offset = 0,
    required String query,
    Duration? cacheDuration = const Duration(minutes: 60),
  }) async {
    ref.keepAliveFor(Duration(minutes: 1));
    return await cloudSearchPlaylists(
      ref,
      query: query,
      limit: limit,
      offset: offset,
      cacheDuration: cacheDuration,
    );
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value;
    if (currentData == null || currentData.playlists.isEmpty) {
      return;
    }
    final count = currentData.playlistCount ?? currentData.total ?? 0;
    final currentPlaylists = currentData.playlists;

    if (count <= currentPlaylists.length) return;
    final oldState = state.value;
    try {
      final newState = await cloudSearchPlaylists(
        ref,
        query: query,
        limit: limit,
        offset: currentPlaylists.length,
        cacheDuration: cacheDuration,
      );
      if (newState.playlists.isEmpty) {
        return;
      }
      final newPlaylists = newState.playlists;
      final mergedPlaylists = [...currentPlaylists, ...newPlaylists];

      state = AsyncData(
        newState.copyWith(
          playlists: mergedPlaylists,
          playlistCount: newState.playlistCount,
          total: newState.playlistCount,
        ),
      );
    } catch (e) {
      logger.e('加载更多playlists失败: $e');
      state = AsyncData(oldState!);
    }
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {}
}
