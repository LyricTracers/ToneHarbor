// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syno_api_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SynoAPIInfo _$SynoAPIInfoFromJson(Map<String, dynamic> json) => _SynoAPIInfo(
  maxVersion: (json['maxVersion'] as num).toInt(),
  minVersion: (json['minVersion'] as num).toInt(),
  path: json['path'] as String,
  requestFormat: json['requestFormat'] as String?,
);

Map<String, dynamic> _$SynoAPIInfoToJson(_SynoAPIInfo instance) =>
    <String, dynamic>{
      'maxVersion': instance.maxVersion,
      'minVersion': instance.minVersion,
      'path': instance.path,
      'requestFormat': instance.requestFormat,
    };

_SynoAPIInfoResponse _$SynoAPIInfoResponseFromJson(Map<String, dynamic> json) =>
    _SynoAPIInfoResponse(
      success: json['success'] as bool,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, SynoAPIInfo.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$SynoAPIInfoResponseToJson(
  _SynoAPIInfoResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

_AmeStatus _$AmeStatusFromJson(Map<String, dynamic> json) => _AmeStatus(
  ameMajorVersion: (json['ame_major_version'] as num).toInt(),
  hasAac: json['has_aac'] as bool,
  hasLicense: json['has_license'] as bool,
  isAacActivated: json['is_aac_activated'] as bool,
  isAmeBroken: json['is_ame_broken'] as bool,
  isAmeInstall: json['is_ame_install'] as bool,
  needAacTranscoding: json['need_aac_transcoding'] as bool,
);

Map<String, dynamic> _$AmeStatusToJson(_AmeStatus instance) =>
    <String, dynamic>{
      'ame_major_version': instance.ameMajorVersion,
      'has_aac': instance.hasAac,
      'has_license': instance.hasLicense,
      'is_aac_activated': instance.isAacActivated,
      'is_ame_broken': instance.isAmeBroken,
      'is_ame_install': instance.isAmeInstall,
      'need_aac_transcoding': instance.needAacTranscoding,
    };

_Privilege _$PrivilegeFromJson(Map<String, dynamic> json) => _Privilege(
  playlistEdit: json['playlist_edit'] as bool,
  remotePlayer: json['remote_player'] as bool,
  sharing: json['sharing'] as bool,
  tagEdit: json['tag_edit'] as bool,
  upnpBrowse: json['upnp_browse'] as bool,
);

Map<String, dynamic> _$PrivilegeToJson(_Privilege instance) =>
    <String, dynamic>{
      'playlist_edit': instance.playlistEdit,
      'remote_player': instance.remotePlayer,
      'sharing': instance.sharing,
      'tag_edit': instance.tagEdit,
      'upnp_browse': instance.upnpBrowse,
    };

_Settings _$SettingsFromJson(Map<String, dynamic> json) => _Settings(
  audioShowVirtualLibrary: json['audio_show_virtual_library'] as bool,
  disableUpnp: json['disable_upnp'] as bool,
  enableDownload: json['enable_download'] as bool,
  preferUsingHtml5: json['prefer_using_html5'] as bool,
  transcodeToMp3: json['transcode_to_mp3'] as bool,
);

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
  'audio_show_virtual_library': instance.audioShowVirtualLibrary,
  'disable_upnp': instance.disableUpnp,
  'enable_download': instance.enableDownload,
  'prefer_using_html5': instance.preferUsingHtml5,
  'transcode_to_mp3': instance.transcodeToMp3,
};

_AudioStationInfoData _$AudioStationInfoDataFromJson(
  Map<String, dynamic> json,
) => _AudioStationInfoData(
  ameStatus: AmeStatus.fromJson(json['ame_status'] as Map<String, dynamic>),
  browsePersonalLibrary: json['browse_personal_library'] as String,
  dsdDecodeCapability: json['dsd_decode_capability'] as bool,
  enableEqualizer: json['enable_equalizer'] as bool,
  enablePersonalLibrary: json['enable_personal_library'] as bool,
  enableUserHome: json['enable_user_home'] as bool,
  hasMusicShare: json['has_music_share'] as bool,
  isManager: json['is_manager'] as bool,
  playingQueueMax: (json['playing_queue_max'] as num).toInt(),
  privilege: Privilege.fromJson(json['privilege'] as Map<String, dynamic>),
  remoteController: json['remote_controller'] as bool,
  sameSubnet: json['same_subnet'] as bool,
  serialNumber: json['serial_number'] as String,
  settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
  supportBluetooth: json['support_bluetooth'] as bool,
  supportUsb: json['support_usb'] as bool,
  supportVirtualLibrary: json['support_virtual_library'] as bool,
  transcodeCapability: (json['transcode_capability'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  version: (json['version'] as num).toInt(),
  versionString: json['version_string'] as String,
  sid: json['sid'] as String,
);

Map<String, dynamic> _$AudioStationInfoDataToJson(
  _AudioStationInfoData instance,
) => <String, dynamic>{
  'ame_status': instance.ameStatus,
  'browse_personal_library': instance.browsePersonalLibrary,
  'dsd_decode_capability': instance.dsdDecodeCapability,
  'enable_equalizer': instance.enableEqualizer,
  'enable_personal_library': instance.enablePersonalLibrary,
  'enable_user_home': instance.enableUserHome,
  'has_music_share': instance.hasMusicShare,
  'is_manager': instance.isManager,
  'playing_queue_max': instance.playingQueueMax,
  'privilege': instance.privilege,
  'remote_controller': instance.remoteController,
  'same_subnet': instance.sameSubnet,
  'serial_number': instance.serialNumber,
  'settings': instance.settings,
  'support_bluetooth': instance.supportBluetooth,
  'support_usb': instance.supportUsb,
  'support_virtual_library': instance.supportVirtualLibrary,
  'transcode_capability': instance.transcodeCapability,
  'version': instance.version,
  'version_string': instance.versionString,
  'sid': instance.sid,
};

_AudioStationInfoRequest _$AudioStationInfoRequestFromJson(
  Map<String, dynamic> json,
) => _AudioStationInfoRequest(
  api: json['api'] as String,
  method: json['method'] as String,
  version: json['version'] as String,
);

Map<String, dynamic> _$AudioStationInfoRequestToJson(
  _AudioStationInfoRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'version': instance.version,
};

_AudioStationInfoResponse _$AudioStationInfoResponseFromJson(
  Map<String, dynamic> json,
) => _AudioStationInfoResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : AudioStationInfoData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AudioStationInfoResponseToJson(
  _AudioStationInfoResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

_DSMInfoData _$DSMInfoDataFromJson(Map<String, dynamic> json) => _DSMInfoData(
  codepage: json['codepage'] as String,
  model: json['model'] as String,
  ram: (json['ram'] as num).toInt(),
  serial: json['serial'] as String,
  temperature: (json['temperature'] as num).toInt(),
  temperatureWarn: json['temperature_warn'] as bool,
  time: json['time'] as String,
  uptime: (json['uptime'] as num).toInt(),
  version: json['version'] as String,
  versionString: json['version_string'] as String,
);

Map<String, dynamic> _$DSMInfoDataToJson(_DSMInfoData instance) =>
    <String, dynamic>{
      'codepage': instance.codepage,
      'model': instance.model,
      'ram': instance.ram,
      'serial': instance.serial,
      'temperature': instance.temperature,
      'temperature_warn': instance.temperatureWarn,
      'time': instance.time,
      'uptime': instance.uptime,
      'version': instance.version,
      'version_string': instance.versionString,
    };

_DSMInfoRequest _$DSMInfoRequestFromJson(Map<String, dynamic> json) =>
    _DSMInfoRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$DSMInfoRequestToJson(_DSMInfoRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'method': instance.method,
      'version': instance.version,
    };

_DSMInfoResponse _$DSMInfoResponseFromJson(Map<String, dynamic> json) =>
    _DSMInfoResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : DSMInfoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DSMInfoResponseToJson(_DSMInfoResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
