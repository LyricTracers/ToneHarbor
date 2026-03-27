import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toneharbor/models/audio_player/sub_content_state.dart';
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

enum SubContentType { none, playList, songInfo, addToPlayLists, updateLyrics }

@keepAlive
class SubContent extends _$SubContent {
  @override
  SubContentData build() {
    return SubContentData(type: SubContentType.none);
  }

  void set(SubContentData t) {
    state = t;
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
