import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/services/hive/hive_adapters.dart';
import 'package:toneharbor/services/hive/hive_service.dart';

part 'audio_player_state_persistence.g.dart';

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
}

@riverpod
class AudioPlayerStatePersistence extends _$AudioPlayerStatePersistence {
  static const String _stateKey = 'player_state';

  @override
  Future<AudioPlayerPersistedState> build() async {
    return _loadState();
  }

  Future<AudioPlayerPersistedState> _loadState() async {
    try {
      final box = HiveService.getPlayerStateBox();
      final hiveState = box.get(_stateKey);

      if (hiveState == null) {
        return const AudioPlayerPersistedState();
      }

      return AudioPlayerPersistedState(
        playing: hiveState.playing,
        loopMode: hiveState.playlistMode,
        shuffled: hiveState.shuffled,
        collections: hiveState.collections,
        currentIndex: hiveState.currentIndex,
        tracks: hiveState.tracks.map((t) => t.toSong()).toList(),
      );
    } catch (e) {
      return const AudioPlayerPersistedState();
    }
  }

  Future<void> saveState(AudioPlayerPersistedState state) async {
    try {
      final box = HiveService.getPlayerStateBox();
      final hiveState = AudioPlayerPersistedStateHive.fromDomain(
        playing: state.playing,
        loopMode: state.loopMode,
        shuffled: state.shuffled,
        collections: state.collections,
        currentIndex: state.currentIndex,
        tracks: state.tracks,
      );
      await box.put(_stateKey, hiveState);
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
      final box = HiveService.getPlayerStateBox();
      await box.delete(_stateKey);
      state = const AsyncData(AudioPlayerPersistedState());
    } catch (e) {
      rethrow;
    }
  }
}
