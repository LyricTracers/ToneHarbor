import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';

part 'favorite_playlist_state.freezed.dart';
part 'favorite_playlist_state.g.dart';

@freezed
sealed class FavoritePlaylistState with _$FavoritePlaylistState {
  const FavoritePlaylistState._();

  const factory FavoritePlaylistState({
    required List<FavoritePlaylistItem> playlists,
  }) = _FavoritePlaylistState;
  factory FavoritePlaylistState.fromJson(Map<String, dynamic> json) =>
      _$FavoritePlaylistStateFromJson(json);

  bool containsPlaylistId(String playlistId) {
    return playlists.any((item) => item.playlistId == playlistId);
  }
}

@freezed
sealed class FavoritePlaylistItem with _$FavoritePlaylistItem {
  const factory FavoritePlaylistItem({
    required String playlistId,
    required String title,
    CloudMusicPlaylistDetailData? cloudData,
  }) = _FavoritePlaylistItem;
  factory FavoritePlaylistItem.fromJson(Map<String, dynamic> json) =>
      _$FavoritePlaylistItemFromJson(json);
}
