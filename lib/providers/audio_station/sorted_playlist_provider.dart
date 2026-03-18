import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/playlist_list.dart';
import 'package:toneharbor/models/audio_station/sorted_playlist_state.dart';
import 'package:toneharbor/providers/providers.dart';

part 'sorted_playlist_provider.g.dart';

@riverpod
class SortedPlaylist extends _$SortedPlaylist {
  @override
  SortedPlaylistState build({
    required $AsyncNotifierProvider<
      ExtraProvider<PlaylistListResponse>,
      PlaylistListResponse
    >
    baseProvider,
  }) {
    final favoritePlaylistState = ref.watch(favoritePlaylistStateProvider);
    final playlistsResponse = ref.watch(baseProvider);
    return playlistsResponse.when(
      loading: () => const SortedPlaylistState.loading(),
      error: (error, stackTrace) => const SortedPlaylistState.error(),
      data: (response) {
        final data = response.data;
        if (data == null) {
          return SortedPlaylistState();
        }

        final playlists = data.playlists ?? [];
        final total = data.total;
        final favoritePlaylistIds = favoritePlaylistState.playlists
            .map((item) => item.playlistId)
            .toSet();

        final favoritePlaylists = <PlaylistInfo>[];
        final otherPlaylists = <PlaylistInfo>[];

        for (final playlist in playlists) {
          if (favoritePlaylistIds.contains(playlist.id)) {
            favoritePlaylists.add(playlist);
          } else {
            otherPlaylists.add(playlist);
          }
        }

        return SortedPlaylistState(
          playlists: [...favoritePlaylists, ...otherPlaylists],
          total: total,
          favoriteCount: favoritePlaylists.length,
        );
      },
    );
  }
}
