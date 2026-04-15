// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tone_harbor_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToneHarborTrackObjectFolder _$ToneHarborTrackObjectFolderFromJson(
  Map<String, dynamic> json,
) => ToneHarborTrackObjectFolder(
  id: json['id'] as String,
  title: json['title'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ToneHarborTrackObjectFolderToJson(
  ToneHarborTrackObjectFolder instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'runtimeType': instance.$type,
};

ToneHarborTrackObjectFull _$ToneHarborTrackObjectFullFromJson(
  Map<String, dynamic> json,
) => ToneHarborTrackObjectFull(
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
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ToneHarborTrackObjectFullToJson(
  ToneHarborTrackObjectFull instance,
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
  'runtimeType': instance.$type,
};

ToneHarborTrackObjectMultLocal _$ToneHarborTrackObjectMultLocalFromJson(
  Map<String, dynamic> json,
) => ToneHarborTrackObjectMultLocal(
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
  availableQualities: (json['availableQualities'] as List<dynamic>)
      .map((e) => $enumDecode(_$AudioQualityEnumMap, e))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ToneHarborTrackObjectMultLocalToJson(
  ToneHarborTrackObjectMultLocal instance,
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
  'availableQualities': instance.availableQualities
      .map((e) => _$AudioQualityEnumMap[e]!)
      .toList(),
  'runtimeType': instance.$type,
};

const _$AudioQualityEnumMap = {
  AudioQuality.low: 'low',
  AudioQuality.medium: 'medium',
  AudioQuality.high: 'high',
  AudioQuality.original: 'original',
};

ToneHarborTrackObjectCloudMusic _$ToneHarborTrackObjectCloudMusicFromJson(
  Map<String, dynamic> json,
) => ToneHarborTrackObjectCloudMusic(
  id: json['id'] as String,
  title: json['title'] as String,
  artist: json['artist'] as String,
  album: json['album'] as String,
  duration: Duration(microseconds: (json['duration'] as num).toInt()),
  coverUrl: json['coverUrl'] as String?,
  container: json['container'] as String?,
  filesize: (json['filesize'] as num?)?.toInt(),
  ar: (json['ar'] as List<dynamic>?)
      ?.map((e) => CloudMusicArtistData.fromJson(e as Map<String, dynamic>))
      .toList(),
  al: json['al'] == null
      ? null
      : CloudMusicAlbumData.fromJson(json['al'] as Map<String, dynamic>),
  privilege: json['privilege'] == null
      ? null
      : CloudMusicPrivilegeData.fromJson(
          json['privilege'] as Map<String, dynamic>,
        ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ToneHarborTrackObjectCloudMusicToJson(
  ToneHarborTrackObjectCloudMusic instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'artist': instance.artist,
  'album': instance.album,
  'duration': instance.duration.inMicroseconds,
  'coverUrl': instance.coverUrl,
  'container': instance.container,
  'filesize': instance.filesize,
  'ar': instance.ar,
  'al': instance.al,
  'privilege': instance.privilege,
  'runtimeType': instance.$type,
};

ToneHarborTrackObjectListEmpty _$ToneHarborTrackObjectListEmptyFromJson(
  Map<String, dynamic> json,
) => ToneHarborTrackObjectListEmpty($type: json['runtimeType'] as String?);

Map<String, dynamic> _$ToneHarborTrackObjectListEmptyToJson(
  ToneHarborTrackObjectListEmpty instance,
) => <String, dynamic>{'runtimeType': instance.$type};

ToneHarborTrackObjectListData _$ToneHarborTrackObjectListDataFromJson(
  Map<String, dynamic> json,
) => ToneHarborTrackObjectListData(
  songs: (json['songs'] as List<dynamic>)
      .map((e) => ToneHarborTrackObject.fromJson(e as Map<String, dynamic>))
      .toList(),
  offset: (json['offset'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ToneHarborTrackObjectListDataToJson(
  ToneHarborTrackObjectListData instance,
) => <String, dynamic>{
  'songs': instance.songs,
  'offset': instance.offset,
  'total': instance.total,
  'runtimeType': instance.$type,
};
