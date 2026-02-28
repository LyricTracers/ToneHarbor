import 'package:freezed_annotation/freezed_annotation.dart';

part 'download.freezed.dart';
part 'download.g.dart';

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
