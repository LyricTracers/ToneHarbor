import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/artist.dart';
import 'package:toneharbor/models/audio_station/album.dart';
import 'package:toneharbor/providers/audio_station/songs_provider.dart';
import 'package:toneharbor/providers/audio_station/artists_provider.dart';
import 'package:toneharbor/providers/audio_station/albums_provider.dart';
import 'package:toneharbor/utils/base_utils.dart';
part 'search_provider.g.dart';

enum SearchType { all, songs, artists, albums }

class MixSearchData {
  final ToneHarborTrackObjectList? songs;
  final ArtistResponse? artists;
  final AlbumResponse? albums;
  const MixSearchData({this.songs, this.artists, this.albums});
}

@riverpod
class MixSearch extends _$MixSearch {
  @override
  Future<MixSearchData> build({
    required String query,
    SearchType type = SearchType.all,
  }) async {
    ref.keepAliveFor(Duration(minutes: 5));
    if (query.trim().isEmpty) {
      return const MixSearchData();
    }

    MixSearchData target;
    try {
      switch (type) {
        case SearchType.all:
          final results = await Future.wait([
            ref.read(searchSongsProvider(title: query).future),
            ref.read(searchArtistProvider(filter: query).future),
            ref.read(searchAlbumsProvider(filter: query).future),
          ]);

          target = MixSearchData(
            songs: results[0] as ToneHarborTrackObjectList,
            artists: results[1] as ArtistResponse,
            albums: results[2] as AlbumResponse,
          );

        case SearchType.songs:
          final songs = await ref.read(
            searchSongsProvider(title: query).future,
          );
          target = MixSearchData(songs: songs);

        case SearchType.artists:
          final artists = await ref.read(
            searchArtistProvider(filter: query).future,
          );
          target = MixSearchData(artists: artists);

        case SearchType.albums:
          final albums = await ref.read(
            searchAlbumsProvider(filter: query).future,
          );
          target = MixSearchData(albums: albums);
      }
    } catch (e) {
      logger.e('搜索失败: $e');
      rethrow;
    }
    return target;
  }
}
