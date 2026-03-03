import 'dart:convert';

import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/models/audio_station/song.dart';

part 'audio_player_state_persistence.g.dart';

const _audioPlayerStateKey = 'audio_player_state';

class AudioPlayerPersistedState {
  final bool playing;
  final PlaylistMode loopMode;
  final bool shuffled;
  final List<String> collections;
  final int currentIndex;
  final List<Song> tracks;

  const AudioPlayerPersistedState({
    this.playing = false,
    this.loopMode = PlaylistMode.none,
    this.shuffled = false,
    this.collections = const [],
    this.currentIndex = 0,
    this.tracks = const [],
  });

  factory AudioPlayerPersistedState.fromJson(Map<String, dynamic> json) {
    return AudioPlayerPersistedState(
      playing: json['playing'] as bool? ?? false,
      loopMode: PlaylistMode.values.firstWhere(
        (e) => e.name == json['loopMode'],
        orElse: () => PlaylistMode.none,
      ),
      shuffled: json['shuffled'] as bool? ?? false,
      collections:
          (json['collections'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      currentIndex: json['currentIndex'] as int? ?? 0,
      tracks:
          (json['tracks'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playing': playing,
      'loopMode': loopMode.name,
      'shuffled': shuffled,
      'collections': collections,
      'currentIndex': currentIndex,
      'tracks': tracks.map((e) => e.toJson()).toList(),
    };
  }
}

@riverpod
class AudioPlayerStatePersistence extends _$AudioPlayerStatePersistence {
  @override
  Future<AudioPlayerPersistedState> build() async {
    return _loadState();
  }

  Future<AudioPlayerPersistedState> _loadState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_audioPlayerStateKey);
      if (jsonString == null) {
        return const AudioPlayerPersistedState();
      }
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return AudioPlayerPersistedState.fromJson(json);
    } catch (e) {
      return const AudioPlayerPersistedState();
    }
  }

  Future<void> saveState(AudioPlayerPersistedState state) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_audioPlayerStateKey, jsonEncode(state.toJson()));
      this.state = AsyncData(state);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> savePlaying(bool playing) async {
    final current = state.value ?? const AudioPlayerPersistedState();
    await saveState(
      AudioPlayerPersistedState(
        playing: playing,
        loopMode: current.loopMode,
        shuffled: current.shuffled,
        collections: current.collections,
        currentIndex: current.currentIndex,
        tracks: current.tracks,
      ),
    );
  }

  Future<void> saveLoopMode(PlaylistMode loopMode) async {
    final current = state.value ?? const AudioPlayerPersistedState();
    await saveState(
      AudioPlayerPersistedState(
        playing: current.playing,
        loopMode: loopMode,
        shuffled: current.shuffled,
        collections: current.collections,
        currentIndex: current.currentIndex,
        tracks: current.tracks,
      ),
    );
  }

  Future<void> saveShuffled(bool shuffled) async {
    final current = state.value ?? const AudioPlayerPersistedState();
    await saveState(
      AudioPlayerPersistedState(
        playing: current.playing,
        loopMode: current.loopMode,
        shuffled: shuffled,
        collections: current.collections,
        currentIndex: current.currentIndex,
        tracks: current.tracks,
      ),
    );
  }

  Future<void> saveTracks(List<Song> tracks, int currentIndex) async {
    final current = state.value ?? const AudioPlayerPersistedState();
    await saveState(
      AudioPlayerPersistedState(
        playing: current.playing,
        loopMode: current.loopMode,
        shuffled: current.shuffled,
        collections: current.collections,
        currentIndex: currentIndex,
        tracks: tracks,
      ),
    );
  }

  Future<void> saveCollections(List<String> collections) async {
    final current = state.value ?? const AudioPlayerPersistedState();
    await saveState(
      AudioPlayerPersistedState(
        playing: current.playing,
        loopMode: current.loopMode,
        shuffled: current.shuffled,
        collections: collections,
        currentIndex: current.currentIndex,
        tracks: current.tracks,
      ),
    );
  }

  Future<void> clearState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_audioPlayerStateKey);
      state = const AsyncData(AudioPlayerPersistedState());
    } catch (e) {
      rethrow;
    }
  }
}
