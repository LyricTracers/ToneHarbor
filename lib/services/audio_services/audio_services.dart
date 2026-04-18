import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audio_service/audio_service.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/services/audio_services/mobile_audio_service.dart';
import 'package:toneharbor/services/audio_services/windows_audio_service.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/init/initialized.dart';
import 'dart:io';

class AudioServices with WidgetsBindingObserver {
  final MobileAudioService? mobile;
  final WindowsAudioService? smtc;

  AudioServices(this.mobile, this.smtc) {
    WidgetsBinding.instance.addObserver(this);
  }

  static Future<AudioServices> create(
    Ref ref,
    AudioPlayerStateNotifier playback,
  ) async {
    logger.i(
      '[AudioServices] Creating AudioServices for platform: ${Platform.operatingSystem}',
    );
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
    logger.i(
      '[AudioServices] AudioServices created, mobile: ${mobile != null}, smtc: ${smtc != null}',
    );

    return AudioServices(mobile, smtc);
  }

  Future<void> addMedia(Media media) async {
    logger.i(
      '[AudioServices] addMedia called: ${media.title} by ${media.artist}',
    );
    await smtc?.addMedia(media);
    await mobile?.addItem(
      MediaItem(
        id: media.id,
        album: media.album,
        title: media.title,
        artist: media.artist,
        duration: Duration(microseconds: media.durationMs),
        artUri: Uri.parse(media.getCoverUrl()),
        playable: true,
      ),
    );
    logger.i('[AudioServices] addMedia completed: mobile=${mobile != null}');
  }

  void activateSession() {
    mobile?.session?.setActive(true);
  }

  void deactivateSession() {
    mobile?.session?.setActive(false);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
        deactivateSession();
        try {
          await audioPlayer.dispose();
        } catch (e) {
          logger.e('Error during player dispose on app exit: $e');
        }
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
