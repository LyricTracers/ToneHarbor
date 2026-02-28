import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/models/audio_station/artist.dart';
import 'package:toneharbor/models/audio_station/album.dart';
import 'package:toneharbor/providers/audio_station/songs_provider.dart';
import 'package:toneharbor/providers/audio_station/artists_provider.dart';
import 'package:toneharbor/providers/audio_station/albums_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_provider.g.dart';
part 'search_provider.freezed.dart';

enum SearchType { all, songs, artists, albums }

@keepAlive
class MixSearchResults extends _$MixSearchResults {
  @override
  MixSearchData? build() {
    return null;
  }

  Future<void> search(String query, SearchType type) async {
    if (query.trim().isEmpty) {
      state = null;
      return;
    }

    state = MixSearchData.loading();

    try {
      switch (type) {
        case SearchType.all:
          final results = await Future.wait([
            ref.read(searchSongsProvider(title: query).future),
            ref.read(searchArtistsProvider(filter: query).future),
            ref.read(searchAlbumsProvider(filter: query).future),
          ]);

          state = MixSearchData.loaded(
            songs: results[0] as SongListResponse,
            artists: results[1] as ArtistResponse,
            albums: results[2] as AlbumResponse,
          );
          break;

        case SearchType.songs:
          final songs = await ref.read(
            searchSongsProvider(title: query).future,
          );
          state = MixSearchData.loaded(songs: songs);
          break;

        case SearchType.artists:
          final artists = await ref.read(
            searchArtistsProvider(filter: query).future,
          );
          state = MixSearchData.loaded(artists: artists);
          break;

        case SearchType.albums:
          final albums = await ref.read(
            searchAlbumsProvider(filter: query).future,
          );
          state = MixSearchData.loaded(albums: albums);
          break;
      }
    } catch (e) {
      logger.e('搜索失败: $e');
      state = MixSearchData.error(e.toString());
    }
  }

  void clear() {
    state = null;
  }
}

@freezed
class MixSearchData with _$MixSearchData {
  const factory MixSearchData.loading() = _MixSearchDataLoading;

  const factory MixSearchData.loaded({
    SongListResponse? songs,
    ArtistResponse? artists,
    AlbumResponse? albums,
  }) = _MixSearchDataLoaded;

  const factory MixSearchData.error(String message) = _MixSearchDataError;
}
