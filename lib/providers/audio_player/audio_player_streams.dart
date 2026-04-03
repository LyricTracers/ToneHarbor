import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/models/audio_player/audio_player_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/services/audio_services/audio_services.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:tray_manager/tray_manager.dart';

class AudioPlayerStreamListeners {
  final Ref ref;
  AudioServices? notificationService;
  final subscriptions = <StreamSubscription>[];
  AudioPlayerState get audioPlayerState => ref.read(audioPlayerStateProvider);
  AudioPlayerStreamListeners(this.ref) {
    _init();

    ref.onDispose(dispose);
  }

  Future<void> _init() async {
    notificationService = await AudioServices.create(
      ref,
      ref.read(audioPlayerStateProvider.notifier),
    );

    subscriptions.add(subscribeToPlaylist());
    subscriptions.add(subscribeToPosition());
    subscriptions.add(subscribeToPlayerError());
    updateMusicPlayer();

    final currentPlaylist = audioPlayer.playlist;
    if (currentPlaylist.index >= 0 &&
        currentPlaylist.index < currentPlaylist.medias.length) {
      final activeMedia = currentPlaylist.medias[currentPlaylist.index];
      notificationService?.addMedia(activeMedia);
    }
  }

  void updateMusicPlayer() {
    if (Platform.isMacOS) {
      subscriptions.add(
        audioPlayer.playingStream.listen((data) {
          TrayManager.instance.updateMusicPlayerPlayState(data);
        }),
      );
    }
  }

  StreamSubscription subscribeToPlaylist() {
    return audioPlayer.playlistStream.listen((mpvPlaylist) {
      try {
        if (mpvPlaylist.index < 0 ||
            mpvPlaylist.index >= mpvPlaylist.medias.length) {
          logger.i(
            '[AudioPlayer] Invalid index: ${mpvPlaylist.index}, medias count: ${mpvPlaylist.medias.length}',
          );
          return;
        }
        final activeMedia = mpvPlaylist.medias.elementAtOrNull(
          mpvPlaylist.index,
        );
        if (activeMedia == null) {
          logger.i(
            '[AudioPlayer] Invalid media at index: ${mpvPlaylist.index}',
          );
          return;
        }
        notificationService?.addMedia(activeMedia);
        if (Platform.isMacOS) {
          TrayManager.instance.updateMusicPlayerInfo(
            activeMedia.title,
            activeMedia.artist,
          );
          final coverUrl = activeMedia.getCoverUrl();
          TrayManager.instance
              .updateMusicPlayerArtworkFromUrl(coverUrl)
              .catchError((e) {
                logger.w('[AudioPlayer] Failed to update artwork: $e');
              });
        }
      } catch (e, stack) {
        logger.e(
          '[AudioPlayer] Failed to add track',
          error: e,
          stackTrace: stack,
        );
      }
    });
  }

  StreamSubscription subscribeToPosition() {
    String lastPreloadedTrack = "";
    return audioPlayer.positionStream.listen((event) async {
      final percentProgress =
          (event.inSeconds / max(audioPlayer.duration.inSeconds, 1)) * 100;
      if (Platform.isMacOS) {
        TrayManager.instance.updateMusicPlayerProgress(
          event.inSeconds.toDouble(),
          audioPlayer.duration.inSeconds.toDouble(),
        );
      }
      try {
        if (percentProgress < 80 ||
            audioPlayerState.currentIndex == -1 ||
            audioPlayerState.loopMode == PlaylistMode.single) {
          return;
        }

        if (audioPlayerState.currentIndex ==
            audioPlayerState.tracks.length - 1) {
          return;
        }

        final nextTrack = audioPlayerState.tracks.elementAtOrNull(
          audioPlayerState.currentIndex + 1,
        );

        if (nextTrack == null) {
          return;
        }

        final quality = ref.read(audioQualityProvider);
        final preloadKey = '${nextTrack.id}_${quality.name}';

        if (lastPreloadedTrack == preloadKey) {
          return;
        }

        if (nextTrack.isLocal) {
          lastPreloadedTrack = preloadKey;
          logger.i('[AudioPlayer] Skip local track: ${nextTrack.title}');
          return;
        }

        final isCached = await isTrackCached(nextTrack, quality);
        if (isCached) {
          lastPreloadedTrack = preloadKey;
          logger.i('[AudioPlayer] Track already cached: ${nextTrack.title}');
          return;
        }

        final isDownloading = ref
            .read(downloadManagerProvider.notifier)
            .isDownloading(nextTrack.id);
        if (isDownloading) {
          logger.i(
            '[AudioPlayer] Track already downloading: ${nextTrack.title}',
          );
          return;
        }

        logger.i(
          '[AudioPlayer] Preloading next track: ${nextTrack.title} (${nextTrack.id}) at ${quality.name}',
        );

        await ref
            .read(downloadManagerProvider.notifier)
            .preloadNextTrack(nextTrack);

        lastPreloadedTrack = preloadKey;
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
