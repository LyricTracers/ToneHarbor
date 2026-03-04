import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/services/hive/hive_adapters.dart';
import 'package:toneharbor/services/hive/hive_service.dart';

part 'playback_history_provider.g.dart';

const int _maxHistorySize = 100;

class PlaybackHistoryEntry {
  final Song track;
  final DateTime playedAt;
  final int playDurationMs;

  const PlaybackHistoryEntry({
    required this.track,
    required this.playedAt,
    required this.playDurationMs,
  });
}

@riverpod
class PlaybackHistory extends _$PlaybackHistory {
  @override
  Future<List<PlaybackHistoryEntry>> build() async {
    return _loadHistory();
  }

  Future<List<PlaybackHistoryEntry>> _loadHistory() async {
    try {
      final box = HiveService.getPlaybackHistoryBox();
      final entries = box.values.toList();

      entries.sort((a, b) => b.playedAt.compareTo(a.playedAt));

      return entries
          .map((e) => PlaybackHistoryEntry(
                track: e.track.toSong(),
                playedAt: e.playedAt,
                playDurationMs: e.playDurationMs,
              ))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addTrack(Song track, {int playDurationMs = 0}) async {
    try {
      final box = HiveService.getPlaybackHistoryBox();

      final entry = PlaybackHistoryEntryHive(
        track: SongHive.fromSong(track),
        playedAt: DateTime.now(),
        playDurationMs: playDurationMs,
      );

      await box.add(entry);

      final allEntries = box.values.toList();
      if (allEntries.length > _maxHistorySize) {
        allEntries.sort((a, b) => b.playedAt.compareTo(a.playedAt));
        final toDelete = allEntries.sublist(_maxHistorySize);
        for (final e in toDelete) {
          await e.delete();
        }
      }

      state = AsyncData(await _loadHistory());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeTrack(String trackId) async {
    try {
      final box = HiveService.getPlaybackHistoryBox();
      final entries = box.values.toList();

      for (final entry in entries) {
        if (entry.track.id == trackId) {
          await entry.delete();
        }
      }

      state = AsyncData(await _loadHistory());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearHistory() async {
    try {
      final box = HiveService.getPlaybackHistoryBox();
      await box.clear();
      state = const AsyncData([]);
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
