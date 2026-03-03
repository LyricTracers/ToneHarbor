import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/providers/audio_station/download_provider.dart';

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
  List<Song> _tracks = [];

  @override
  List<Song> build() {
    return _tracks;
  }

  ToneHarborAudioPlayer get _player => ref.read(audioPlayerProvider);

  Future<void> loadPlaylist(List<Song> songs, {int initialIndex = 0}) async {
    _tracks = songs;
    state = _tracks;

    final medias = songs.map((song) async {
      final streamUrl = await ref.read(streamUrlProvider(id: song.id).future);
      return Media(
        streamUrl,
        extras: {
          'id': song.id,
          'title': song.title,
          'album': song.additional?.songTag?.album,
          'artist': song.additional?.songTag?.artist,
        },
      );
    }).toList();

    await _player.openPlaylist(
      await Future.wait(medias),
      initialIndex: initialIndex,
    );
  }

  Future<void> play() async {
    await _player.resume();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> stop() async {
    await _player.stop();
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

  Future<void> setLoopMode(PlaylistMode loopMode) async {
    await _player.setLoopMode(loopMode);
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }

  Future<void> addTrack(Song song) async {
    _tracks = [..._tracks, song];
    state = _tracks;

    final media = Media(
      song.path,
      extras: {
        'id': song.id,
        'title': song.title,
        'album': song.additional?.songTag?.album,
        'artist': song.additional?.songTag?.artist,
      },
    );
    await _player.addTrack(media);
  }

  Future<void> removeTrack(int index) async {
    _tracks = [..._tracks]..removeAt(index);
    state = _tracks;
    await _player.removeTrack(index);
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
