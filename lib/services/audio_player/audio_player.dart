import 'dart:io';

import 'package:media_kit/media_kit.dart' hide Track;
import 'package:flutter/foundation.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'custom_player.dart';
import 'dart:async';

import 'package:media_kit/media_kit.dart' as mk;

import 'playback_state.dart';
import 'package:toneharbor/init/initialized.dart';

part 'audio_players_streams_mixin.dart';
part 'audio_player_impl.dart';

class ToneHarborMedia extends mk.Media {
  static int serverPort = 0;

  static String get host =>
      Platform.isWindows ? "localhost" : InternetAddress.loopbackIPv4.address;
  final ToneHarborTrackObject track;

  ToneHarborMedia(this.track)
    : super(
        track is ToneHarborTrackObjectLocal
            ? track.path
            : getStreamUrl(track.id),
        extras: track.toJson(),
      );
  static String get baseUrl => "http://$host:$serverPort";
  static String getStreamUrl(String songId) {
    if (serverPort == 0) {
      logger.w('[ToneHarborMedia] Server port is 0, stream URL may not work!');
    }
    return "$baseUrl/stream/$songId";
  }

  factory ToneHarborMedia.media(Media media) {
    assert(media.extras != null, "[Media] must have extra metadata set");
    return ToneHarborMedia(ToneHarborTrackObject.fromJson(media.extras!));
  }

  static String getCoverUrl(
    String songId,
    String albumName,
    String artistName,
  ) {
    if (songId.isEmpty) {
      if (albumName.isEmpty && artistName.isNotEmpty) {
        return "$baseUrl/cover-artist/${Uri.encodeComponent(artistName)}";
      }
      return "$baseUrl/cover-album/${Uri.encodeComponent(albumName)}/${Uri.encodeComponent(artistName)}";
    }
    return "$baseUrl/cover/$songId";
  }
}

extension MediaCoverExtension on Media {
  String getCoverUrl() {
    return ToneHarborMedia.getCoverUrl(id, album, artist);
  }

  String get id {
    return extras?["id"] as String? ?? "";
  }

  String get title {
    return extras?["title"] as String? ?? "";
  }

  String get artist {
    return extras?["artist"] as String? ?? "";
  }

  String get album {
    return extras?["album"] as String? ?? "";
  }

  int get durationMs {
    final durationValue = extras?["duration"];
    if (durationValue is int) {
      return durationValue;
    } else if (durationValue is Duration) {
      return durationValue.inMicroseconds;
    }
    return 0;
  }
}

abstract class AudioPlayerInterface {
  final CustomPlayer _mkPlayer;

  AudioPlayerInterface()
    : _mkPlayer = CustomPlayer(
        configuration: const mk.PlayerConfiguration(
          title: "ToneHarbor",
          logLevel: kDebugMode ? mk.MPVLogLevel.info : mk.MPVLogLevel.error,
          async: true,
        ),
      ) {
    _mkPlayer.stream.error.listen((event) {
      logger.e('[MediaKitError] $event');
    });
    _mkPlayer.stream.log.listen((info) {
      logger.i(info);
    });
  }

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

  bool get isCompleted {
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
