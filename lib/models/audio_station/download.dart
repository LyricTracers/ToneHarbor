import 'package:freezed_annotation/freezed_annotation.dart';

part 'download.freezed.dart';
part 'download.g.dart';

enum AudioQuality {
  low('低 (128kbps)', 'mp3', 128000, 'transcode'),
  medium('中 (192kbps)', 'mp3', 192000, 'transcode'),
  high('高 (320kbps)', 'mp3', 320000, 'transcode'),
  original('原始 (不转码)', null, null, 'stream');

  final String label;
  final String? format;
  final int? bitrate;
  final String method;

  const AudioQuality(this.label, this.format, this.bitrate, this.method);

  bool get isTranscode => method == 'transcode';
  bool get isStream => method == 'stream';
}

@freezed
sealed class BatchDownloadRequest with _$BatchDownloadRequest {
  const BatchDownloadRequest._();
  const factory BatchDownloadRequest({
    required String api,
    required String method,
    required String version,
    required String songs,
    required String library,
    required String filename,
  }) = _BatchDownloadRequest;
  factory BatchDownloadRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchDownloadRequestFromJson(json);
}
