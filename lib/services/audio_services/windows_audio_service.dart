import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smtc_windows/smtc_windows.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/services/audio_player/playback_state.dart';

class WindowsAudioService {
  final SMTCWindows smtc;
  final Ref ref;
  final PlaylistNotifier playlistNotifier;

  final subscriptions = <StreamSubscription>[];

  WindowsAudioService(this.ref, this.playlistNotifier)
    : smtc = SMTCWindows(enabled: false) {
    smtc.setPlaybackStatus(PlaybackStatus.stopped);
    final buttonStream = smtc.buttonPressStream.listen((event) {
      switch (event) {
        case PressedButton.play:
          audioPlayer.resume();
          break;
        case PressedButton.pause:
          audioPlayer.pause();
          break;
        case PressedButton.next:
          audioPlayer.skipToNext();
          break;
        case PressedButton.previous:
          audioPlayer.skipToPrevious();
          break;
        case PressedButton.stop:
          playlistNotifier.stop();
          break;
        default:
          break;
      }
    });

    final playerStateStream = audioPlayer.playerStateStream.listen((
      state,
    ) async {
      switch (state) {
        case AudioPlaybackState.playing:
          await smtc.setPlaybackStatus(PlaybackStatus.playing);
          break;
        case AudioPlaybackState.paused:
          await smtc.setPlaybackStatus(PlaybackStatus.paused);
          break;
        case AudioPlaybackState.stopped:
          await smtc.setPlaybackStatus(PlaybackStatus.stopped);
          break;
        case AudioPlaybackState.completed:
          await smtc.setPlaybackStatus(PlaybackStatus.changing);
          break;
        default:
          break;
      }
    });

    final positionStream = audioPlayer.positionStream.listen((pos) async {
      await smtc.setPosition(pos);
    });

    final durationStream = audioPlayer.durationStream.listen((duration) async {
      await smtc.setEndTime(duration);
    });

    subscriptions.addAll([
      buttonStream,
      playerStateStream,
      positionStream,
      durationStream,
    ]);
  }

  Future<void> addTrackMedia(
    String title,
    String? album,
    String? artist,
    int? duration,
    String? artUri,
  ) async {
    if (!smtc.enabled) {
      await smtc.enableSmtc();
    }
    await smtc.updateMetadata(
      MusicMetadata(
        title: title,
        albumArtist: artist ?? "Unknown",
        artist: artist ?? "Unknown",
        album: album ?? "Unknown",
        thumbnail: artUri,
      ),
    );
  }

  void dispose() {
    smtc.disableSmtc();
    smtc.dispose();
    for (var element in subscriptions) {
      element.cancel();
    }
  }
}
