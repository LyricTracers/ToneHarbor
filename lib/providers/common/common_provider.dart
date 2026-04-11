import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
part 'common_provider.g.dart';

mixin ExtraProvider<T> on $AsyncNotifier<T> {
  Duration? duration;
  late String groupKey;
  String extraSortBy = '';
  String extraSortDirection = '';

  Future<void> invalidateCache() async {
    if (duration != null) {
      await audioStationRequestCache.clearGroup(groupKey);
    }
  }

  Future<void> loadMore();

  Future<void> setSort({required String sortBy, required String sortDirection});
}

enum LyricsDoubleClickAction {
  copy,
  seek;

  String get displayName {
    switch (this) {
      case LyricsDoubleClickAction.copy:
        return '拷贝歌词';
      case LyricsDoubleClickAction.seek:
        return '跳转播放';
    }
  }
}

enum Language {
  zh('zh', '简体中文'),
  en('en', 'English');

  final String languageCode;
  final String displayName;
  const Language(this.languageCode, this.displayName);

  @override
  String toString() => displayName;

  static Language fromLocale(Locale locale) {
    return Language.values.firstWhere(
      (lang) => lang.languageCode == locale.languageCode,
      orElse: () => Language.zh,
    );
  }
}

enum CloudMusicLanguageType {
  unKnow(0, '无偏好'),
  zh(1, '华语'),
  en(2, '欧美'),
  kr(3, '韩语'),
  jp(4, '日语');

  final int value;
  final String displayName;
  const CloudMusicLanguageType(this.value, this.displayName);
}

@riverpod
class LyricDoubleClick extends _$LyricDoubleClick {
  @override
  LyricsDoubleClickAction build() {
    return SharedPreferencesUtils.getDoubleLyricAction();
  }

  void setAction(LyricsDoubleClickAction action) async {
    state = action;
    await SharedPreferencesUtils.setDoubleLyricAction(action);
  }
}

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
  Locale build() {
    return SharedPreferencesUtils.getLocale();
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await SharedPreferencesUtils.setLocale(locale);
  }

  Future<void> toggleLanguage() async {
    final currentLanguageCode = state.languageCode;
    final newLocale = currentLanguageCode == 'zh'
        ? const Locale('en')
        : const Locale('zh');
    await setLocale(newLocale);
  }
}

@riverpod
class SearchHistoryNotifier extends _$SearchHistoryNotifier {
  @override
  List<String> build() {
    return SharedPreferencesUtils.getSearchHistory();
  }

  Future<void> addSearch(String query) async {
    if (query.trim().isEmpty) return;

    final currentHistory = state;
    final updatedHistory = List<String>.from(currentHistory);
    updatedHistory.remove(query);
    updatedHistory.insert(0, query);

    if (updatedHistory.length > 5) {
      updatedHistory.removeRange(5, updatedHistory.length);
    }

    state = updatedHistory;

    await SharedPreferencesUtils.setSearchHistory(updatedHistory);
  }

  Future<void> removeSearch(String query) async {
    final currentHistory = state;
    final updatedHistory = List<String>.from(currentHistory);
    updatedHistory.remove(query);

    state = updatedHistory;

    await SharedPreferencesUtils.setSearchHistory(updatedHistory);
  }

  Future<void> clearHistory() async {
    state = [];

    await SharedPreferencesUtils.setSearchHistory([]);
  }
}

@keepAlive
AppLocalizations l10n(Ref ref) {
  final locale = ref.watch(localeProvider);
  return lookupAppLocalizations(locale);
}

@riverpod
class VolumeNotifier extends _$VolumeNotifier {
  @override
  double build() {
    var volume = SharedPreferencesUtils.getVolume();
    audioPlayer.setVolume(volume);
    return volume;
  }

  Future<void> setVolume(double value) async {
    state = value;
    await audioPlayer.setVolume(value);
    await SharedPreferencesUtils.setVolume(value);
  }
}

@riverpod
class AudioQualityNotifier extends _$AudioQualityNotifier {
  @override
  AudioQuality build() {
    return SharedPreferencesUtils.getAudioQuality();
  }

  Future<void> setAudioQuality(AudioQuality quality) async {
    state = quality;
    await SharedPreferencesUtils.setAudioQuality(quality);
  }
}

@riverpod
class StatusBarLyric extends _$StatusBarLyric {
  @override
  bool build() {
    return SharedPreferencesUtils.getStatusBarLyric();
  }

  void set(bool value) async {
    state = value;
    await SharedPreferencesUtils.setStatusStatusBarLyric(value);
  }
}

@riverpod
class NormalizeAudio extends _$NormalizeAudio {
  @override
  bool build() {
    return SharedPreferencesUtils.getNormalizeAudio();
  }

  void set(bool value) async {
    state = value;
    await SharedPreferencesUtils.setNormalizeAudio(value);
  }
}

@riverpod
class TrayFontSize extends _$TrayFontSize {
  @override
  double build() {
    return SharedPreferencesUtils.getTrayFontSize();
  }

  void setFontSize(double value) async {
    state = value;
    await SharedPreferencesUtils.setTrayFontSize(value);
  }
}

class CloudMusicApiState {
  final List<String> urls;
  final String defaultUrl;
  final bool useAsHome;

  const CloudMusicApiState({
    this.urls = const [],
    this.defaultUrl = '',
    this.useAsHome = false,
  });

  CloudMusicApiState copyWith({
    List<String>? urls,
    String? defaultUrl,
    bool? useAsHome,
  }) {
    return CloudMusicApiState(
      urls: urls ?? this.urls,
      defaultUrl: defaultUrl ?? this.defaultUrl,
      useAsHome: useAsHome ?? this.useAsHome,
    );
  }
}

@riverpod
class CloudMusicApiUrls extends _$CloudMusicApiUrls {
  @override
  CloudMusicApiState build() {
    return CloudMusicApiState(
      urls: SharedPreferencesUtils.getCloudMusicApiUrls(),
      defaultUrl: SharedPreferencesUtils.getCloudMusicApiDefaultUrl(),
      useAsHome: SharedPreferencesUtils.getUseCloudMusicApiAsHome(),
    );
  }

  Future<void> addUrl(String url) async {
    final normalizedUrl = url.trim().replaceAll(RegExp(r'/+$'), '');
    if (normalizedUrl.isEmpty) return;
    final currentUrls = List<String>.from(state.urls);
    if (!currentUrls.contains(normalizedUrl)) {
      currentUrls.insert(0, normalizedUrl);
      final newDefaultUrl = state.defaultUrl.isEmpty
          ? normalizedUrl
          : state.defaultUrl;
      state = state.copyWith(urls: currentUrls, defaultUrl: newDefaultUrl);
      await SharedPreferencesUtils.setCloudMusicApiUrls(currentUrls);
      await SharedPreferencesUtils.setCloudMusicApiDefaultUrl(newDefaultUrl);
    }
  }

  Future<void> removeUrl(String url) async {
    final currentUrls = List<String>.from(state.urls);
    currentUrls.remove(url);
    String newDefaultUrl = state.defaultUrl;
    if (state.defaultUrl == url) {
      newDefaultUrl = currentUrls.isNotEmpty ? currentUrls.first : '';
    }
    state = state.copyWith(urls: currentUrls, defaultUrl: newDefaultUrl);
    await SharedPreferencesUtils.setCloudMusicApiUrls(currentUrls);
    await SharedPreferencesUtils.setCloudMusicApiDefaultUrl(newDefaultUrl);
  }

  Future<void> setDefaultUrl(String url) async {
    state = state.copyWith(defaultUrl: url);
    await SharedPreferencesUtils.setCloudMusicApiDefaultUrl(url);
  }

  Future<void> setUseAsHome(bool value) async {
    state = state.copyWith(useAsHome: value);
    await SharedPreferencesUtils.setUseCloudMusicApiAsHome(value);
  }
}

@riverpod
class CloudMusicLanguage extends _$CloudMusicLanguage {
  @override
  CloudMusicLanguageType build() {
    return CloudMusicLanguageType.values.firstWhere(
      (lang) => lang.value == SharedPreferencesUtils.getCloudMusicLanguage(),
      orElse: () => CloudMusicLanguageType.unKnow,
    );
  }

  Future<void> set(CloudMusicLanguageType value) async {
    state = value;
    await SharedPreferencesUtils.setCloudMusicLanguage(value.value);
  }
}

@riverpod
class CloudMusicAuthState extends _$CloudMusicAuthState {
  @override
  bool build() {
    return CloudMusicAuth.isLoggedIn();
  }

  Future<void> loginSuccess(String cookies) async {
    await CloudMusicAuth.saveCookies(cookies);
    await clearCacheByGroupKey(groupKey: 'cloud_recommendPlaylist');
    await clearCacheByGroupKey(groupKey: 'cloud_user');
    state = true;
  }

  Future<void> logout() async {
    await CloudMusicAuth.clearCookies();
    state = false;
  }
}

@riverpod
class CloudMusicCategory extends _$CloudMusicCategory {
  @override
  List<String> build() {
    return SharedPreferencesUtils.getCloudMusicCategory();
  }

  void addCategory(String category) async {
    state = [...state, category];
    await SharedPreferencesUtils.setCloudMusicCategory(state);
  }

  void removeCategory(String category) async {
    state = state.where((element) => element != category).toList();
    await SharedPreferencesUtils.setCloudMusicCategory(state);
  }
}
