// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioStationCookies _$AudioStationCookiesFromJson(Map<String, dynamic> json) =>
    _AudioStationCookies(
      did: json['did'] as String,
      didExpires: (json['did_expires'] as num).toInt(),
      id: json['id'] as String,
      idExpires: (json['id_expires'] as num).toInt(),
    );

Map<String, dynamic> _$AudioStationCookiesToJson(
  _AudioStationCookies instance,
) => <String, dynamic>{
  'did': instance.did,
  'did_expires': instance.didExpires,
  'id': instance.id,
  'id_expires': instance.idExpires,
};

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
  account: json['account'] as String,
  passwd: json['passwd'] as String,
);

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'account': instance.account,
  'passwd': instance.passwd,
};

_AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) => _AuthRequest(
  api: json['api'] as String,
  version: json['version'] as String,
  method: json['method'] as String,
  session: json['session'] as String,
  account: json['account'] as String,
  passwd: json['passwd'] as String,
  otpCode: json['otp_code'] as String?,
  enableSynoToken: json['enable_syno_token'] as String?,
  ikMessage: json['ik_message'] as String?,
  tabid: json['tabid'] as String?,
  logintype: json['logintype'] as String?,
  enableDeviceToken: json['enable_device_token'] as String?,
  timezone: json['timezone'] as String?,
  rememberme: json['rememberme'] as String?,
  client: json['client'] as String?,
  fid: json['fid'] as String?,
);

Map<String, dynamic> _$AuthRequestToJson(_AuthRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'version': instance.version,
      'method': instance.method,
      'session': instance.session,
      'account': instance.account,
      'passwd': instance.passwd,
      'otp_code': instance.otpCode,
      'enable_syno_token': instance.enableSynoToken,
      'ik_message': instance.ikMessage,
      'tabid': instance.tabid,
      'logintype': instance.logintype,
      'enable_device_token': instance.enableDeviceToken,
      'timezone': instance.timezone,
      'rememberme': instance.rememberme,
      'client': instance.client,
      'fid': instance.fid,
    };

_AuthData _$AuthDataFromJson(Map<String, dynamic> json) => _AuthData(
  account: json['account'] as String?,
  deviceId: json['device_id'] as String?,
  ikMessage: json['ik_message'] as String?,
  isPortalPort: json['is_portal_port'] as bool,
  sid: json['sid'] as String?,
  synotoken: json['synotoken'] as String,
);

Map<String, dynamic> _$AuthDataToJson(_AuthData instance) => <String, dynamic>{
  'account': instance.account,
  'device_id': instance.deviceId,
  'ik_message': instance.ikMessage,
  'is_portal_port': instance.isPortalPort,
  'sid': instance.sid,
  'synotoken': instance.synotoken,
};

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : AuthData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

_LogoutRequest _$LogoutRequestFromJson(Map<String, dynamic> json) =>
    _LogoutRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$LogoutRequestToJson(_LogoutRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'method': instance.method,
      'version': instance.version,
    };

_LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    _LogoutResponse(success: json['success'] as bool);

Map<String, dynamic> _$LogoutResponseToJson(_LogoutResponse instance) =>
    <String, dynamic>{'success': instance.success};
