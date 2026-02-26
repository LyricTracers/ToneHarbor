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
class UseHttp extends _$UseHttp {
  @override
  Future<bool> build() async {
    return await getUseHttp();
  }

  Future<void> toggle() async {
    final useHttp = await getUseHttp();
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(useHttpKey, !useHttp);
    state = AsyncData(useHttp);
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

  Future<void> setCookies(String cookies) async {
    if (cookies.isEmpty) {
      state = const AsyncData(null);
      return;
    }
    var cookie = AudioStationCookies.fromJson(jsonDecode(cookies));
    if (cookie.isValid) {
      final sp = await SharedPreferences.getInstance();
      await sp.setString(cookieKey, cookies);
      state = AsyncData(cookie);
    } else {
      state = const AsyncData(null);
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
