// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioPlayerState _$AudioPlayerStateFromJson(Map<String, dynamic> json) =>
    _AudioPlayerState(
      playing: json['playing'] as bool,
      loopMode: $enumDecode(_$PlaylistModeEnumMap, json['loopMode']),
      shuffled: json['shuffled'] as bool,
      currentIndex: (json['currentIndex'] as num?)?.toInt() ?? 0,
      tracks:
          (json['tracks'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ToneHarborTrackObject.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      activeTrackId: json['activeTrackId'] as String?,
    );

Map<String, dynamic> _$AudioPlayerStateToJson(_AudioPlayerState instance) =>
    <String, dynamic>{
      'playing': instance.playing,
      'loopMode': _$PlaylistModeEnumMap[instance.loopMode]!,
      'shuffled': instance.shuffled,
      'currentIndex': instance.currentIndex,
      'tracks': instance.tracks,
      'activeTrackId': instance.activeTrackId,
    };

const _$PlaylistModeEnumMap = {
  PlaylistMode.none: 'none',
  PlaylistMode.single: 'single',
  PlaylistMode.loop: 'loop',
};
