import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/favorite_playlist_state.dart';
import 'package:toneharbor/models/database/database.dart';
import 'package:toneharbor/providers/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favorite_playlist_provider.g.dart';

@keepAlive
class FavoritePlaylistStateNotifier extends _$FavoritePlaylistStateNotifier {
  @override
  FavoritePlaylistState build() {
    _syncSavedState();
    return FavoritePlaylistState(playlists: []);
  }

  Future<void> _syncSavedState() async {
    final database = ref.read(appDatabaseProvider);
    final query = database.select(database.favoritePlaylistStateTable);
    final items = await query.get();
    final playlists = items
        .map(
          (item) => FavoritePlaylistItem(
            playlistId: item.playlistId,
            title: item.title,
          ),
        )
        .toList();
    state = state.copyWith(playlists: playlists);
  }

  Future<void> addFavoritePlaylist(String playlistId, String title) async {
    state = state.copyWith(
      playlists: [
        ...state.playlists,
        FavoritePlaylistItem(playlistId: playlistId, title: title),
      ],
    );

    final database = ref.read(appDatabaseProvider);

    await database
        .into(database.favoritePlaylistStateTable)
        .insert(
          FavoritePlaylistStateTableCompanion.insert(
            playlistId: playlistId,
            title: title,
          ),
        );
  }

  Future<void> removeFavoritePlaylist(String playlistId) async {
    state = state.copyWith(
      playlists: state.playlists
          .where((item) => item.playlistId != playlistId)
          .toList(),
    );

    final database = ref.read(appDatabaseProvider);

    await (database.delete(
      database.favoritePlaylistStateTable,
    )..where((tbl) => tbl.playlistId.equals(playlistId))).go();
  }

  bool isFavoritePlaylist(String playlistId) {
    return state.playlists.any((item) => item.playlistId == playlistId);
  }
}
