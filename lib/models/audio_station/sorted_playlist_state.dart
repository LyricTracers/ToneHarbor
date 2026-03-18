import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toneharbor/models/audio_station/playlist_list.dart';

part 'sorted_playlist_state.freezed.dart';
part 'sorted_playlist_state.g.dart';

@freezed
sealed class SortedPlaylistState with _$SortedPlaylistState {
  const SortedPlaylistState._();
  factory SortedPlaylistState.data({
    @Default([]) List<PlaylistInfo> playlists,
    @Default(0) int total,
    @Default(0) int favoriteCount,
  }) = SortedPlaylistStateData;

  factory SortedPlaylistState({
    List<PlaylistInfo> playlists = const [],
    int total = 0,
    int favoriteCount = 0,
  }) {
    return SortedPlaylistState.data(
      playlists: playlists,
      total: total,
      favoriteCount: favoriteCount,
    );
  }

  const factory SortedPlaylistState.loading() = SortedPlaylistStateLoading;
  const factory SortedPlaylistState.error() = SortedPlaylistStateError;
  factory SortedPlaylistState.fromJson(Map<String, dynamic> json) =>
      _$SortedPlaylistStateFromJson(json);

  T when<T>({
    required T Function(SortedPlaylistStateData) data,
    required T Function() loading,
    required T Function() error,
  }) {
    return switch (this) {
      SortedPlaylistStateData() => data(this as SortedPlaylistStateData),
      SortedPlaylistStateLoading() => loading(),
      SortedPlaylistStateError() => error(),
    };
  }
}
