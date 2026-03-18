// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sorted_playlist_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortedPlaylistStateData _$SortedPlaylistStateDataFromJson(
  Map<String, dynamic> json,
) => SortedPlaylistStateData(
  playlists:
      (json['playlists'] as List<dynamic>?)
          ?.map((e) => PlaylistInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  favoriteCount: (json['favoriteCount'] as num?)?.toInt() ?? 0,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SortedPlaylistStateDataToJson(
  SortedPlaylistStateData instance,
) => <String, dynamic>{
  'playlists': instance.playlists,
  'total': instance.total,
  'favoriteCount': instance.favoriteCount,
  'runtimeType': instance.$type,
};

SortedPlaylistStateLoading _$SortedPlaylistStateLoadingFromJson(
  Map<String, dynamic> json,
) => SortedPlaylistStateLoading($type: json['runtimeType'] as String?);

Map<String, dynamic> _$SortedPlaylistStateLoadingToJson(
  SortedPlaylistStateLoading instance,
) => <String, dynamic>{'runtimeType': instance.$type};

SortedPlaylistStateError _$SortedPlaylistStateErrorFromJson(
  Map<String, dynamic> json,
) => SortedPlaylistStateError($type: json['runtimeType'] as String?);

Map<String, dynamic> _$SortedPlaylistStateErrorToJson(
  SortedPlaylistStateError instance,
) => <String, dynamic>{'runtimeType': instance.$type};
