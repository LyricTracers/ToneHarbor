import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/artist.dart';
import 'package:toneharbor/models/audio_station/album.dart';
import 'package:toneharbor/providers/providers.dart';
part 'search_provider.g.dart';

class MixSearchData {
  final ToneHarborTrackObjectList? songs;
  final ArtistResponse? artists;
  final AlbumResponse? albums;
  final int searchSongFlag;
  final int searchArtistFlag;
  final int searchAlbumFlag;

  const MixSearchData({
    this.songs,
    this.artists,
    this.albums,
    this.searchSongFlag = 0,
    this.searchArtistFlag = 0,
    this.searchAlbumFlag = 0,
  });
  MixSearchData copyWith({
    ToneHarborTrackObjectList? songs,
    ArtistResponse? artists,
    AlbumResponse? albums,
    int? searchSongFlag,
    int? searchArtistFlag,
    int? searchAlbumFlag,
  }) => MixSearchData(
    songs: songs ?? this.songs,
    artists: artists ?? this.artists,
    albums: albums ?? this.albums,
    searchSongFlag: searchSongFlag ?? this.searchSongFlag,
    searchArtistFlag: searchArtistFlag ?? this.searchArtistFlag,
    searchAlbumFlag: searchAlbumFlag ?? this.searchAlbumFlag,
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
    return MixSearchData(
      searchSongFlag: 1,
      searchArtistFlag: 1,
      searchAlbumFlag: 1,
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
}
