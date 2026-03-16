// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FolderRequest _$FolderRequestFromJson(Map<String, dynamic> json) =>
    _FolderRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      limit: (json['limit'] as num).toInt(),
      library: json['library'] as String,
      additional: json['additional'] as String,
      sortBy: json['sort_by'] as String,
      sortDirection: json['sort_direction'] as String,
      offset: (json['offset'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FolderRequestToJson(_FolderRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'method': instance.method,
      'limit': instance.limit,
      'library': instance.library,
      'additional': instance.additional,
      'sort_by': instance.sortBy,
      'sort_direction': instance.sortDirection,
      'offset': instance.offset,
      'version': instance.version,
      'id': instance.id,
    };

_FolderItem _$FolderItemFromJson(Map<String, dynamic> json) => _FolderItem(
  id: json['id'] as String,
  isPersonal: json['is_personal'] as bool?,
  path: json['path'] as String,
  title: json['title'] as String,
  type: json['type'] as String,
  additional: json['additional'] == null
      ? null
      : SongAdditional.fromJson(json['additional'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FolderItemToJson(_FolderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_personal': instance.isPersonal,
      'path': instance.path,
      'title': instance.title,
      'type': instance.type,
      'additional': instance.additional,
    };

_FolderData _$FolderDataFromJson(Map<String, dynamic> json) => _FolderData(
  folderTotal: (json['folder_total'] as num).toInt(),
  id: json['id'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => FolderItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  offset: (json['offset'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$FolderDataToJson(_FolderData instance) =>
    <String, dynamic>{
      'folder_total': instance.folderTotal,
      'id': instance.id,
      'items': instance.items,
      'offset': instance.offset,
      'total': instance.total,
    };

_FolderResponse _$FolderResponseFromJson(Map<String, dynamic> json) =>
    _FolderResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : FolderData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FolderResponseToJson(_FolderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };
