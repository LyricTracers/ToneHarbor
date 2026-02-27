import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'locale_provider.g.dart';

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
