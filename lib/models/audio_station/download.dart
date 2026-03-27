import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toneharbor/l10n/app_localizations.dart';

part 'download.freezed.dart';
part 'download.g.dart';

enum AudioQuality {
  low,
  medium,
  high,
  original;

  String localizedLabel(AppLocalizations l10n) {
    switch (this) {
      case AudioQuality.low:
        return l10n.quality_low;
      case AudioQuality.medium:
        return l10n.quality_medium;
      case AudioQuality.high:
        return l10n.quality_high;
      case AudioQuality.original:
        return l10n.quality_original;
    }
  }

  String? get format => this == original ? null : 'mp3';
  int? get bitrate => switch (this) {
    low => 128000,
    medium => 192000,
    high => 320000,
    original => null,
  };
  bool get isTranscode => this != original;
  bool get isStream => this == original;
  String get method => this == original ? 'stream' : 'transcode';
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
