import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audio_service/audio_service.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/services/audio_services/mobile_audio_service.dart';
import 'package:toneharbor/services/audio_services/windows_audio_service.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
import 'dart:io';

class AudioServices with WidgetsBindingObserver {
  final MobileAudioService? mobile;
  final WindowsAudioService? smtc;

  AudioServices(this.mobile, this.smtc) {
    WidgetsBinding.instance.addObserver(this);
  }

  static Future<AudioServices> create(
    Ref ref,
    PlaylistNotifier playback,
  ) async {
    final mobile =
        Platform.isAndroid ||
            Platform.isIOS ||
            Platform.isMacOS ||
            Platform.isLinux
        ? await AudioService.init(
            builder: () => MobileAudioService(playback),
            config: AudioServiceConfig(
              androidNotificationChannelId: 'com.toneharbor.app',
              androidNotificationChannelName: 'ToneHarbor',
              androidNotificationOngoing: false,
              androidStopForegroundOnPause: false,
              androidNotificationChannelDescription:
                  'ToneHarbor Media Controls',
            ),
          )
        : null;

    final smtc = Platform.isWindows ? WindowsAudioService(ref, playback) : null;

    return AudioServices(mobile, smtc);
  }

  Future<void> addTrack(Song track) async {
    await smtc?.addTrack(track);
    mobile?.addItem(
      MediaItem(
        id: track.id,
        album: track.additional?.songTag?.album ?? '',
        title: track.title,
        artist: track.additional?.songTag?.artist ?? '',
        duration: Duration(
          milliseconds: track.additional?.songAudio?.duration ?? 0,
        ),
        artUri: null,
        playable: true,
      ),
    );
  }

  void activateSession() {
    mobile?.session?.setActive(true);
  }

  void deactivateSession() {
    mobile?.session?.setActive(false);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        deactivateSession();
        audioPlayer.pause();
        break;
      default:
        break;
    }
  }

  void dispose() {
    mobile?.dispose();
    smtc?.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
