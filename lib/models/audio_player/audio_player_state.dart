import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';

part 'audio_player_state.freezed.dart';
part 'audio_player_state.g.dart';

@freezed
sealed class AudioPlayerState with _$AudioPlayerState {
  const AudioPlayerState._();
  factory AudioPlayerState.inner({
    required bool playing,
    required PlaylistMode loopMode,
    required bool shuffled,
    @Default(0) int currentIndex,
    @Default([]) List<ToneHarborTrackObject> tracks,
    String? activeTrackId,
  }) = _AudioPlayerState;

  factory AudioPlayerState({
    required bool playing,
    required PlaylistMode loopMode,
    required bool shuffled,
    int currentIndex = 0,
    List<ToneHarborTrackObject> tracks = const [],
    String? activeTrackId,
  }) {
    return AudioPlayerState.inner(
      playing: playing,
      loopMode: loopMode,
      shuffled: shuffled,
      currentIndex: currentIndex,
      tracks: tracks,
      activeTrackId: activeTrackId,
    );
  }

  factory AudioPlayerState.fromJson(Map<String, dynamic> json) =>
      _$AudioPlayerStateFromJson(json);

  ToneHarborTrackObject? get activeTrack {
    if (currentIndex < 0 || currentIndex >= tracks.length) return null;
    return tracks[currentIndex];
  }

  bool containsTrack(ToneHarborTrackObject track) {
    return tracks.isNotEmpty &&
        tracks.any(
          (t) => track.isLocal && t.isLocal
              ? t.path == track.path
              : t.id == track.id,
        );
  }

  bool containsTracks(List<ToneHarborTrackObject> tracks) {
    return this.tracks.isNotEmpty && tracks.every(containsTrack);
  }
}
