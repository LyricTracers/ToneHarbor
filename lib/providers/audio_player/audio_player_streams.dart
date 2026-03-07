import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/audio_player_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
import 'package:toneharbor/providers/audio_player/preload_track_provider.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/services/audio_services/audio_services.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/utils/base_funs.dart';

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
    String lastPreloadedTrack = "";
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

        if (nextTrack == null || lastPreloadedTrack == nextTrack.id) {
          return;
        }

        if (nextTrack is ToneHarborTrackObjectLocal) {
          lastPreloadedTrack = nextTrack.id;
          logger.i('[Preload] Skip local track: ${nextTrack.title}');
          return;
        }

        final isCached = await isTrackCached(nextTrack);
        if (isCached) {
          lastPreloadedTrack = nextTrack.id;
          logger.i('[Preload] Track already cached: ${nextTrack.title}');
          return;
        }

        final isPreloading = ref
            .read(preloadTrackProvider.notifier)
            .isPreloading(nextTrack.id);
        if (isPreloading) {
          logger.i('[Preload] Track already preloading: ${nextTrack.title}');
          return;
        }

        logger.i(
          '[Preload] Preloading next track: ${nextTrack.title} (${nextTrack.id})',
        );

        await ref
            .read(preloadTrackProvider.notifier)
            .preloadNextTrack(nextTrack);

        lastPreloadedTrack = nextTrack.id;
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

    ref.read(preloadTrackProvider.notifier).cancelAllPreloads();

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
