import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
part 'common_provider.g.dart';

@riverpod
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
    final prefs = await getSharedPreferences();
    final localeCode = prefs.getString(localeKey) ?? 'zh';
    return Locale(localeCode);
  }

  Future<void> setLocale(Locale locale) async {
    state = AsyncValue.data(locale);
    final prefs = await getSharedPreferences();
    await prefs.setString(localeKey, locale.languageCode);
  }

  Future<void> toggleLanguage() async {
    final currentLanguageCode = state.value?.languageCode ?? 'zh';
    final newLocale = currentLanguageCode == 'zh'
        ? const Locale('en')
        : const Locale('zh');
    await setLocale(newLocale);
  }
}

@riverpod
class SearchHistoryNotifier extends _$SearchHistoryNotifier {
  @override
  Future<List<String>> build() async {
    final prefs = await getSharedPreferences();
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

    final prefs = await getSharedPreferences();
    await prefs.setStringList(searchHistoryKey, updatedHistory);
  }

  Future<void> removeSearch(String query) async {
    final currentHistory = state.value ?? [];
    final updatedHistory = List<String>.from(currentHistory);
    updatedHistory.remove(query);

    state = AsyncValue.data(updatedHistory);

    final prefs = await getSharedPreferences();
    await prefs.setStringList(searchHistoryKey, updatedHistory);
  }

  Future<void> clearHistory() async {
    state = AsyncValue.data([]);

    final prefs = await getSharedPreferences();
    await prefs.setStringList(searchHistoryKey, []);
  }
}

@keepAlive
Future<AppLocalizations> l10n(Ref ref) async {
  final locale = await ref.watch(localeProvider.future);
  return lookupAppLocalizations(locale);
}
