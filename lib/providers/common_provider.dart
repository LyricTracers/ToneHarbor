import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/utils/base_utils.dart';
part 'common_provider.g.dart';

@keepAlive
class RequestFlag extends _$RequestFlag {
  @override
  bool build() => false;

  void setRequestFlag(bool value) {
    state = value;
  }
}

@keepAlive
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Future<Locale> build() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(localeKey) ?? 'zh';
    return Locale(localeCode);
  }

  Future<void> setLocale(Locale locale) async {
    state = AsyncValue.data(locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(localeKey, locale.languageCode);
  }

  Future<void> toggleLanguage() async {
    final newLocale = state.value?.languageCode == 'zh'
        ? const Locale('en')
        : const Locale('zh');
    await setLocale(newLocale);
  }
}
