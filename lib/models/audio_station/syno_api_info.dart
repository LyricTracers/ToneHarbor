import 'package:freezed_annotation/freezed_annotation.dart';
part 'syno_api_info.freezed.dart';
part 'syno_api_info.g.dart';

@freezed
sealed class SynoAPIInfo with _$SynoAPIInfo {
  const SynoAPIInfo._();
  const factory SynoAPIInfo({
    required int maxVersion,
    required int minVersion,
    required String path,
    String? requestFormat,
  }) = _SynoAPIInfo;
  factory SynoAPIInfo.fromJson(Map<String, dynamic> json) =>
      _$SynoAPIInfoFromJson(json);
}

@freezed
sealed class SynoAPIInfoResponse with _$SynoAPIInfoResponse {
  const SynoAPIInfoResponse._();
  const factory SynoAPIInfoResponse({
    required bool success,
    Map<String, SynoAPIInfo>? data,
  }) = _SynoAPIInfoResponse;
  factory SynoAPIInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$SynoAPIInfoResponseFromJson(json);
}

@freezed
sealed class AmeStatus with _$AmeStatus {
  const AmeStatus._();
  const factory AmeStatus({
    @JsonKey(name: 'ame_major_version') required int ameMajorVersion,
    @JsonKey(name: 'has_aac') required bool hasAac,
    @JsonKey(name: 'has_license') required bool hasLicense,
    @JsonKey(name: 'is_aac_activated') required bool isAacActivated,
    @JsonKey(name: 'is_ame_broken') required bool isAmeBroken,
    @JsonKey(name: 'is_ame_install') required bool isAmeInstall,
    @JsonKey(name: 'need_aac_transcoding') required bool needAacTranscoding,
  }) = _AmeStatus;
  factory AmeStatus.fromJson(Map<String, dynamic> json) =>
      _$AmeStatusFromJson(json);
}

@freezed
sealed class Privilege with _$Privilege {
  const Privilege._();
  const factory Privilege({
    @JsonKey(name: 'playlist_edit') required bool playlistEdit,
    @JsonKey(name: 'remote_player') required bool remotePlayer,
    required bool sharing,
    @JsonKey(name: 'tag_edit') required bool tagEdit,
    @JsonKey(name: 'upnp_browse') required bool upnpBrowse,
  }) = _Privilege;
  factory Privilege.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeFromJson(json);
}

@freezed
sealed class Settings with _$Settings {
  const Settings._();
  const factory Settings({
    @JsonKey(name: 'audio_show_virtual_library')
    required bool audioShowVirtualLibrary,
    @JsonKey(name: 'disable_upnp') required bool disableUpnp,
    @JsonKey(name: 'enable_download') required bool enableDownload,
    @JsonKey(name: 'prefer_using_html5') required bool preferUsingHtml5,
    @JsonKey(name: 'transcode_to_mp3') required bool transcodeToMp3,
  }) = _Settings;
  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

@freezed
sealed class AudioStationInfoData with _$AudioStationInfoData {
  const AudioStationInfoData._();
  const factory AudioStationInfoData({
    @JsonKey(name: 'ame_status') required AmeStatus ameStatus,
    @JsonKey(name: 'browse_personal_library')
    required String browsePersonalLibrary,
    @JsonKey(name: 'dsd_decode_capability') required bool dsdDecodeCapability,
    @JsonKey(name: 'enable_equalizer') required bool enableEqualizer,
    @JsonKey(name: 'enable_personal_library')
    required bool enablePersonalLibrary,
    @JsonKey(name: 'enable_user_home') required bool enableUserHome,
    @JsonKey(name: 'has_music_share') required bool hasMusicShare,
    @JsonKey(name: 'is_manager') required bool isManager,
    @JsonKey(name: 'playing_queue_max') required int playingQueueMax,
    required Privilege privilege,
    @JsonKey(name: 'remote_controller') required bool remoteController,
    @JsonKey(name: 'same_subnet') required bool sameSubnet,
    @JsonKey(name: 'serial_number') required String serialNumber,
    required Settings settings,
    @JsonKey(name: 'support_bluetooth') required bool supportBluetooth,
    @JsonKey(name: 'support_usb') required bool supportUsb,
    @JsonKey(name: 'support_virtual_library')
    required bool supportVirtualLibrary,
    @JsonKey(name: 'transcode_capability')
    required List<String> transcodeCapability,
    required int version,
    @JsonKey(name: 'version_string') required String versionString,
    required String sid,
  }) = _AudioStationInfoData;
  factory AudioStationInfoData.fromJson(Map<String, dynamic> json) =>
      _$AudioStationInfoDataFromJson(json);
}

@freezed
sealed class AudioStationInfoRequest with _$AudioStationInfoRequest {
  const AudioStationInfoRequest._();
  const factory AudioStationInfoRequest({
    required String api,
    required String method,
    required String version,
  }) = _AudioStationInfoRequest;
  factory AudioStationInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$AudioStationInfoRequestFromJson(json);
}

@freezed
sealed class AudioStationInfoResponse with _$AudioStationInfoResponse {
  const AudioStationInfoResponse._();
  const factory AudioStationInfoResponse({
    required bool success,
    AudioStationInfoData? data,
  }) = _AudioStationInfoResponse;
  factory AudioStationInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$AudioStationInfoResponseFromJson(json);
}

@freezed
sealed class DSMInfoData with _$DSMInfoData {
  const DSMInfoData._();
  const factory DSMInfoData({
    required String codepage,
    required String model,
    required int ram,
    required String serial,
    required int temperature,
    @JsonKey(name: 'temperature_warn') required bool temperatureWarn,
    required String time,
    required int uptime,
    required String version,
    @JsonKey(name: 'version_string') required String versionString,
  }) = _DSMInfoData;
  factory DSMInfoData.fromJson(Map<String, dynamic> json) =>
      _$DSMInfoDataFromJson(json);
}

@freezed
sealed class DSMInfoRequest with _$DSMInfoRequest {
  const DSMInfoRequest._();
  const factory DSMInfoRequest({
    required String api,
    required String method,
    required String version,
  }) = _DSMInfoRequest;
  factory DSMInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$DSMInfoRequestFromJson(json);
}

@freezed
sealed class DSMInfoResponse with _$DSMInfoResponse {
  const DSMInfoResponse._();
  const factory DSMInfoResponse({required bool success, DSMInfoData? data}) =
      _DSMInfoResponse;
  factory DSMInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$DSMInfoResponseFromJson(json);
}
