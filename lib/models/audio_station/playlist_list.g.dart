// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaylistInfo _$PlaylistInfoFromJson(Map<String, dynamic> json) =>
    _PlaylistInfo(
      id: json['id'] as String,
      library: json['library'] as String,
      name: json['name'] as String,
      sharingStatus: json['sharing_status'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$PlaylistInfoToJson(_PlaylistInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'library': instance.library,
      'name': instance.name,
      'sharing_status': instance.sharingStatus,
      'type': instance.type,
    };

_PlaylistSharingInfo _$PlaylistSharingInfoFromJson(Map<String, dynamic> json) =>
    _PlaylistSharingInfo(
      dateAvailable: json['date_available'] as String,
      dateExpired: json['date_expired'] as String,
      id: json['id'] as String,
      status: json['status'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PlaylistSharingInfoToJson(
  _PlaylistSharingInfo instance,
) => <String, dynamic>{
  'date_available': instance.dateAvailable,
  'date_expired': instance.dateExpired,
  'id': instance.id,
  'status': instance.status,
  'url': instance.url,
};

_PlaylistDetailAdditional _$PlaylistDetailAdditionalFromJson(
  Map<String, dynamic> json,
) => _PlaylistDetailAdditional(
  sharingInfo: json['sharing_info'] == null
      ? null
      : PlaylistSharingInfo.fromJson(
          json['sharing_info'] as Map<String, dynamic>,
        ),
  songs: (json['songs'] as List<dynamic>?)
      ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
      .toList(),
  songsOffset: (json['songs_offset'] as num).toInt(),
  songsTotal: (json['songs_total'] as num).toInt(),
);

Map<String, dynamic> _$PlaylistDetailAdditionalToJson(
  _PlaylistDetailAdditional instance,
) => <String, dynamic>{
  'sharing_info': instance.sharingInfo,
  'songs': instance.songs,
  'songs_offset': instance.songsOffset,
  'songs_total': instance.songsTotal,
};

_PlaylistDetailInfo _$PlaylistDetailInfoFromJson(Map<String, dynamic> json) =>
    _PlaylistDetailInfo(
      id: json['id'] as String,
      library: json['library'] as String,
      name: json['name'] as String,
      sharingStatus: json['sharing_status'] as String,
      type: json['type'] as String,
      additional: json['additional'] == null
          ? null
          : PlaylistDetailAdditional.fromJson(
              json['additional'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PlaylistDetailInfoToJson(_PlaylistDetailInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'library': instance.library,
      'name': instance.name,
      'sharing_status': instance.sharingStatus,
      'type': instance.type,
      'additional': instance.additional,
    };

_PlaylistDetailData _$PlaylistDetailDataFromJson(Map<String, dynamic> json) =>
    _PlaylistDetailData(
      playlists: (json['playlists'] as List<dynamic>?)
          ?.map((e) => PlaylistDetailInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaylistDetailDataToJson(_PlaylistDetailData instance) =>
    <String, dynamic>{'playlists': instance.playlists};

_PlaylistDetailResponse _$PlaylistDetailResponseFromJson(
  Map<String, dynamic> json,
) => _PlaylistDetailResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : PlaylistDetailData.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$PlaylistDetailResponseToJson(
  _PlaylistDetailResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
};

_PlaylistDetailRequest _$PlaylistDetailRequestFromJson(
  Map<String, dynamic> json,
) => _PlaylistDetailRequest(
  api: json['api'] as String,
  method: json['method'] as String,
  id: json['id'] as String,
  library: json['library'] as String,
  additional: json['additional'] as String,
  version: (json['version'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  sortBy: json['sort_by'] as String,
  sortDirection: json['sort_direction'] as String,
);

Map<String, dynamic> _$PlaylistDetailRequestToJson(
  _PlaylistDetailRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'id': instance.id,
  'library': instance.library,
  'additional': instance.additional,
  'version': instance.version,
  'limit': instance.limit,
  'offset': instance.offset,
  'sort_by': instance.sortBy,
  'sort_direction': instance.sortDirection,
};

_PlaylistListRequest _$PlaylistListRequestFromJson(Map<String, dynamic> json) =>
    _PlaylistListRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      limit: (json['limit'] as num).toInt(),
      library: json['library'] as String,
      offset: (json['offset'] as num).toInt(),
      sortBy: json['sortBy'] as String,
      sortDirection: json['sortDirection'] as String,
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$PlaylistListRequestToJson(
  _PlaylistListRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'limit': instance.limit,
  'library': instance.library,
  'offset': instance.offset,
  'sortBy': instance.sortBy,
  'sortDirection': instance.sortDirection,
  'version': instance.version,
};

_PlaylistListData _$PlaylistListDataFromJson(Map<String, dynamic> json) =>
    _PlaylistListData(
      offset: (json['offset'] as num).toInt(),
      playlists: (json['playlists'] as List<dynamic>?)
          ?.map((e) => PlaylistInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PlaylistListDataToJson(_PlaylistListData instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'playlists': instance.playlists,
      'total': instance.total,
    };

_PlaylistListResponse _$PlaylistListResponseFromJson(
  Map<String, dynamic> json,
) => _PlaylistListResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : PlaylistListData.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$PlaylistListResponseToJson(
  _PlaylistListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
};

_CreatePlaylistRequest _$CreatePlaylistRequestFromJson(
  Map<String, dynamic> json,
) => _CreatePlaylistRequest(
  api: json['api'] as String,
  method: json['method'] as String,
  name: json['name'] as String,
  library: json['library'] as String,
  version: (json['version'] as num).toInt(),
);

Map<String, dynamic> _$CreatePlaylistRequestToJson(
  _CreatePlaylistRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'name': instance.name,
  'library': instance.library,
  'version': instance.version,
};

_CreatePlaylistData _$CreatePlaylistDataFromJson(Map<String, dynamic> json) =>
    _CreatePlaylistData(id: json['id'] as String);

Map<String, dynamic> _$CreatePlaylistDataToJson(_CreatePlaylistData instance) =>
    <String, dynamic>{'id': instance.id};

_CreatePlaylistResponse _$CreatePlaylistResponseFromJson(
  Map<String, dynamic> json,
) => _CreatePlaylistResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : CreatePlaylistData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreatePlaylistResponseToJson(
  _CreatePlaylistResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

_RenamePlaylistRequest _$RenamePlaylistRequestFromJson(
  Map<String, dynamic> json,
) => _RenamePlaylistRequest(
  api: json['api'] as String,
  method: json['method'] as String,
  id: json['id'] as String,
  newName: json['new_name'] as String,
  version: (json['version'] as num).toInt(),
);

Map<String, dynamic> _$RenamePlaylistRequestToJson(
  _RenamePlaylistRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'id': instance.id,
  'new_name': instance.newName,
  'version': instance.version,
};

_RenamePlaylistData _$RenamePlaylistDataFromJson(Map<String, dynamic> json) =>
    _RenamePlaylistData(id: json['id'] as String);

Map<String, dynamic> _$RenamePlaylistDataToJson(_RenamePlaylistData instance) =>
    <String, dynamic>{'id': instance.id};

_RenamePlaylistResponse _$RenamePlaylistResponseFromJson(
  Map<String, dynamic> json,
) => _RenamePlaylistResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : RenamePlaylistData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RenamePlaylistResponseToJson(
  _RenamePlaylistResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

_DeletePlaylistRequest _$DeletePlaylistRequestFromJson(
  Map<String, dynamic> json,
) => _DeletePlaylistRequest(
  api: json['api'] as String,
  method: json['method'] as String,
  id: json['id'] as String,
  version: (json['version'] as num).toInt(),
);

Map<String, dynamic> _$DeletePlaylistRequestToJson(
  _DeletePlaylistRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'id': instance.id,
  'version': instance.version,
};

_DeletePlaylistData _$DeletePlaylistDataFromJson(Map<String, dynamic> json) =>
    _DeletePlaylistData(errors: json['errors'] as List<dynamic>?);

Map<String, dynamic> _$DeletePlaylistDataToJson(_DeletePlaylistData instance) =>
    <String, dynamic>{'errors': instance.errors};

_DeletePlaylistResponse _$DeletePlaylistResponseFromJson(
  Map<String, dynamic> json,
) => _DeletePlaylistResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : DeletePlaylistData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeletePlaylistResponseToJson(
  _DeletePlaylistResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

_AddPlaylistSongsRequest _$AddPlaylistSongsRequestFromJson(
  Map<String, dynamic> json,
) => _AddPlaylistSongsRequest(
  api: json['api'] as String,
  method: json['method'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  id: json['id'] as String,
  songs: json['songs'] as String,
  version: (json['version'] as num).toInt(),
  skipDuplicate: json['skip_duplicate'] as bool?,
);

Map<String, dynamic> _$AddPlaylistSongsRequestToJson(
  _AddPlaylistSongsRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'offset': instance.offset,
  'limit': instance.limit,
  'id': instance.id,
  'songs': instance.songs,
  'version': instance.version,
  'skip_duplicate': instance.skipDuplicate,
};

_AddPlaylistSongsResponse _$AddPlaylistSongsResponseFromJson(
  Map<String, dynamic> json,
) => _AddPlaylistSongsResponse(success: json['success'] as bool);

Map<String, dynamic> _$AddPlaylistSongsResponseToJson(
  _AddPlaylistSongsResponse instance,
) => <String, dynamic>{'success': instance.success};

_RemoveMissingSongsRequest _$RemoveMissingSongsRequestFromJson(
  Map<String, dynamic> json,
) => _RemoveMissingSongsRequest(
  api: json['api'] as String,
  method: json['method'] as String,
  id: json['id'] as String,
  version: (json['version'] as num).toInt(),
);

Map<String, dynamic> _$RemoveMissingSongsRequestToJson(
  _RemoveMissingSongsRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'id': instance.id,
  'version': instance.version,
};

_RemoveMissingSongsResponse _$RemoveMissingSongsResponseFromJson(
  Map<String, dynamic> json,
) => _RemoveMissingSongsResponse(success: json['success'] as bool);

Map<String, dynamic> _$RemoveMissingSongsResponseToJson(
  _RemoveMissingSongsResponse instance,
) => <String, dynamic>{'success': instance.success};
