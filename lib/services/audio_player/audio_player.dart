import 'package:media_kit/media_kit.dart' hide Track;
import 'package:flutter/foundation.dart';
import 'custom_player.dart';
import 'dart:async';

import 'package:media_kit/media_kit.dart' as mk;

import 'playback_state.dart';

part 'audio_players_streams_mixin.dart';
part 'audio_player_impl.dart';

abstract class AudioPlayerInterface {
  final CustomPlayer _mkPlayer;

  AudioPlayerInterface()
      : _mkPlayer = CustomPlayer(
          configuration: const mk.PlayerConfiguration(
            title: "ToneHarbor",
            logLevel: kDebugMode ? mk.MPVLogLevel.info : mk.MPVLogLevel.error,
            async: true,
          ),
        );

  Duration get duration {
    return _mkPlayer.state.duration;
  }

  Playlist get playlist {
    return _mkPlayer.state.playlist;
  }

  Duration get position {
    return _mkPlayer.state.position;
  }

  Duration get bufferedPosition {
    return _mkPlayer.state.buffer;
  }

  Future<mk.AudioDevice> get selectedDevice async {
    return _mkPlayer.state.audioDevice;
  }

  Future<List<mk.AudioDevice>> get devices async {
    return _mkPlayer.state.audioDevices;
  }

  bool get hasSource {
    return _mkPlayer.state.playlist.medias.isNotEmpty;
  }

  bool get isPlaying {
    return _mkPlayer.state.playing;
  }

  bool get isPaused {
    return !_mkPlayer.state.playing;
  }

  bool get isStopped {
    return !hasSource;
  }

  Future<bool> get isCompleted async {
    return _mkPlayer.state.completed;
  }

  bool get isShuffled {
    return _mkPlayer.shuffled;
  }

  PlaylistMode get loopMode {
    return _mkPlayer.state.playlistMode;
  }

  double get volume {
    return _mkPlayer.state.volume / 100;
  }

  bool get isBuffering {
    return _mkPlayer.state.buffering;
  }
}
