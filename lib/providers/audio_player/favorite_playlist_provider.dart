import 'package:drift/drift.dart';
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
    final items =
        await (query..orderBy([
              (s) => OrderingTerm(expression: s.id, mode: OrderingMode.desc),
            ]))
            .get();
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
    if (isFavoritePlaylist(playlistId)) {
      return;
    }

    state = state.copyWith(
      playlists: [
        FavoritePlaylistItem(playlistId: playlistId, title: title),
        ...state.playlists,
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
    if (!isFavoritePlaylist(playlistId)) {
      return;
    }

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
