import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/providers/server/server_provider.dart';

part 'audio_player_provider.g.dart';

@keepAlive
ToneHarborAudioPlayer audioPlayer(Ref ref) {
  final player = ToneHarborAudioPlayer();

  ref.onDispose(() {
    player.dispose();
  });

  return player;
}

@riverpod
class PlaylistNotifier extends _$PlaylistNotifier {
  @override
  List<Song> build() {
    return [];
  }

  ToneHarborAudioPlayer get _player => ref.read(audioPlayerProvider);

  List<Song> get _tracks => state;

  set _tracks(List<Song> value) {
    state = List.unmodifiable(value);
  }

  Future<void> loadPlaylist(List<Song> songs, {int initialIndex = 0}) async {
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

    await _player.openPlaylist(medias, initialIndex: initial);

    _tracks = songs;
    state = _tracks;
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
    state = _tracks;
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
    state = _tracks;
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

    _tracks = [..._tracks]..insert(insertIndex, song);
    state = _tracks;
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
    state = _tracks;
  }

  Future<void> removeTrack(int index) async {
    if (index < 0 || index >= _tracks.length) return;

    await _player.removeTrack(index);

    _tracks = [..._tracks]..removeAt(index);
    state = _tracks;
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
    state = _tracks;
  }

  Future<void> moveTrack(int oldIndex, int newIndex) async {
    if (oldIndex < 0 || oldIndex >= _tracks.length) return;
    if (newIndex < 0 || newIndex >= _tracks.length) return;
    if (oldIndex == newIndex) return;

    await _player.moveTrack(oldIndex, newIndex);

    final track = _tracks[oldIndex];
    _tracks = [..._tracks]
      ..removeAt(oldIndex)
      ..insert(newIndex, track);
    state = _tracks;
  }

  Future<void> clearPlaylist() async {
    await _player.clearPlaylist();
    _tracks = [];
    state = _tracks;
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
