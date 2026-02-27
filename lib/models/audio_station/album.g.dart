// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvgRating _$AvgRatingFromJson(Map<String, dynamic> json) =>
    _AvgRating(rating: (json['rating'] as num?)?.toInt());

Map<String, dynamic> _$AvgRatingToJson(_AvgRating instance) =>
    <String, dynamic>{'rating': instance.rating};

_AlbumAdditional _$AlbumAdditionalFromJson(Map<String, dynamic> json) =>
    _AlbumAdditional(
      avgRating: json['avg_rating'] == null
          ? null
          : AvgRating.fromJson(json['avg_rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlbumAdditionalToJson(_AlbumAdditional instance) =>
    <String, dynamic>{'avg_rating': instance.avgRating};

_AlbumItem _$AlbumItemFromJson(Map<String, dynamic> json) => _AlbumItem(
  additional: json['additional'] == null
      ? null
      : AlbumAdditional.fromJson(json['additional'] as Map<String, dynamic>),
  albumArtist: json['album_artist'] as String?,
  artist: json['artist'] as String?,
  displayArtist: json['display_artist'] as String?,
  name: json['name'] as String?,
  year: (json['year'] as num?)?.toInt(),
);

Map<String, dynamic> _$AlbumItemToJson(_AlbumItem instance) =>
    <String, dynamic>{
      'additional': instance.additional,
      'album_artist': instance.albumArtist,
      'artist': instance.artist,
      'display_artist': instance.displayArtist,
      'name': instance.name,
      'year': instance.year,
    };

_AlbumRequest _$AlbumRequestFromJson(Map<String, dynamic> json) =>
    _AlbumRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      limit: (json['limit'] as num).toInt(),
      library: json['library'] as String,
      additional: json['additional'] as String,
      sortBy: json['sort_by'] as String,
      sortDirection: json['sort_direction'] as String,
      offset: (json['offset'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      artist: json['artist'] as String?,
    );

Map<String, dynamic> _$AlbumRequestToJson(_AlbumRequest instance) =>
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
      'artist': instance.artist,
    };

_SearchAlbumRequest _$SearchAlbumRequestFromJson(Map<String, dynamic> json) =>
    _SearchAlbumRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      version: (json['version'] as num).toInt(),
      filter: json['filter'] as String,
      library: json['library'] as String,
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      sortBy: json['sort_by'] as String,
      sortDirection: json['sort_direction'] as String,
    );

Map<String, dynamic> _$SearchAlbumRequestToJson(_SearchAlbumRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'method': instance.method,
      'version': instance.version,
      'filter': instance.filter,
      'library': instance.library,
      'limit': instance.limit,
      'offset': instance.offset,
      'sort_by': instance.sortBy,
      'sort_direction': instance.sortDirection,
    };

_AlbumData _$AlbumDataFromJson(Map<String, dynamic> json) => _AlbumData(
  albums: (json['albums'] as List<dynamic>?)
      ?.map((e) => AlbumItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  offset: (json['offset'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$AlbumDataToJson(_AlbumData instance) =>
    <String, dynamic>{
      'albums': instance.albums,
      'offset': instance.offset,
      'total': instance.total,
    };

_AlbumResponse _$AlbumResponseFromJson(Map<String, dynamic> json) =>
    _AlbumResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : AlbumData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AlbumResponseToJson(_AlbumResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };
