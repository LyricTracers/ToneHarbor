import 'dart:convert';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/auth.dart';
import 'package:toneharbor/providers/locale_provider.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/Excetions.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/consts.dart';
part 'auth_provider.g.dart';

String _getLoginErrorMessage(AppLocalizations l10n, int? errorCode) {
  switch (errorCode) {
    case 400:
      return l10n.error_syno_login_400;
    case 401:
      return l10n.error_syno_login_401;
    case 402:
      return l10n.error_syno_login_402;
    case 403:
      return l10n.error_syno_login_403;
    case 404:
      return l10n.error_syno_login_404;
    case 406:
      return l10n.error_syno_login_406;
    case 407:
      return l10n.error_syno_login_407;
    case 408:
      return l10n.error_syno_login_408;
    case 409:
      return l10n.error_syno_login_409;
    case 410:
      return l10n.error_syno_login_410;
    default:
      return l10n.error_login_failed;
  }
}

@keepAlive
class UseHttp extends _$UseHttp {
  @override
  Future<bool> build() async {
    return await getUseHttp();
  }

  Future<void> toggle() async {
    final useHttp = await getUseHttp();
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(useHttpKey, !useHttp);
    state = AsyncData(!useHttp);
  }
}

@keepAlive
class ServerUrl extends _$ServerUrl {
  @override
  Future<String> build() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(serverUrlKey) ?? '';
  }

  Future<void> setServerUrl(String serverUrl) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(serverUrlKey, serverUrl);
    state = AsyncData(serverUrl);
  }
}

@keepAlive
class AccountInfo extends _$AccountInfo {
  @override
  Future<Account?> build() async {
    final sp = await SharedPreferences.getInstance();
    final accountJson = sp.getString(accountKey);
    if (accountJson != null && accountJson.isNotEmpty) {
      return Account.fromJson(jsonDecode(accountJson));
    }
    return null;
  }

  Future<void> setAccount(Account account) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(accountKey, jsonEncode(account.toJson()));
    state = AsyncData(account);
  }
}

@keepAlive
class AudioStationCookiesInfo extends _$AudioStationCookiesInfo {
  @override
  Future<AudioStationCookies?> build() async {
    final sp = await SharedPreferences.getInstance();
    final cookies = sp.getString(cookieKey);
    if (cookies != null && cookies.isNotEmpty) {
      final cookie = AudioStationCookies.fromJson(jsonDecode(cookies));
      if (cookie.isValid) {
        return cookie;
      }
    }
    return null;
  }

  Future<void> setCookies(AudioStationCookies cookies) async {
    final sp = await SharedPreferences.getInstance();
    if (!cookies.isValid) {
      await sp.remove(cookieKey);
      ref.read(synoTokenProvider.notifier).clear();
      state = const AsyncData(null);
      return;
    } else {
      await sp.setString(cookieKey, jsonEncode(cookies.toJson()));
      state = AsyncData(cookies);
    }
  }
}

@keepAlive
class SynoToken extends _$SynoToken {
  @override
  String? build() {
    return null;
  }

  void setSynotoken(String synotoken) {
    state = synotoken;
  }

  void clear() {
    state = null;
  }
}

@riverpod
Future<String?> authToken(Ref ref) async {
  final synotoken = ref.read(synoTokenProvider);

  if (synotoken != null) {
    return synotoken;
  }

  final serverUrl = getValueWhenReadyWithRef(ref, serverUrlProvider, '');

  if (serverUrl.isEmpty) {
    logger.d('serverUrl 为空，返回 null');
    return null;
  }

  final cookiesInfo = getValueWhenReadyWithRef(
    ref,
    audioStationCookiesInfoProvider,
    null,
  );

  if (cookiesInfo != null && cookiesInfo.isValid) {
    logger.d('Cookie 有效，尝试获取 synotoken');
    try {
      final l10n = lookupAppLocalizations(
        getValueWhenReadyWithRef(ref, localeProvider, const Locale('zh')),
      );
      logger.d('开始刷新 token');
      final response = await _refreshToken(ref, serverUrl, cookiesInfo, l10n);
      logger.d('刷新 token 完成: ${response.data?.synotoken}');
      if (response.data?.synotoken != null) {
        ref
            .read(synoTokenProvider.notifier)
            .setSynotoken(response.data!.synotoken);
        return response.data!.synotoken;
      }
    } catch (e) {
      logger.w('获取 synotoken 失败: $e');
      ref
          .read(audioStationCookiesInfoProvider.notifier)
          .setCookies(
            AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
          );
      ref.read(synoTokenProvider.notifier).clear();
    }
  } else {
    logger.d('Cookie 无效，返回 null');
    ref.read(synoTokenProvider.notifier).clear();
  }

  return null;
}

@riverpod
Future<AuthResponse> login(Ref ref) async {
  ref.keepAlive();

  var l10n = lookupAppLocalizations(
    getValueWhenReadyWithRef(ref, localeProvider, const Locale('zh')),
  );
  final serverUrl = getValueWhenReadyWithRef(ref, serverUrlProvider, '');
  if (serverUrl.isEmpty) {
    throw AudioStationException(message: l10n.error_invalidUrl);
  }

  final accountInfo = getValueWhenReadyWithRef(ref, accountInfoProvider, null);
  if (accountInfo == null) {
    throw AudioStationException(message: l10n.error_account_info_invalid);
  }

  final cookiesInfo = getValueWhenReadyWithRef(
    ref,
    audioStationCookiesInfoProvider,
    null,
  );
  final hasValidCookies = cookiesInfo != null && cookiesInfo.isValid;

  if (hasValidCookies) {
    logger.d('Cookie 有效，尝试刷新 token');
    try {
      return await _refreshToken(ref, serverUrl, cookiesInfo, l10n);
    } catch (e) {
      logger.w('刷新 token 失败，尝试完整登录: $e');
    }
  }

  logger.d('进行完整登录');

  return await _fullLogin(ref, serverUrl, accountInfo, l10n);
}

Future<AuthResponse> _fullLogin(
  Ref ref,
  String serverUrl,
  Account account,
  AppLocalizations l10n,
) async {
  final useHttp = await getUseHttp();
  final scheme = useHttp ? 'https' : 'http';
  final baseUrl = '$scheme://$serverUrl';

  final request = AuthRequest(
    api: 'SYNO.API.Auth',
    version: '7',
    method: 'login',
    session: 'webui',
    account: account.account,
    passwd: account.passwd,
    otpCode: null,
    enableSynoToken: 'yes',
    ikMessage: null,
    tabid: null,
    logintype: 'local',
    enableDeviceToken: 'no',
    timezone: '+08:00',
    rememberme: '1',
    client: 'browser',
    fid: null,
  );

  final response = await httpClientWrapper.post(
    '$baseUrl/music/webapi/entry.cgi?api=SYNO.API.Auth',
    body: HttpBody.form(
      request.toJson().map(
        (key, value) => MapEntry(key, value?.toString() ?? ''),
      ),
    ),
    headers: HttpHeaders.rawMap({
      'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'x-requested-with': 'XMLHttpRequest',
      'accept': '*/*',
      'accept-language': 'zh-CN,zh;q=0.9',
      'origin': baseUrl,
      'referer': '$baseUrl/music/',
    }),
  );

  if (response.statusCode != 200) {
    ref
        .read(audioStationCookiesInfoProvider.notifier)
        .setCookies(
          AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
        );
    ref.read(synoTokenProvider.notifier).clear();
    throw AudioStationException(
      message: _getLoginErrorMessage(l10n, null),
      statusCode: response.statusCode,
    );
  }

  final jsonBody = jsonDecode(response.body);
  final result = AuthResponse.fromJson(jsonBody);
  logger.i("result:$result");
  if (!result.success) {
    ref
        .read(audioStationCookiesInfoProvider.notifier)
        .setCookies(
          AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
        );
    ref.read(synoTokenProvider.notifier).clear();
    final errorCode = result.error?['code'];
    throw AudioStationException(
      message: _getLoginErrorMessage(l10n, errorCode is int ? errorCode : null),
      statusCode: errorCode is int ? errorCode : null,
    );
  }
  String id = "";
  int idExpires = 0;
  String did = "";
  int didExpires = 0;
  final format = DateFormat("EEE, dd-MMM-yyyy HH:mm:ss zzz", "en_US");

  for (var v in response.headers) {
    var key = v.$1;
    var value = v.$2;

    if (key.toLowerCase() == 'set-cookie') {
      logger.i('收到Set-Cookie头: $value');
      var parts = value.split(';');
      if (parts.length > 2) {
        if (parts[0].startsWith("id=") && parts[1].startsWith("expires=")) {
          id = parts[0];
          idExpires = format
              .parse(parts[1].substring(8))
              .millisecondsSinceEpoch;
        } else if (parts[0].startsWith("did=") &&
            parts[1].startsWith("expires=")) {
          did = parts[0];
          didExpires = format
              .parse(parts[1].substring(8))
              .millisecondsSinceEpoch;
        }
      }
    }
  }
  ref
      .read(audioStationCookiesInfoProvider.notifier)
      .setCookies(
        AudioStationCookies(
          id: id,
          idExpires: idExpires,
          did: did,
          didExpires: didExpires,
        ),
      );

  if (result.data?.synotoken != null) {
    ref.read(synoTokenProvider.notifier).setSynotoken(result.data!.synotoken);
  }

  return result;
}

Future<AuthResponse> _refreshToken(
  Ref ref,
  String serverUrl,
  AudioStationCookies cookies,
  AppLocalizations l10n,
) async {
  final useHttp = await getUseHttp();
  final scheme = useHttp ? 'https' : 'http';
  final baseUrl = '$scheme://$serverUrl';

  final cookieString = '${cookies.did}; ${cookies.id}';

  final response = await httpClientWrapper.post(
    '$baseUrl/music/webapi/entry.cgi?api=SYNO.API.Auth',
    body: HttpBody.form({
      'method': 'token',
      'version': '6',
      'updateSynoToken': 'true',
    }),
    headers: HttpHeaders.rawMap({
      'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'x-requested-with': 'XMLHttpRequest',
      'accept': '*/*',
      'accept-language': 'zh-CN,zh;q=0.9',
      'origin': baseUrl,
      'referer': '$baseUrl/music/',
      'Cookie': cookieString,
    }),
  );

  if (response.statusCode != 200) {
    ref
        .read(audioStationCookiesInfoProvider.notifier)
        .setCookies(
          AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
        );
    ref.read(synoTokenProvider.notifier).clear();
    throw AudioStationException(
      message: _getLoginErrorMessage(l10n, null),
      statusCode: response.statusCode,
    );
  }

  final jsonBody = jsonDecode(response.body);
  final result = AuthResponse.fromJson(jsonBody);

  if (!result.success) {
    ref
        .read(audioStationCookiesInfoProvider.notifier)
        .setCookies(
          AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
        );
    ref.read(synoTokenProvider.notifier).clear();
    final errorCode = result.error?['code'];
    throw AudioStationException(
      message: _getLoginErrorMessage(l10n, errorCode is int ? errorCode : null),
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  if (result.data?.synotoken != null) {
    ref.read(synoTokenProvider.notifier).setSynotoken(result.data!.synotoken);
  }

  return result;
}
