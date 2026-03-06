// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tone_harbor_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToneHarborTrackObjectFull _$$ToneHarborTrackObjectFullFromJson(
  Map<String, dynamic> json,
) => _$ToneHarborTrackObjectFull(
  id: json['id'] as String,
  title: json['title'] as String,
  artist: json['artist'] as String,
  album: json['album'] as String,
  externalUri: json['externalUri'] as String,
  durationMs: (json['durationMs'] as num).toInt(),
  rating: (json['rating'] as num).toInt(),
  platform: $enumDecode(_$ToneHarborTrackPlatformEnumMap, json['platform']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ToneHarborTrackObjectFullToJson(
  _$ToneHarborTrackObjectFull instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'artist': instance.artist,
  'album': instance.album,
  'externalUri': instance.externalUri,
  'durationMs': instance.durationMs,
  'rating': instance.rating,
  'platform': _$ToneHarborTrackPlatformEnumMap[instance.platform]!,
  'runtimeType': instance.$type,
};

const _$ToneHarborTrackPlatformEnumMap = {
  ToneHarborTrackPlatform.synology: 'synology',
  ToneHarborTrackPlatform.local: 'local',
};

ToneHarborTrackObjectLocal _$ToneHarborTrackObjectLocalFromJson(
  Map<String, dynamic> json,
) => ToneHarborTrackObjectLocal(
  id: json['id'] as String,
  title: json['title'] as String,
  artist: json['artist'] as String,
  album: json['album'] as String,
  externalUri: json['externalUri'] as String,
  rating: (json['rating'] as num).toInt(),
  durationMs: (json['durationMs'] as num).toInt(),
  path: json['path'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ToneHarborTrackObjectLocalToJson(
  ToneHarborTrackObjectLocal instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'artist': instance.artist,
  'album': instance.album,
  'externalUri': instance.externalUri,
  'rating': instance.rating,
  'durationMs': instance.durationMs,
  'path': instance.path,
  'runtimeType': instance.$type,
};
