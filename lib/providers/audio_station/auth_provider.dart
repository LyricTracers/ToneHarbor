import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/auth.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/Excetions.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'auth_provider.g.dart';
part 'auth_provider.dependence.dart';

@keepAlive
class UseHttp extends _$UseHttp {
  @override
  bool build() {
    return SharedPreferencesUtils.getUseHttp();
  }

  Future<void> toggle() async {
    final useHttp = SharedPreferencesUtils.getUseHttp();
    state = !useHttp;
    await SharedPreferencesUtils.setUseHttp(!useHttp);
  }
}

@keepAlive
class ServerUrl extends _$ServerUrl {
  @override
  String build() {
    return SharedPreferencesUtils.getServerUrl();
  }

  Future<void> setServerUrl(String serverUrl) async {
    await SharedPreferencesUtils.setServerUrl(serverUrl);
    state = serverUrl;
  }
}

@keepAlive
class AccountInfo extends _$AccountInfo {
  @override
  Account? build() {
    final accountJson = SharedPreferencesUtils.getAccount();
    if (accountJson != null && accountJson.isNotEmpty) {
      return Account.fromJson(jsonDecode(accountJson));
    }
    return null;
  }

  Future<void> setAccount(Account account) async {
    await SharedPreferencesUtils.setAccount(jsonEncode(account.toJson()));
    state = account;
  }
}

@keepAlive
class AudioStationCookiesInfo extends _$AudioStationCookiesInfo {
  @override
  AudioStationCookies? build() {
    final cookies = SharedPreferencesUtils.getCookie();
    if (cookies != null && cookies.isNotEmpty) {
      final cookie = AudioStationCookies.fromJson(jsonDecode(cookies));
      if (cookie.isValid) {
        return cookie;
      }
    }
    return null;
  }

  Future<void> setCookies(AudioStationCookies cookies) async {
    if (!cookies.isValid) {
      await SharedPreferencesUtils.setCookie('');
      state = null;
      return;
    } else {
      await SharedPreferencesUtils.setCookie(jsonEncode(cookies.toJson()));
      state = cookies;
    }
  }

  bool get isValid => state?.isValid ?? false;

  Future<void> clearCookie() async {
    await SharedPreferencesUtils.setCookie('');
    state = null;
  }
}

@keepAlive
String baseUrl(Ref ref) {
  final serverUrl = ref.watch(serverUrlProvider);
  if (serverUrl.isEmpty) {
    throw AudioStationException(message: '服务器地址不能为空');
  }
  final useHttp = ref.watch(useHttpProvider);
  final scheme = useHttp ? 'https' : 'http';
  return '$scheme://$serverUrl';
}

@keepAlive
class AuthToken extends _$AuthToken {
  void setAuthToken(String authToken) {
    state = AsyncData(authToken);
  }

  @override
  Future<String?> build() async {
    return null;
    // final cookiesInfo = ref.watch(audioStationCookiesInfoProvider);

    // if (cookiesInfo != null && cookiesInfo.isValid) {
    //   logger.d('Cookie 有效，尝试获取 synotoken');
    //   try {
    //     final l10n = ref.read(l10nProvider);
    //     logger.d('开始刷新 token');
    //     final response = await _refreshToken(ref, cookiesInfo, l10n);
    //     logger.d('刷新 token 完成: ${response.data?.synotoken}');
    //     return response.data!.synotoken;
    //   } catch (e) {
    //     logger.w('获取 synotoken 失败: $e');
    //     await ref
    //         .read(audioStationCookiesInfoProvider.notifier)
    //         .setCookies(
    //           AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
    //         );
    //     return null;
    //   }
    // } else {
    //   return null;
    // }
  }
}

@keepAlive
Future<Map<String, String>?> authHeaders(Ref ref) async {
  // logger.d('获取 authHeaders');
  // final authToken = await ref.watch(authTokenProvider.future);
  // if (authToken == null) {
  // logger.w('authToken 为空，返回 null');
  // return null;
  // }

  final serverUrl = ref.watch(serverUrlProvider);
  if (serverUrl.isEmpty) {
    logger.w('serverUrl 为空，返回 null');
    return null;
  }

  final baseUrl = ref.watch(baseUrlProvider);

  final headers = <String, String>{
    'x-requested-with': 'XMLHttpRequest',
    'accept': '*/*',
    'accept-language': 'zh-CN,zh;q=0.9',
    'origin': baseUrl,
    'referer': '$baseUrl/music/',
  };

  final cookiesInfo = ref.watch(audioStationCookiesInfoProvider);

  if (cookiesInfo == null || !cookiesInfo.isValid) {
    logger.d('Cookie 无效，返回 null');
    return null;
  }

  final cookieString = "id=${cookiesInfo.id}; did=${cookiesInfo.did}";
  headers['Cookie'] = cookieString;
  logger.d('使用Cookie: $cookieString');

  // headers['x-syno-token'] = authToken;
  // logger.d('使用SynoToken: $authToken');

  return headers;
}

Future<AuthResponse> login(WidgetRef ref) async {
  var l10n = ref.read(l10nProvider);

  final accountInfo = ref.watch(accountInfoProvider);
  if (accountInfo == null) {
    throw AudioStationException(message: l10n.error_account_info_invalid);
  }

  final cookiesInfo = ref.watch(audioStationCookiesInfoProvider);
  final hasValidCookies = cookiesInfo != null && cookiesInfo.isValid;

  if (hasValidCookies) {
    logger.d('Cookie 有效，尝试刷新 token');
    try {
      // return await _refreshTokenWithWidgetRef(ref, cookiesInfo, l10n);
      return AuthResponse(success: true);
    } catch (e) {
      logger.w('刷新 token 失败，尝试完整登录: $e');
    }
  }

  logger.d('进行完整登录');

  return await _fullLogin(ref, accountInfo, l10n);
}

Future<LogoutResponse> logout(WidgetRef ref) async {
  final l10n = ref.read(l10nProvider);

  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
    });
    return LogoutResponse(success: false);
  }

  final baseUrl = ref.read(baseUrlProvider);

  final request = LogoutRequest(
    api: 'SYNO.API.Auth',
    method: 'logout',
    version: '6',
  );

  final response = await httpClientWrapper.get(
    '$baseUrl/webapi/entry.cgi',
    query: request.toJson().map(
      (key, value) => MapEntry(key, value?.toString() ?? ''),
    ),
    headers: HttpHeaders.rawMap({'accept': '*/*', ...authHeaders}),
  );

  if (response.statusCode != 200) {
    throw AudioStationException(
      message: l10n.error_login_failed,
      statusCode: response.statusCode,
    );
  }

  final jsonBody = parseJsonResponse(response.body);
  final result = LogoutResponse.fromJson(jsonBody);

  if (!result.success) {
    throw AudioStationException(message: l10n.error_login_failed);
  }

  await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
  // ref.invalidate(authTokenProvider);

  return result;
}
