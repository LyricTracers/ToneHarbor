// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_content_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubContentData _$SubContentDataFromJson(Map<String, dynamic> json) =>
    _SubContentData(
      type: $enumDecode(_$SubContentTypeEnumMap, json['type']),
      extra: json['extra'] as String?,
    );

Map<String, dynamic> _$SubContentDataToJson(_SubContentData instance) =>
    <String, dynamic>{
      'type': _$SubContentTypeEnumMap[instance.type]!,
      'extra': instance.extra,
    };

const _$SubContentTypeEnumMap = {
  SubContentType.none: 'none',
  SubContentType.playList: 'playList',
  SubContentType.songInfo: 'songInfo',
  SubContentType.addToPlayLists: 'addToPlayLists',
  SubContentType.updateLyrics: 'updateLyrics',
};
