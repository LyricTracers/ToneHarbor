import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/models/audio_station/song.dart';

part 'playback_history_provider.g.dart';

const _playbackHistoryKey = 'playback_history';
const _maxHistorySize = 100;

class PlaybackHistoryEntry {
  final Song track;
  final DateTime playedAt;
  final int playDurationMs;

  const PlaybackHistoryEntry({
    required this.track,
    required this.playedAt,
    required this.playDurationMs,
  });

  factory PlaybackHistoryEntry.fromJson(Map<String, dynamic> json) {
    return PlaybackHistoryEntry(
      track: Song.fromJson(json['track'] as Map<String, dynamic>),
      playedAt: DateTime.parse(json['playedAt'] as String),
      playDurationMs: json['playDurationMs'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'track': track.toJson(),
      'playedAt': playedAt.toIso8601String(),
      'playDurationMs': playDurationMs,
    };
  }
}

@riverpod
class PlaybackHistory extends _$PlaybackHistory {
  @override
  Future<List<PlaybackHistoryEntry>> build() async {
    return _loadHistory();
  }

  Future<List<PlaybackHistoryEntry>> _loadHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_playbackHistoryKey);
      if (jsonString == null) {
        return [];
      }
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList
          .map((e) => PlaybackHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addTrack(Song track, {int playDurationMs = 0}) async {
    final current = state.value ?? [];

    final entry = PlaybackHistoryEntry(
      track: track,
      playedAt: DateTime.now(),
      playDurationMs: playDurationMs,
    );

    final updated = [entry, ...current];

    if (updated.length > _maxHistorySize) {
      updated.removeRange(_maxHistorySize, updated.length);
    }

    await _saveHistory(updated);
    state = AsyncData(updated);
  }

  Future<void> removeTrack(String trackId) async {
    final current = state.value ?? [];
    final updated = current.where((e) => e.track.id != trackId).toList();
    await _saveHistory(updated);
    state = AsyncData(updated);
  }

  Future<void> clearHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_playbackHistoryKey);
      state = const AsyncData([]);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveHistory(List<PlaybackHistoryEntry> history) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonList = history.map((e) => e.toJson()).toList();
      await prefs.setString(_playbackHistoryKey, jsonEncode(jsonList));
    } catch (e) {
      rethrow;
    }
  }

  List<Song> getRecentTracks({int limit = 20}) {
    final history = state.value ?? [];
    return history.take(limit).map((e) => e.track).toList();
  }

  Map<String, int> getMostPlayedTracks({int limit = 10}) {
    final history = state.value ?? [];
    final countMap = <String, int>{};

    for (final entry in history) {
      countMap[entry.track.id] = (countMap[entry.track.id] ?? 0) + 1;
    }

    final sorted = countMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Map.fromEntries(sorted.take(limit));
  }
}

@riverpod
List<Song> recentTracks(Ref ref, {int limit = 20}) {
  final history = ref.watch(playbackHistoryProvider).value ?? [];
  return history.take(limit).map((e) => e.track).toList();
}

@riverpod
Map<String, int> mostPlayedTracks(Ref ref, {int limit = 10}) {
  final history = ref.watch(playbackHistoryProvider).value ?? [];
  final countMap = <String, int>{};

  for (final entry in history) {
    countMap[entry.track.id] = (countMap[entry.track.id] ?? 0) + 1;
  }

  final sorted = countMap.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  return Map.fromEntries(sorted.take(limit));
}
