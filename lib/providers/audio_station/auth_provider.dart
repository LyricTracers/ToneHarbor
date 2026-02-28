import 'dart:convert';
import 'dart:ui';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/auth.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/Excetions.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/consts.dart';

part 'auth_provider.g.dart';
part 'auth_provider.dependence.dart';

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

  Future<void> clearCookie() async {
    final sp = await SharedPreferences.getInstance();
    await sp.remove(cookieKey);
    ref.read(synoTokenProvider.notifier).clear();
    state = const AsyncData(null);
  }
}

@keepAlive
Future<String> baseUrl(Ref ref) async {
  final serverUrl = await ref.watch(serverUrlProvider.future);
  if (serverUrl.isEmpty) {
    throw AudioStationException(message: '服务器地址不能为空');
  }
  final useHttp = await ref.watch(useHttpProvider.future);
  final scheme = useHttp ? 'https' : 'http';
  return '$scheme://$serverUrl';
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
      final response = await _refreshToken(ref, cookiesInfo, l10n);
      logger.d('刷新 token 完成: ${response.data?.synotoken}');
      if (response.data?.synotoken != null) {
        Future.microtask(() {
          ref
              .read(synoTokenProvider.notifier)
              .setSynotoken(response.data!.synotoken);
        });
        return response.data!.synotoken;
      }
    } catch (e) {
      logger.w('获取 synotoken 失败: $e');
      Future.microtask(() {
        ref
            .read(audioStationCookiesInfoProvider.notifier)
            .setCookies(
              AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
            );
        ref.read(synoTokenProvider.notifier).clear();
      });
    }
  } else {
    logger.d('Cookie 无效，返回 null');
    Future.microtask(() {
      ref.read(synoTokenProvider.notifier).clear();
    });
  }

  return null;
}

@riverpod
Future<Map<String, String>?> authHeaders(Ref ref) async {
  final serverUrl = await ref.watch(serverUrlProvider.future);
  if (serverUrl.isEmpty) {
    logger.w('serverUrl 为空，返回 null');
    return null;
  }

  final baseUrl = await ref.watch(baseUrlProvider.future);

  final headers = <String, String>{
    'x-requested-with': 'XMLHttpRequest',
    'accept': '*/*',
    'accept-language': 'zh-CN,zh;q=0.9',
    'origin': baseUrl,
    'referer': '$baseUrl/music/',
  };

  final cookiesInfo = await ref.watch(audioStationCookiesInfoProvider.future);

  if (cookiesInfo == null || !cookiesInfo.isValid) {
    logger.d('Cookie 无效，返回 null');
    return null;
  }

  final cookieString = "id=${cookiesInfo.id}; did=${cookiesInfo.did}";
  headers['Cookie'] = cookieString;
  logger.d('使用Cookie: $cookieString');

  final synotoken = ref.read(synoTokenProvider);
  if (synotoken == null) {
    logger.d('synotoken 为空，返回 null');
    return null;
  }

  headers['x-syno-token'] = synotoken;
  logger.d('使用SynoToken: $synotoken');

  return headers;
}

Future<AuthResponse> login(WidgetRef ref) async {
  var l10n = lookupAppLocalizations(
    getValueWhenReadyWithWidgetRef(ref, localeProvider, const Locale('zh')),
  );

  final accountInfo = getValueWhenReadyWithWidgetRef(
    ref,
    accountInfoProvider,
    null,
  );
  if (accountInfo == null) {
    throw AudioStationException(message: l10n.error_account_info_invalid);
  }

  final cookiesInfo = getValueWhenReadyWithWidgetRef(
    ref,
    audioStationCookiesInfoProvider,
    null,
  );
  final hasValidCookies = cookiesInfo != null && cookiesInfo.isValid;

  if (hasValidCookies) {
    logger.d('Cookie 有效，尝试刷新 token');
    try {
      return await _refreshTokenWithWidgetRef(ref, cookiesInfo, l10n);
    } catch (e) {
      logger.w('刷新 token 失败，尝试完整登录: $e');
    }
  }

  logger.d('进行完整登录');

  return await _fullLogin(ref, accountInfo, l10n);
}
