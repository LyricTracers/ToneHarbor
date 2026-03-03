import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audio_service/audio_service.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/services/audio_services/mobile_audio_service.dart';
import 'package:toneharbor/init/initialized.dart';

class AudioServices with WidgetsBindingObserver {
  final MobileAudioService? mobile;
  final Ref ref;

  AudioServices(this.mobile, this.ref) {
    WidgetsBinding.instance.addObserver(this);
  }

  static Future<AudioServices> create(Ref ref) async {
    final mobile = await AudioService.init(
      builder: () => MobileAudioService(ref),
      config: AudioServiceConfig(
        androidNotificationChannelId: 'com.toneharbor.app',
        androidNotificationChannelName: 'ToneHarbor',
        androidNotificationOngoing: false,
        androidStopForegroundOnPause: false,
        androidNotificationChannelDescription: 'ToneHarbor Media Controls',
      ),
    );

    await mobile.init();

    return AudioServices(mobile, ref);
  }

  Future<void> addTrack(Song track) async {
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
        ref.read(audioPlayerProvider).pause();
        break;
      default:
        break;
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
