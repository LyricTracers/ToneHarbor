// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvgRating _$AvgRatingFromJson(Map<String, dynamic> json) =>
    _AvgRating(rating: (json['rating'] as num?)?.toInt());

Map<String, dynamic> _$AvgRatingToJson(_AvgRating instance) =>
    <String, dynamic>{'rating': instance.rating};

_Additional _$AdditionalFromJson(Map<String, dynamic> json) => _Additional(
  avgRating: json['avgRating'] == null
      ? null
      : AvgRating.fromJson(json['avgRating'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdditionalToJson(_Additional instance) =>
    <String, dynamic>{'avgRating': instance.avgRating};

_Artist _$ArtistFromJson(Map<String, dynamic> json) => _Artist(
  name: json['name'] as String?,
  additional: json['additional'] == null
      ? null
      : Additional.fromJson(json['additional'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ArtistToJson(_Artist instance) => <String, dynamic>{
  'name': instance.name,
  'additional': instance.additional,
};

_ArtistRequest _$ArtistRequestFromJson(Map<String, dynamic> json) =>
    _ArtistRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      limit: (json['limit'] as num).toInt(),
      library: json['library'] as String,
      additional: json['additional'] as String,
      sortBy: json['sort_by'] as String,
      sortDirection: json['sort_direction'] as String,
      offset: (json['offset'] as num).toInt(),
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$ArtistRequestToJson(_ArtistRequest instance) =>
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
    };

_ArtistData _$ArtistDataFromJson(Map<String, dynamic> json) => _ArtistData(
  artists: (json['artists'] as List<dynamic>?)
      ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
      .toList(),
  offset: (json['offset'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$ArtistDataToJson(_ArtistData instance) =>
    <String, dynamic>{
      'artists': instance.artists,
      'offset': instance.offset,
      'total': instance.total,
    };

_ArtistResponse _$ArtistResponseFromJson(Map<String, dynamic> json) =>
    _ArtistResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : ArtistData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ArtistResponseToJson(_ArtistResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };
