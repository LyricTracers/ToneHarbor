import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
sealed class AudioStationCookies with _$AudioStationCookies {
  const AudioStationCookies._();

  const factory AudioStationCookies({
    required String did,
    @JsonKey(name: 'did_expires') required int didExpires,
    required String id,
    @JsonKey(name: 'id_expires') required int idExpires,
  }) = _AudioStationCookies;

  factory AudioStationCookies.fromJson(Map<String, dynamic> json) =>
      _$AudioStationCookiesFromJson(json);

  bool get isValid =>
      did.isNotEmpty &&
      id.isNotEmpty &&
      DateTime.now().millisecondsSinceEpoch < didExpires &&
      DateTime.now().millisecondsSinceEpoch < idExpires;
}

@freezed
sealed class Account with _$Account {
  const factory Account({required String account, required String passwd}) =
      _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

@freezed
sealed class AuthRequest with _$AuthRequest {
  const factory AuthRequest({
    required String api,
    required String version,
    required String method,
    required String session,
    required String account,
    required String passwd,
    @JsonKey(name: 'otp_code') final String? otpCode,
    @JsonKey(name: 'enable_syno_token') final String? enableSynoToken,
    @JsonKey(name: 'ik_message') final String? ikMessage,
    String? tabid,
    String? logintype,
    @JsonKey(name: 'enable_device_token') final String? enableDeviceToken,
    String? timezone,
    String? rememberme,
    String? client,
    String? fid,
  }) = _AuthRequest;

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
}

@freezed
sealed class AuthData with _$AuthData {
  const factory AuthData({
    String? account,
    @JsonKey(name: 'device_id') final String? deviceId,
    @JsonKey(name: 'ik_message') final String? ikMessage,
    @JsonKey(name: 'is_portal_port') required bool isPortalPort,
    String? sid,
    required String synotoken,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
}

@freezed
sealed class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required bool success,
    AuthData? data,
    Map<String, dynamic>? error,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
sealed class LogoutRequest with _$LogoutRequest {
  const factory LogoutRequest({
    required String api,
    required String method,
    required String version,
  }) = _LogoutRequest;

  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);
}

@freezed
sealed class LogoutResponse with _$LogoutResponse {
  const factory LogoutResponse({required bool success}) = _LogoutResponse;

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);
}
