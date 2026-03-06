import 'dart:async';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/audio_player_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/services/audio_services/audio_services.dart';
import 'package:toneharbor/init/initialized.dart';

class AudioPlayerStreamListeners {
  final Ref ref;
  AudioServices? notificationService;
  final subscriptions = <StreamSubscription>[];
  AudioPlayerState get audioPlayerState => ref.read(audioPlayerStateProvider);
  AudioPlayerStreamListeners(this.ref) {
    AudioServices.create(
      ref,
      ref.read(audioPlayerStateProvider.notifier),
    ).then((value) => notificationService = value);

    subscriptions.add(subscribeToPlaylist());
    subscriptions.add(subscribeToPosition());
    subscriptions.add(subscribeToPlayerError());

    ref.onDispose(dispose);
  }

  StreamSubscription subscribeToPlaylist() {
    return audioPlayer.playlistStream.listen((mpvPlaylist) {
      try {
        if (mpvPlaylist.index < 0 ||
            mpvPlaylist.index >= mpvPlaylist.medias.length) {
          logger.e(
            "Invalid index: ${mpvPlaylist.index}, medias count: ${mpvPlaylist.medias.length}",
          );
          return;
        }
        final activeMedia = mpvPlaylist.medias.elementAtOrNull(
          mpvPlaylist.index,
        );
        if (activeMedia == null) {
          logger.e("Invalid media at index ${mpvPlaylist.index}");
          return;
        }
        notificationService?.addMedia(activeMedia);
      } catch (e, stack) {
        logger.e('Failed to add track', error: e, stackTrace: stack);
      }
    });
  }

  StreamSubscription subscribeToPosition() {
    String lastTrack = "";
    return audioPlayer.positionStream.listen((event) async {
      final percentProgress =
          (event.inSeconds / max(audioPlayer.duration.inSeconds, 1)) * 100;
      try {
        if (percentProgress < 80 ||
            audioPlayerState.currentIndex == -1 ||
            audioPlayerState.currentIndex ==
                audioPlayerState.tracks.length - 1) {
          return;
        }

        final nextTrack = audioPlayerState.tracks.elementAtOrNull(
          audioPlayerState.currentIndex + 1,
        );

        if (nextTrack == null ||
            lastTrack == nextTrack.id ||
            nextTrack is ToneHarborTrackObjectLocal) {
          return;
        }

        try {
          // await ref.read(
          //   sourcedTrackProvider(nextTrack as SpotubeFullTrackObject).future,
          // );
        } finally {
          lastTrack = nextTrack.id;
        }
      } catch (e, stack) {
        logger.e('Failed to preload next track', error: e, stackTrace: stack);
      }
    });
  }

  StreamSubscription subscribeToPlayerError() {
    return audioPlayer.errorStream.listen((event) {
      logger.e('[AudioPlayerStreamListeners] Player error: $event');
    });
  }

  void dispose() {
    logger.i('[AudioPlayerStreamListeners] dispose() called');
    for (final subscription in subscriptions) {
      subscription.cancel();
    }
    subscriptions.clear();
    notificationService?.dispose();
    notificationService = null;
    logger.i('[AudioPlayerStreamListeners] dispose() completed');
  }
}

final audioPlayerStreamListenersProvider = Provider<AudioPlayerStreamListeners>(
  AudioPlayerStreamListeners.new,
);
