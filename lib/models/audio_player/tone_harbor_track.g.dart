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
  duration: Duration(microseconds: (json['duration'] as num).toInt()),
  filesize: (json['filesize'] as num).toInt(),
  bitrate: (json['bitrate'] as num).toInt(),
  channel: (json['channel'] as num).toInt(),
  codec: json['codec'] as String,
  container: json['container'] as String,
  frequency: (json['frequency'] as num).toInt(),
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
  'duration': instance.duration.inMicroseconds,
  'filesize': instance.filesize,
  'bitrate': instance.bitrate,
  'channel': instance.channel,
  'codec': instance.codec,
  'container': instance.container,
  'frequency': instance.frequency,
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
  filesize: (json['filesize'] as num).toInt(),
  rating: (json['rating'] as num).toInt(),
  duration: Duration(microseconds: (json['duration'] as num).toInt()),
  bitrate: (json['bitrate'] as num).toInt(),
  channel: (json['channel'] as num).toInt(),
  codec: json['codec'] as String,
  container: json['container'] as String,
  frequency: (json['frequency'] as num).toInt(),
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
  'filesize': instance.filesize,
  'rating': instance.rating,
  'duration': instance.duration.inMicroseconds,
  'bitrate': instance.bitrate,
  'channel': instance.channel,
  'codec': instance.codec,
  'container': instance.container,
  'frequency': instance.frequency,
  'path': instance.path,
  'runtimeType': instance.$type,
};
