import 'dart:async';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/audio_player_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/database/database.dart';
import 'package:toneharbor/providers/database/database.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';

part 'audio_player_provider.g.dart';

@keepAlive
class AudioPlayerStateNotifier extends _$AudioPlayerStateNotifier {
  @override
  AudioPlayerState build() {
    final subscriptions = [
      audioPlayer.playingStream.listen((playing) async {
        try {
          state = state.copyWith(playing: playing);
          await _updatePlayerState(
            AudioPlayerStateTableCompanion(playing: Value(playing)),
          );
        } catch (e, stack) {
          logger.e(
            'Failed to update playing state',
            error: e,
            stackTrace: stack,
          );
        }
      }),

      audioPlayer.loopModeStream.listen((loopMode) async {
        try {
          state = state.copyWith(loopMode: loopMode);
          await _updatePlayerState(
            AudioPlayerStateTableCompanion(loopMode: Value(loopMode)),
          );
        } catch (e, stack) {
          logger.e(
            'Failed to update loop mode state',
            error: e,
            stackTrace: stack,
          );
        }
      }),

      audioPlayer.shuffledStream.listen((shuffled) async {
        try {
          state = state.copyWith(shuffled: shuffled);

          await _updatePlayerState(
            AudioPlayerStateTableCompanion(shuffled: Value(shuffled)),
          );
        } catch (e, stack) {
          logger.e(
            'Failed to update shuffled state',
            error: e,
            stackTrace: stack,
          );
        }
      }),

      audioPlayer.playlistStream.listen((playlist) async {
        try {
          final tracks = playlist.medias
              .map((e) => ToneHarborMedia.media(e).track)
              .toList();

          state = state.copyWith(tracks: tracks, currentIndex: playlist.index);
          await _updatePlayerState(
            AudioPlayerStateTableCompanion(
              currentIndex: Value(state.currentIndex),
              tracks: Value(state.tracks),
            ),
          );
        } catch (e, stack) {
          logger.e(
            'Failed to update playlist state',
            error: e,
            stackTrace: stack,
          );
        }
      }),
    ];
    _syncSavedState();
    ref.onDispose(() {
      for (final subscription in subscriptions) {
        subscription.cancel();
      }
    });

    return AudioPlayerState(
      loopMode: audioPlayer.loopMode,
      playing: audioPlayer.isPlaying,
      shuffled: audioPlayer.isShuffled,
      tracks: [],
    );
  }

  Future<void> _syncSavedState() async {
    final database = ref.read(appDatabaseProvider);

    var playerState = await database
        .select(database.audioPlayerStateTable)
        .getSingleOrNull();

    if (playerState == null) {
      await database
          .into(database.audioPlayerStateTable)
          .insert(
            AudioPlayerStateTableCompanion.insert(
              playing: audioPlayer.isPlaying,
              loopMode: audioPlayer.loopMode,
              shuffled: audioPlayer.isShuffled,
              tracks: const Value(<ToneHarborTrackObject>[]),
              currentIndex: const Value(0),
              id: const Value(0),
            ),
          );

      playerState = await database
          .select(database.audioPlayerStateTable)
          .getSingle();
    } else {
      await audioPlayer.setLoopMode(playerState.loopMode);
      await audioPlayer.setShuffle(playerState.shuffled);
    }

    final tracks = playerState.tracks;
    final currentIndex = playerState.currentIndex;

    if (tracks.isEmpty && state.tracks.isNotEmpty) {
      await _updatePlayerState(
        AudioPlayerStateTableCompanion(
          tracks: Value(state.tracks),
          currentIndex: Value(currentIndex),
        ),
      );
    } else if (tracks.isNotEmpty) {
      state = state.copyWith(tracks: tracks, currentIndex: currentIndex);
      await audioPlayer.openPlaylist(
        tracks.asMediaList(),
        initialIndex: currentIndex,
        autoPlay: false,
      );
    }
  }

  Future<void> _updatePlayerState(
    AudioPlayerStateTableCompanion companion,
  ) async {
    final database = ref.read(appDatabaseProvider);

    await (database.update(
      database.audioPlayerStateTable,
    )..where((tb) => tb.id.equals(0))).write(companion);
  }

  Future<void> addTrackAtFirst(
    ToneHarborTrackObject track, {
    bool allowDuplicates = true,
  }) async {
    if (state.tracks.length == 1) {
      return addTrack(track);
    }

    if (!allowDuplicates &&
        state.tracks.any((element) => _compareTracks(element, track))) {
      return;
    }

    final insertIndex = max(state.currentIndex, 0) + 1;
    final newTracks = [
      ...state.tracks.sublist(0, insertIndex),
      track,
      ...state.tracks.sublist(insertIndex),
    ];

    state = state.copyWith(tracks: newTracks);

    await audioPlayer.addTrackAt(ToneHarborMedia(track), insertIndex);

    await _updatePlayerState(
      AudioPlayerStateTableCompanion(
        tracks: Value(state.tracks),
        currentIndex: Value(max(state.currentIndex, 0)),
      ),
    );
  }

  Future<void> addTracksAtFirst(
    Iterable<ToneHarborTrackObject> tracks, {
    bool allowDuplicates = true,
  }) async {
    if (state.tracks.length == 1) {
      return addTracks(tracks);
    }

    final addableTracks = allowDuplicates
        ? tracks
        : tracks.where(
            (track) =>
                !state.tracks.any((element) => _compareTracks(element, track)),
          );

    final insertIndex = max(state.currentIndex, 0) + 1;
    final newTracks = [
      ...state.tracks.sublist(0, insertIndex),
      ...addableTracks,
      ...state.tracks.sublist(insertIndex),
    ];

    state = state.copyWith(tracks: newTracks);

    int i = 0;
    for (final track in addableTracks) {
      await audioPlayer.addTrackAt(ToneHarborMedia(track), insertIndex + i);
      i++;
    }

    await _updatePlayerState(
      AudioPlayerStateTableCompanion(
        tracks: Value(state.tracks),
        currentIndex: Value(max(state.currentIndex, 0)),
      ),
    );
  }

  Future<void> addTrack(ToneHarborTrackObject track) async {
    state = state.copyWith(tracks: [...state.tracks, track]);

    await audioPlayer.addTrack(ToneHarborMedia(track));

    await _updatePlayerState(
      AudioPlayerStateTableCompanion(
        tracks: Value(state.tracks),
        currentIndex: Value(max(state.currentIndex, 0)),
      ),
    );
  }

  Future<void> addTracks(Iterable<ToneHarborTrackObject> tracks) async {
    state = state.copyWith(tracks: [...state.tracks, ...tracks]);

    for (final track in tracks) {
      await audioPlayer.addTrack(ToneHarborMedia(track));
    }

    await _updatePlayerState(
      AudioPlayerStateTableCompanion(
        tracks: Value(state.tracks),
        currentIndex: Value(max(state.currentIndex, 0)),
      ),
    );
  }

  Future<void> removeTrack(String trackId, {int? index}) async {
    final removeIndex =
        index ?? state.tracks.indexWhere((element) => element.id == trackId);

    if (removeIndex == -1 || removeIndex >= state.tracks.length) return;

    final newTracks = state.tracks.toList()..removeAt(removeIndex);

    final newCurrentIndex = removeIndex <= state.currentIndex
        ? max(state.currentIndex - 1, 0)
        : min(state.currentIndex, newTracks.length - 1);

    state = state.copyWith(tracks: newTracks, currentIndex: newCurrentIndex);

    await audioPlayer.removeTrack(removeIndex);

    await _updatePlayerState(
      AudioPlayerStateTableCompanion(
        tracks: Value(state.tracks),
        currentIndex: Value(state.currentIndex),
      ),
    );
  }

  Future<void> removeAllTracksById(String trackId) async {
    final removeIndexes = state.tracks
        .asMap()
        .entries
        .where((entry) => entry.value.id == trackId)
        .map((entry) => entry.key)
        .toList();

    if (removeIndexes.isEmpty) return;

    removeIndexes.sort((a, b) => b.compareTo(a));

    final newTracks = state.tracks.toList();
    for (final removeIndex in removeIndexes) {
      newTracks.removeAt(removeIndex);
    }

    final removedBeforeCurrent = removeIndexes
        .where((i) => i < state.currentIndex)
        .length;
    final newCurrentIndex = newTracks.isEmpty
        ? 0
        : max(state.currentIndex - removedBeforeCurrent, 0);

    state = state.copyWith(tracks: newTracks, currentIndex: newCurrentIndex);

    for (final removeIndex in removeIndexes) {
      await audioPlayer.removeTrack(removeIndex);
    }

    await _updatePlayerState(
      AudioPlayerStateTableCompanion(
        tracks: Value(state.tracks),
        currentIndex: Value(state.currentIndex),
      ),
    );
  }

  Future<void> removeTracks(Set<String> trackIdSet) async {
    final removeIndexes = <int>[];
    for (var i = 0; i < state.tracks.length; i++) {
      if (trackIdSet.contains(state.tracks[i].id)) {
        removeIndexes.add(i);
      }
    }

    if (removeIndexes.isEmpty) return;

    removeIndexes.sort((a, b) => b.compareTo(a));

    final newTracks = state.tracks.toList();
    for (final removeIndex in removeIndexes) {
      newTracks.removeAt(removeIndex);
    }

    final removedBeforeCurrent = removeIndexes
        .where((i) => i < state.currentIndex)
        .length;
    final newCurrentIndex = newTracks.isEmpty
        ? 0
        : max(state.currentIndex - removedBeforeCurrent, 0);

    state = state.copyWith(tracks: newTracks, currentIndex: newCurrentIndex);

    for (final removeIndex in removeIndexes) {
      await audioPlayer.removeTrack(removeIndex);
    }

    await _updatePlayerState(
      AudioPlayerStateTableCompanion(
        tracks: Value(state.tracks),
        currentIndex: Value(state.currentIndex),
      ),
    );
  }

  bool _compareTracks(ToneHarborTrackObject a, ToneHarborTrackObject b) {
    if (a.runtimeType != b.runtimeType) {
      return false;
    }

    return a is ToneHarborTrackObjectLocal && b is ToneHarborTrackObjectLocal
        ? a.path == b.path
        : a.id == b.id;
  }

  Future<void> load(
    List<ToneHarborTrackObject> tracks, {
    int initialIndex = 0,
    bool autoPlay = false,
  }) async {
    final medias = tracks.asMediaList();

    if (medias.isEmpty) return;

    logger.i(
      '[AudioPlayer] Loading ${medias.length} tracks, initialIndex: $initialIndex',
    );
    for (final media in medias) {
      logger.d('[AudioPlayer] Track: ${media.track.id} -> ${media.uri}');
    }

    state = state.copyWith(
      tracks: medias.map((media) => media.track).toList(),
      currentIndex: initialIndex,
    );

    logger.i(
      '[AudioPlayer] State updated, tracks count: ${state.tracks.length}',
    );

    await audioPlayer.openPlaylist(
      medias,
      initialIndex: initialIndex,
      autoPlay: autoPlay,
    );

    await _updatePlayerState(
      AudioPlayerStateTableCompanion(
        tracks: Value(state.tracks),
        currentIndex: Value(max(state.currentIndex, 0)),
      ),
    );
  }

  Future<void> swapActiveSource() async {
    if (state.tracks.isEmpty) {
      return;
    }

    final oldState = state;
    await audioPlayer.stop();

    await load(
      oldState.tracks,
      initialIndex: oldState.currentIndex,
      autoPlay: true,
    );
    state = state.copyWith(
      loopMode: oldState.loopMode,
      playing: oldState.playing,
      shuffled: false,
    );
    await audioPlayer.setLoopMode(oldState.loopMode);
    await _updatePlayerState(
      AudioPlayerStateTableCompanion(
        tracks: Value(state.tracks),
        currentIndex: Value(state.currentIndex),
        loopMode: Value(state.loopMode),
        playing: Value(state.playing),
        shuffled: Value(state.shuffled),
      ),
    );
  }

  Future<void> jumpToTrack(ToneHarborTrackObject track) async {
    final index = state.tracks.toList().indexWhere(
      (element) => element.id == track.id,
    );
    if (index == -1) return;
    await audioPlayer.jumpTo(index);
  }

  Future<void> moveTrack(int oldIndex, int newIndex) async {
    if (oldIndex == newIndex ||
        newIndex < 0 ||
        oldIndex < 0 ||
        newIndex > state.tracks.length - 1 ||
        oldIndex > state.tracks.length - 1) {
      return;
    }

    await audioPlayer.moveTrack(oldIndex, newIndex);
  }

  Future<void> stop() async {
    state = state.copyWith(
      tracks: [],
      currentIndex: 0,
      loopMode: PlaylistMode.none,
      playing: false,
      shuffled: false,
    );
    await audioPlayer.stop();
    await _updatePlayerState(
      AudioPlayerStateTableCompanion(
        tracks: Value(state.tracks),
        currentIndex: const Value(0),
        loopMode: const Value(PlaylistMode.none),
        playing: const Value(false),
        shuffled: const Value(false),
      ),
    );
  }
}
