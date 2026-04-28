import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lyricskit/lyricskit.dart';

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
String baseUrl(Ref ref, {bool ignoreLANIP = false}) {
  final remoteBaseUrl = SharedPreferencesUtils.getRemoteBaseUrl();
  if (remoteBaseUrl != null && remoteBaseUrl.isNotEmpty) {
    return remoteBaseUrl;
  }

  final serverUrl = ref.watch(serverUrlProvider);
  if (serverUrl.isEmpty) {
    final l10n = ref.read(l10nProvider);
    throw AudioStationException(message: l10n.error_server_url_empty);
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
Map<String, String>? authHeaders(Ref ref) {
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

  // final baseUrl = ref.read(baseUrlProvider());

  final headers = <String, String>{
    'x-requested-with': 'XMLHttpRequest',
    'accept': '*/*',
    'accept-language': 'zh-CN,zh;q=0.9',
    // 'origin': baseUrl,
    // 'referer': baseUrl,
  };
  logger.d('基础 headers: $headers');

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

/// 判断是否为 QuickConnect ID
bool _isQuickConnectId(String input) {
  // 不含 . 和 : 的字符串，且长度 >= 3
  return !input.contains('.') && !input.contains(':') && input.length >= 3;
}

/// 处理 QuickConnect 服务器信息
/// 返回 true 表示解析成功，false 表示需要尝试备用域名
bool _handleServerInfo(Map<String, dynamic> jsonBody) {
  final service = jsonBody['service'] as Map<String, dynamic>?;
  final server = jsonBody['server'] as Map<String, dynamic>?;

  if (service == null || server == null) {
    return false;
  }

  // 提取远程代理地址
  final relayIp = service['relay_ip'] as String?;
  final relayPort = service['relay_port'] as int?;
  final localPort = service['port'] as int?;

  // 提取局域网地址
  final interfaces = server['interface'] as List?;
  String? localIp;
  if (interfaces != null && interfaces.isNotEmpty) {
    final firstInterface = interfaces.first as Map<String, dynamic>?;
    localIp = firstInterface?['ip'] as String?;
  }

  // 如果没有必要的地址信息，返回 false
  if (relayIp == null || relayPort == null) {
    return false;
  }

  // 保存远程地址
  final remoteUrl = 'http://$relayIp:$relayPort';
  SharedPreferencesUtils.setRemoteBaseUrl(remoteUrl);
  logger.d('QuickConnect 远程地址: $remoteUrl');

  // 保存局域网地址
  if (localIp != null && localPort != null) {
    final localUrl = 'http://$localIp:$localPort';
    SharedPreferencesUtils.setLocalBaseUrl(localUrl);
    logger.d('QuickConnect 局域网地址: $localUrl');
  }

  return true;
}

/// 解析 QuickConnect 服务器信息
Future<void> _resolveQuickConnect(
  String quickConnectId,
  AppLocalizations l10n,
) async {
  var getServerInfoUrl = 'https://global.quickconnect.cn/Serv.php';

  final params = {
    'get_ca_fingerprints': true,
    'id': 'dsm',
    'serverID': quickConnectId,
    'command': 'get_server_info',
    'version': '1',
  };

  try {
    final response = await httpClientWrapper.post(
      getServerInfoUrl,
      body: HttpBody.json(params),
      headers: HttpHeaders.rawMap({'Content-Type': 'application/json'}),
    );

    if (response.statusCode != 200) {
      throw AudioStationException(
        message: l10n.error_qc_server_request_failed,
        statusCode: response.statusCode,
      );
    }

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    logger.d('QuickConnect 响应: $jsonBody');

    if (_handleServerInfo(jsonBody)) {
      return;
    }
    logger.d('QuickConnect 主域名解析失败，尝试备用域名');

    // 检查是否有备用 sites
    final sites = jsonBody['sites'] as List?;
    if (sites != null && sites.isNotEmpty) {
      final alternativeUrl = 'https://${sites.first}/Serv.php';
      logger.d('尝试备用域名: $alternativeUrl');

      try {
        final altResponse = await httpClientWrapper.post(
          alternativeUrl,
          body: HttpBody.json(params),
          headers: HttpHeaders.rawMap({'Content-Type': 'application/json'}),
        );

        if (altResponse.statusCode == 200) {
          final altJsonBody =
              jsonDecode(altResponse.body) as Map<String, dynamic>;
          if (_handleServerInfo(altJsonBody)) {
            return; // 备用域名解析成功
          }
        }
      } catch (e) {
        logger.w('备用域名请求失败: $e');
      }
    }

    final env = jsonBody['env'] as Map<String, dynamic>?;
    final controlHost = env?['control_host'] as String?;
    if (controlHost != null && controlHost.isNotEmpty) {
      logger.d('尝试中国区域名: $controlHost');
      await _resolveQuickConnectCN(
        'https://$controlHost/Serv.php',
        quickConnectId,
        l10n,
      );
      return;
    }

    throw AudioStationException(
      message: l10n.error_qc_server_info_parse_failed,
    );
  } catch (e) {
    logger.w('QuickConnect 解析失败: $e');
    rethrow;
  }
}

Future<void> _resolveQuickConnectCN(
  String url,
  String quickConnectId,
  AppLocalizations l10n,
) async {
  final params = {
    'location': 'zh_CN',
    'id': 'dsm',
    'platform': 'iPhone14,5',
    'serverID': quickConnectId,
    'command': 'request_tunnel',
    'version': '1',
  };

  try {
    final response = await httpClientWrapper.post(
      url,
      body: HttpBody.json(params),
      headers: HttpHeaders.rawMap({
        'Content-Type': 'application/json',
        'User-Agent':
            'Synology-DS_file_5.17.0_iPhone_13_iOS_16.5 (iPhone; iOS 16.5)',
      }),
    );

    if (response.statusCode != 200) {
      throw AudioStationException(
        message: l10n.error_qc_cn_server_request_failed,
        statusCode: response.statusCode,
      );
    }

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    if (!_handleServerInfo(jsonBody)) {
      throw AudioStationException(
        message: l10n.error_qc_cn_server_info_parse_failed,
      );
    }
  } catch (e) {
    logger.w('QuickConnect 中国区解析失败: $e');
    rethrow;
  }
}

@riverpod
Future<void> quickConnectTest(Ref ref, String quickConnectId) async {
  final l10n = ref.read(l10nProvider);
  if (!_isQuickConnectId(quickConnectId)) {
    throw AudioStationException(message: l10n.error_qc_invalid_id);
  }

  await _resolveQuickConnect(quickConnectId, l10n);
}

@riverpod
Future<AuthResponse> login(Ref ref) async {
  final keepAlive = ref.keepAliveFor(null);
  try {
    var l10n = ref.read(l10nProvider);

    final accountInfo = ref.watch(accountInfoProvider);
    if (accountInfo == null) {
      throw AudioStationException(message: l10n.error_account_info_invalid);
    }

    final serverUrl = ref.watch(serverUrlProvider);
    final isQuickConnect = _isQuickConnectId(serverUrl);

    if (isQuickConnect) {
      logger.d('检测到 QuickConnect ID: $serverUrl');
      try {
        await _resolveQuickConnect(serverUrl, l10n);
      } catch (e) {
        logger.w('QuickConnect 解析失败，清除缓存: $e');
        await SharedPreferencesUtils.setRemoteBaseUrl(null);
        await SharedPreferencesUtils.setLocalBaseUrl(null);
        rethrow;
      }
    } else {
      await SharedPreferencesUtils.setRemoteBaseUrl(null);
      await SharedPreferencesUtils.setLocalBaseUrl(null);
    }

    final cookiesInfo = ref.read(audioStationCookiesInfoProvider);
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

    final result = await fullLogin(ref, accountInfo, l10n);
    logger.d('登录响应: $result');
    return result;
  } finally {
    keepAlive.close();
  }
}

Future<LogoutResponse> logout(WidgetRef ref) async {
  final l10n = ref.read(l10nProvider);

  final authHeaders = ref.read(authHeadersProvider);
  if (authHeaders == null) {
    return LogoutResponse(success: false);
  }

  final baseUrl = ref.read(baseUrlProvider());
  final request = LogoutRequest(
    api: 'SYNO.API.Auth',
    method: 'logout',
    version: '6',
  );
  try {
    final cancelToken = CancelToken();
    Future.delayed(const Duration(seconds: 10), () async {
      await cancelToken.cancel();
    });
    final response = await httpClientWrapper.get(
      '$baseUrl/webapi/entry.cgi',
      query: request.toJson().map(
        (key, value) => MapEntry(key, value?.toString() ?? ''),
      ),
      headers: HttpHeaders.rawMap({'accept': '*/*', ...authHeaders}),
      cancelToken: cancelToken,
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
  } catch (e) {
    logger.w('登出请求失败: $e');
  }

  return LogoutResponse(success: true);
}

Future<AuthResponse> retryLogin(Ref ref, AppLocalizations l10n) async {
  final accountInfo = ref.read(accountInfoProvider);
  if (accountInfo == null) {
    throw AudioStationException(message: l10n.error_account_info_invalid);
  }
  return await fullLogin(ref, accountInfo, l10n);
}
