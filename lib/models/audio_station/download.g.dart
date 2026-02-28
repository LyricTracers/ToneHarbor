// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchDownloadRequest _$BatchDownloadRequestFromJson(
  Map<String, dynamic> json,
) => _BatchDownloadRequest(
  api: json['api'] as String,
  method: json['method'] as String,
  version: json['version'] as String,
  songs: json['songs'] as String,
  library: json['library'] as String,
  filename: json['filename'] as String,
);

Map<String, dynamic> _$BatchDownloadRequestToJson(
  _BatchDownloadRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'version': instance.version,
  'songs': instance.songs,
  'library': instance.library,
  'filename': instance.filename,
};
