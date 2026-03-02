import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
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

@keepAlive
class SearchHistoryNotifier extends _$SearchHistoryNotifier {
  @override
  Future<List<String>> build() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(searchHistoryKey) ?? [];
    return history;
  }

  Future<void> addSearch(String query) async {
    if (query.trim().isEmpty) return;

    final currentHistory = state.value ?? [];
    final updatedHistory = List<String>.from(currentHistory);
    updatedHistory.remove(query);
    updatedHistory.insert(0, query);

    if (updatedHistory.length > 10) {
      updatedHistory.removeRange(10, updatedHistory.length);
    }

    state = AsyncValue.data(updatedHistory);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(searchHistoryKey, updatedHistory);
  }

  Future<void> removeSearch(String query) async {
    final currentHistory = state.value ?? [];
    final updatedHistory = List<String>.from(currentHistory);
    updatedHistory.remove(query);

    state = AsyncValue.data(updatedHistory);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(searchHistoryKey, updatedHistory);
  }

  Future<void> clearHistory() async {
    state = AsyncValue.data([]);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(searchHistoryKey, []);
  }
}

@keepAlive
Future<AppLocalizations> l10n(Ref ref) async {
  final locale = await ref.watch(localeProvider.future);
  return lookupAppLocalizations(locale);
}
