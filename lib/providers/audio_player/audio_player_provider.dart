import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/providers/server/server_provider.dart';
import 'package:toneharbor/providers/audio_player/audio_player_state_persistence.dart';
import 'package:toneharbor/providers/audio_player/playback_history_provider.dart';
import 'package:toneharbor/services/audio_services/audio_services.dart';

part 'audio_player_provider.g.dart';

@keepAlive
ToneHarborAudioPlayer audioPlayer(Ref ref) {
  final player = ToneHarborAudioPlayer();

  ref.onDispose(() {
    player.dispose();
  });

  return player;
}

@keepAlive
Future<AudioServices> audioServices(Ref ref) async {
  return AudioServices.create(ref);
}

@riverpod
class PlaylistNotifier extends _$PlaylistNotifier {
  List<String> _collections = [];
  List<String> get collections => _collections;

  @override
  List<Song> build() {
    _syncSavedState();
    _subscribeToStreams();
    return [];
  }

  ToneHarborAudioPlayer get _player => ref.read(audioPlayerProvider);

  List<Song> get _tracks => state;

  set _tracks(List<Song> value) {
    state = List.unmodifiable(value);
  }

  Future<void> _syncSavedState() async {
    try {
      final persistedState = await ref
          .read(audioPlayerStatePersistenceProvider.notifier)
          .build();

      if (persistedState.tracks.isNotEmpty) {
        _collections = persistedState.collections;
        await _player.setLoopMode(persistedState.loopMode);
        await _player.setShuffle(persistedState.shuffled);

        final medias = persistedState.tracks.map((song) {
          return Media(
            ToneHarborMedia.getStreamUrl(song.id),
            extras: {
              'id': song.id,
              'title': song.title,
              'album': song.additional?.songTag?.album,
              'artist': song.additional?.songTag?.artist,
            },
          );
        }).toList();

        await _player.openPlaylist(
          medias,
          initialIndex: persistedState.currentIndex.clamp(
            0,
            persistedState.tracks.length - 1,
          ),
          autoPlay: false,
        );

        _tracks = persistedState.tracks;
      }
    } catch (e, stack) {
      logger.e('Failed to sync saved state', error: e, stackTrace: stack);
    }
  }

  void _subscribeToStreams() {
    String? lastScrobbledId;
    final subscriptions = [
      _player.playingStream.listen((playing) async {
        try {
          await ref
              .read(audioPlayerStatePersistenceProvider.notifier)
              .savePlaying(playing);
        } catch (e, stack) {
          logger.e('Failed to save playing state', error: e, stackTrace: stack);
        }
      }),
      _player.loopModeStream.listen((loopMode) async {
        try {
          await ref
              .read(audioPlayerStatePersistenceProvider.notifier)
              .saveLoopMode(loopMode);
        } catch (e, stack) {
          logger.e('Failed to save loop mode', error: e, stackTrace: stack);
        }
      }),
      _player.shuffledStream.listen((shuffled) async {
        try {
          await ref
              .read(audioPlayerStatePersistenceProvider.notifier)
              .saveShuffled(shuffled);
        } catch (e, stack) {
          logger.e(
            'Failed to save shuffled state',
            error: e,
            stackTrace: stack,
          );
        }
      }),
      _player.playlistStream.listen((playlist) async {
        try {
          await ref
              .read(audioPlayerStatePersistenceProvider.notifier)
              .saveTracks(_tracks, playlist.index);

          final activeTrack = _tracks.elementAtOrNull(playlist.index);
          if (activeTrack != null) {
            final audioServicesAsync = ref.read(audioServicesProvider);
            if (audioServicesAsync.hasValue) {
              await audioServicesAsync.value?.addTrack(activeTrack);
            }
          }
        } catch (e, stack) {
          logger.e('Failed to save tracks', error: e, stackTrace: stack);
        }
      }),
      _player.positionStream.listen((position) async {
        try {
          await _preloadNextTrack(position);
          await _handleScrobble(position, lastScrobbledId, (id) {
            lastScrobbledId = id;
          });
        } catch (e, stack) {
          logger.e(
            'Failed to preload/handle scrobble',
            error: e,
            stackTrace: stack,
          );
        }
      }),
    ];

    ref.onDispose(() {
      for (final subscription in subscriptions) {
        subscription.cancel();
      }
    });
  }

  Future<void> _handleScrobble(
    Duration position,
    String? lastScrobbledId,
    void Function(String?) setLastScrobbledId,
  ) async {
    final duration = _player.duration;
    if (duration == Duration.zero || position == Duration.zero) return;

    final activeTrack = _tracks.elementAtOrNull(_player.currentIndex);
    if (activeTrack == null) return;

    if (lastScrobbledId == activeTrack.id) return;

    final minimumListenTime = (duration.inSeconds / 2).clamp(0, 240);
    if (position.inSeconds < minimumListenTime) return;

    await ref
        .read(playbackHistoryProvider.notifier)
        .addTrack(activeTrack, playDurationMs: position.inMilliseconds);

    setLastScrobbledId(activeTrack.id);
  }

  Future<void> _preloadNextTrack(Duration position) async {
    final duration = _player.duration;
    if (duration == Duration.zero) return;

    final percentProgress =
        (position.inMilliseconds / duration.inMilliseconds) * 100;

    if (percentProgress < 80) return;

    final currentIndex = _player.currentIndex;
    if (currentIndex == -1 || currentIndex >= _tracks.length - 1) return;

    final nextTrack = _tracks.elementAtOrNull(currentIndex + 1);
    if (nextTrack == null) return;

    // Preload next track by requesting stream URL early
    final streamUrl = ToneHarborMedia.getStreamUrl(nextTrack.id);
    logger.d('Preloading next track: ${nextTrack.title} - $streamUrl');
  }

  Future<void> loadPlaylist(
    List<Song> songs, {
    int initialIndex = 0,
    bool autoPlay = false,
  }) async {
    if (songs.isEmpty) return;

    final initial = initialIndex.clamp(0, songs.length - 1);

    final medias = songs.map((song) {
      return Media(
        ToneHarborMedia.getStreamUrl(song.id),
        extras: {
          'id': song.id,
          'title': song.title,
          'album': song.additional?.songTag?.album,
          'artist': song.additional?.songTag?.artist,
        },
      );
    }).toList();

    await _player.openPlaylist(
      medias,
      initialIndex: initial,
      autoPlay: autoPlay,
    );

    _tracks = songs;
    _collections = [];

    await ref
        .read(audioPlayerStatePersistenceProvider.notifier)
        .saveTracks(songs, initial);
  }

  Future<void> play() async {
    await _player.resume();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> stop() async {
    await _player.clearPlaylist();
    _tracks = [];
    _collections = [];
    await ref.read(audioPlayerStatePersistenceProvider.notifier).clearState();
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  Future<void> skipToNext() async {
    await _player.skipToNext();
  }

  Future<void> skipToPrevious() async {
    await _player.skipToPrevious();
  }

  Future<void> jumpTo(int index) async {
    await _player.jumpTo(index);
  }

  Future<void> jumpToTrack(Song track) async {
    final index = _tracks.indexWhere((t) => t.id == track.id);
    if (index == -1) return;
    await _player.jumpTo(index);
  }

  Future<void> setShuffle(bool shuffle) async {
    await _player.setShuffle(shuffle);
  }

  Future<void> toggleShuffle() async {
    final currentShuffle = _player.isShuffled;
    await _player.setShuffle(!currentShuffle);
  }

  Future<void> setLoopMode(PlaylistMode loopMode) async {
    await _player.setLoopMode(loopMode);
  }

  Future<void> toggleLoopMode() async {
    final currentMode = _player.loopMode;
    final nextMode = switch (currentMode) {
      PlaylistMode.none => PlaylistMode.loop,
      PlaylistMode.loop => PlaylistMode.single,
      PlaylistMode.single => PlaylistMode.none,
    };
    await _player.setLoopMode(nextMode);
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }

  Future<void> addTrack(Song song) async {
    final media = Media(
      ToneHarborMedia.getStreamUrl(song.id),
      extras: {
        'id': song.id,
        'title': song.title,
        'album': song.additional?.songTag?.album,
        'artist': song.additional?.songTag?.artist,
      },
    );
    await _player.addTrack(media);

    _tracks = [..._tracks, song];

    await ref
        .read(audioPlayerStatePersistenceProvider.notifier)
        .saveTracks(_tracks, _player.currentIndex);
  }

  Future<void> addTrackAt(Song song, int index) async {
    final insertIndex = index.clamp(0, _tracks.length);

    final media = Media(
      ToneHarborMedia.getStreamUrl(song.id),
      extras: {
        'id': song.id,
        'title': song.title,
        'album': song.additional?.songTag?.album,
        'artist': song.additional?.songTag?.artist,
      },
    );
    await _player.addTrackAt(media, insertIndex);

    final newTracks = [..._tracks];
    newTracks.insert(insertIndex, song);
    _tracks = newTracks;

    await ref
        .read(audioPlayerStatePersistenceProvider.notifier)
        .saveTracks(_tracks, _player.currentIndex);
  }

  Future<void> addTracks(List<Song> songs) async {
    if (songs.isEmpty) return;

    for (final song in songs) {
      final media = Media(
        ToneHarborMedia.getStreamUrl(song.id),
        extras: {
          'id': song.id,
          'title': song.title,
          'album': song.additional?.songTag?.album,
          'artist': song.additional?.songTag?.artist,
        },
      );
      await _player.addTrack(media);
    }

    _tracks = [..._tracks, ...songs];

    await ref
        .read(audioPlayerStatePersistenceProvider.notifier)
        .saveTracks(_tracks, _player.currentIndex);
  }

  Future<void> addTracksAtFirst(List<Song> songs) async {
    if (songs.isEmpty) return;
    if (_tracks.length <= 1) {
      await addTracks(songs);
      return;
    }

    final insertStartIndex = (_player.currentIndex + 1).clamp(
      0,
      _tracks.length,
    );

    for (var i = 0; i < songs.length; i++) {
      final song = songs[i];
      final media = Media(
        ToneHarborMedia.getStreamUrl(song.id),
        extras: {
          'id': song.id,
          'title': song.title,
          'album': song.additional?.songTag?.album,
          'artist': song.additional?.songTag?.artist,
        },
      );
      await _player.addTrackAt(media, insertStartIndex + i);
    }

    final newTracks = [..._tracks];
    newTracks.insertAll(insertStartIndex, songs);
    _tracks = newTracks;

    await ref
        .read(audioPlayerStatePersistenceProvider.notifier)
        .saveTracks(_tracks, _player.currentIndex);
  }

  Future<void> removeTrack(int index) async {
    if (index < 0 || index >= _tracks.length) return;

    await _player.removeTrack(index);

    final newTracks = [..._tracks];
    newTracks.removeAt(index);
    _tracks = newTracks;

    await ref
        .read(audioPlayerStatePersistenceProvider.notifier)
        .saveTracks(_tracks, _player.currentIndex);
  }

  Future<void> removeTracks(List<int> indexes) async {
    if (indexes.isEmpty) return;

    final validIndexes = indexes
        .where((i) => i >= 0 && i < _tracks.length)
        .toList();
    if (validIndexes.isEmpty) return;

    final sortedIndexes = validIndexes.toList()..sort((a, b) => b.compareTo(a));

    for (final index in sortedIndexes) {
      await _player.removeTrack(index);
    }

    final indexSet = validIndexes.toSet();
    _tracks = _tracks
        .asMap()
        .entries
        .where((e) => !indexSet.contains(e.key))
        .map((e) => e.value)
        .toList();

    await ref
        .read(audioPlayerStatePersistenceProvider.notifier)
        .saveTracks(_tracks, _player.currentIndex);
  }

  Future<void> moveTrack(int oldIndex, int newIndex) async {
    if (oldIndex < 0 || oldIndex >= _tracks.length) return;
    if (newIndex < 0 || newIndex >= _tracks.length) return;
    if (oldIndex == newIndex) return;

    await _player.moveTrack(oldIndex, newIndex);

    final track = _tracks[oldIndex];
    final newTracks = [..._tracks];
    newTracks.removeAt(oldIndex);
    newTracks.insert(newIndex, track);
    _tracks = newTracks;

    await ref
        .read(audioPlayerStatePersistenceProvider.notifier)
        .saveTracks(_tracks, _player.currentIndex);
  }

  Future<void> clearPlaylist() async {
    await _player.clearPlaylist();
    _tracks = [];
    _collections = [];
    await ref.read(audioPlayerStatePersistenceProvider.notifier).clearState();
  }

  // Collection management
  Future<void> addCollections(List<String> collectionIds) async {
    _collections = [..._collections, ...collectionIds];
    await ref
        .read(audioPlayerStatePersistenceProvider.notifier)
        .saveCollections(_collections);
  }

  Future<void> addCollection(String collectionId) async {
    await addCollections([collectionId]);
  }

  Future<void> removeCollections(List<String> collectionIds) async {
    _collections = _collections
        .where((id) => !collectionIds.contains(id))
        .toList();
    await ref
        .read(audioPlayerStatePersistenceProvider.notifier)
        .saveCollections(_collections);
  }

  Future<void> removeCollection(String collectionId) async {
    await removeCollections([collectionId]);
  }

  bool containsCollection(String collectionId) {
    return _collections.contains(collectionId);
  }

  bool containsTrack(Song track) {
    return _tracks.any((t) => t.id == track.id);
  }
}

@riverpod
bool isPlaying(Ref ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.isPlaying;
}

@riverpod
PlaylistMode loopMode(Ref ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.loopMode;
}

@riverpod
bool isShuffled(Ref ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.isShuffled;
}

@riverpod
int currentIndex(Ref ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.currentIndex;
}

@riverpod
Song? activeTrack(Ref ref) {
  final tracks = ref.watch(playlistProvider);
  final player = ref.watch(audioPlayerProvider);
  final index = player.currentIndex;
  if (index < 0 || index >= tracks.length) return null;
  return tracks[index];
}

@riverpod
List<String> collections(Ref ref) {
  return ref.watch(playlistProvider.notifier).collections;
}

@riverpod
Stream<Duration> positionStream(Ref ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.positionStream;
}

@riverpod
Stream<Duration> durationStream(Ref ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.durationStream;
}

@riverpod
Stream<Duration> bufferedPositionStream(Ref ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.bufferedPositionStream;
}

@riverpod
Stream<bool> playingStream(Ref ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.playingStream;
}

@riverpod
Stream<PlaylistMode> loopModeStream(Ref ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.loopModeStream;
}

@riverpod
Stream<int> indexChangeStream(Ref ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.currentIndexChangedStream;
}
