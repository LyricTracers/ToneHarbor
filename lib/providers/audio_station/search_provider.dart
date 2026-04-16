import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/artist.dart';
import 'package:toneharbor/models/audio_station/album.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/search.dart';
import 'package:toneharbor/utils/base_utils.dart';
part 'search_provider.g.dart';

class MixSearchData {
  final ToneHarborTrackObjectList? songs;
  final ArtistResponse? artists;
  final AlbumResponse? albums;
  final List<CloudMusicArtistData>? cloudArtistsList;
  final List<CloudMusicAlbumData>? cloudAlbumsList;
  final List<CloudMusicSongData>? cloudSongsList;
  final int searchSongFlag;
  final int searchArtistFlag;
  final int searchAlbumFlag;
  final int searchCloudFlag;
  final int searchHotFlag;

  const MixSearchData({
    this.songs,
    this.artists,
    this.albums,
    this.cloudArtistsList,
    this.cloudAlbumsList,
    this.cloudSongsList,
    this.searchSongFlag = 0,
    this.searchArtistFlag = 0,
    this.searchAlbumFlag = 0,
    this.searchCloudFlag = 0,
    this.searchHotFlag = 0,
  });
  MixSearchData copyWith({
    ToneHarborTrackObjectList? songs,
    ArtistResponse? artists,
    AlbumResponse? albums,
    List<CloudMusicArtistData>? cloudArtistsList,
    List<CloudMusicAlbumData>? cloudAlbumsList,
    int? searchSongFlag,
    int? searchArtistFlag,
    int? searchAlbumFlag,
    int? searchCloudFlag,
    int? searchHotFlag,
  }) => MixSearchData(
    songs: songs ?? this.songs,
    artists: artists ?? this.artists,
    albums: albums ?? this.albums,
    cloudArtistsList: cloudArtistsList ?? this.cloudArtistsList,
    cloudAlbumsList: cloudAlbumsList ?? this.cloudAlbumsList,
    searchSongFlag: searchSongFlag ?? this.searchSongFlag,
    searchArtistFlag: searchArtistFlag ?? this.searchArtistFlag,
    searchAlbumFlag: searchAlbumFlag ?? this.searchAlbumFlag,
    searchCloudFlag: searchCloudFlag ?? this.searchCloudFlag,
    searchHotFlag: searchHotFlag ?? this.searchHotFlag,
  );
}

@riverpod
class MixSearch extends _$MixSearch {
  @override
  MixSearchData build({required String query}) {
    if (query.trim().isEmpty) {
      return const MixSearchData();
    }
    searchSongs(query);
    searchArtists(query);
    searchAlbums(query);
    searchCloud(query);
    return MixSearchData(
      searchSongFlag: 1,
      searchArtistFlag: 1,
      searchAlbumFlag: 1,
      searchCloudFlag: 1,
      searchHotFlag: 1,
    );
  }

  Future<void> searchSongs(String query) async {
    try {
      final songs = await ref.watch(searchSongsProvider(title: query).future);
      state = state.copyWith(songs: songs, searchSongFlag: 0);
    } catch (e) {
      logger.e('搜索歌曲失败: $e');
      state = state.copyWith(searchSongFlag: 0);
    }
  }

  Future<void> searchArtists(String query) async {
    try {
      final artists = await ref.watch(
        searchArtistProvider(filter: query).future,
      );
      state = state.copyWith(artists: artists, searchArtistFlag: 0);
    } catch (e) {
      logger.e('搜索艺术家失败: $e');
      state = state.copyWith(searchArtistFlag: 0);
    }
  }

  Future<void> searchAlbums(String query) async {
    try {
      final albums = await ref.watch(
        searchAlbumsProvider(filter: query).future,
      );
      state = state.copyWith(albums: albums, searchAlbumFlag: 0);
    } catch (e) {
      logger.e('搜索专辑失败: $e');
      state = state.copyWith(searchAlbumFlag: 0);
    }
  }

  Future<void> searchCloud(String query) async {
    try {
      final cloudSongs = await searchSuggest(
        ref,
        query: query,
        cacheDuration: const Duration(days: 30),
      );

      if (cloudSongs.songs != null && cloudSongs.songs!.isNotEmpty) {
        final currentSongs = state.songs?.songs ?? [];
        final newSongs = List<ToneHarborTrackObject>.from(currentSongs);
        newSongs.insertAll(
          0,
          cloudSongs.songs!.map((e) => e.asTrack()).toList(),
        );
        state = state.copyWith(
          songs: ToneHarborTrackObjectList.data(songs: newSongs),
          cloudArtistsList: cloudSongs.artists,
          cloudAlbumsList: cloudSongs.albums,
          searchCloudFlag: 0,
        );
      } else {
        state = state.copyWith(
          cloudArtistsList: cloudSongs.artists,
          cloudAlbumsList: cloudSongs.albums,
          searchCloudFlag: 0,
        );
      }
    } catch (e) {
      logger.e('搜索云音乐失败: $e');
      state = state.copyWith(searchCloudFlag: 0);
    }
  }
}

@riverpod
Future<List<String>?> searchCloudHot(Ref ref) async {
  ref.keepAliveFor(Duration(minutes: 1));
  return await searchHot(ref);
}
