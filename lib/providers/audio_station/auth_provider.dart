import 'dart:convert';
import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/models/audio_station/auth.dart';
import 'package:toneharbor/providers/locale_provider.dart';
import 'package:toneharbor/utils/Excetions.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/consts.dart';
import 'package:toneharbor/init/initialized.dart';
part 'auth_provider.g.dart';

@keepAlive
class ServerUrl extends _$ServerUrl {
  String cacheServerUrl = '';
  @override
  Future<String> build() async {
    if (cacheServerUrl.isNotEmpty) {
      return cacheServerUrl;
    }
    final sp = await SharedPreferences.getInstance();
    final serverUrl = sp.getString(serverUrlKey) ?? '';
    if (serverUrl.isNotEmpty) {
      cacheServerUrl = serverUrl;
      return serverUrl;
    }
    return '';
  }

  Future<void> setServerUrl(String serverUrl) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(serverUrlKey, serverUrl);
    cacheServerUrl = serverUrl;
  }
}

@keepAlive
class AccountInfo extends _$AccountInfo {
  String cacheAccountJson = '';
  @override
  Future<Account?> build() async {
    if (cacheAccountJson.isNotEmpty) {
      return Account.fromJson(jsonDecode(cacheAccountJson));
    }
    final sp = await SharedPreferences.getInstance();
    final accountJson = sp.getString(accountKey) ?? '';
    if (accountJson.isNotEmpty) {
      cacheAccountJson = accountJson;
      return Account.fromJson(jsonDecode(accountJson));
    }
    return null;
  }

  Future<void> setAccount(Account account) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(accountKey, jsonEncode(account.toJson()));
    cacheAccountJson = jsonEncode(account.toJson());
  }
}

@keepAlive
class AudioStationCookiesInfo extends _$AudioStationCookiesInfo {
  AudioStationCookies? cacheCookies;
  @override
  Future<AudioStationCookies?> build() async {
    if (cacheCookies != null && cacheCookies!.isValid) {
      return cacheCookies!;
    }
    final sp = await SharedPreferences.getInstance();
    final cookies = sp.getString(cookieKey) ?? '';
    if (cookies.isNotEmpty) {
      cacheCookies = AudioStationCookies.fromJson(jsonDecode(cookies));
      if (cacheCookies!.isValid) {
        return cacheCookies!;
      }
    }
    return null;
  }

  Future<void> setCookies(String cookies) async {
    if (cookies.isEmpty) {
      return;
    }
    var cookie = AudioStationCookies.fromJson(jsonDecode(cookies));
    if (cookie.isValid) {
      cacheCookies = cookie;
      final sp = await SharedPreferences.getInstance();
      await sp.setString(cookieKey, cookies);
    } else {
      cacheCookies = null;
    }
  }
}

@riverpod
Future<AuthResponse?> login(Ref ref) async {
  final l10n = getValueWhenReadyWithRef(ref, appLocalizationsProvider, null);
  if (l10n == null) {
    throw AudioStationException(message: 'AppLocalizations not found');
  }

  final serverUrl = getValueWhenReadyWithRef(ref, serverUrlProvider, '');
  if (serverUrl.isEmpty) {
    throw AudioStationException(message: l10n.error_invalidUrl);
  }

  final accountInfo = getValueWhenReadyWithRef(ref, accountInfoProvider, null);
  if (accountInfo == null) {
    throw AudioStationException(message: l10n.error_account_info_invalid);
  }
  return null;
}
