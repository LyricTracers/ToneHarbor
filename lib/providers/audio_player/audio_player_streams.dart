import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
import 'package:toneharbor/providers/server/server_provider.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/services/audio_services/audio_services.dart';
import 'package:toneharbor/init/initialized.dart';

class AudioPlayerStreamListeners {
  final Ref ref;
  AudioServices? notificationService;
  final subscriptions = <StreamSubscription>[];

  AudioPlayerStreamListeners(this.ref) {
    AudioServices.create(
      ref,
      ref.read(playlistProvider.notifier),
    ).then((value) => notificationService = value);

    subscriptions.add(subscribeToPlaylist());

    ref.onDispose(dispose);
  }

  StreamSubscription subscribeToPlaylist() {
    return audioPlayer.playlistStream.listen((playlist) async {
      try {
        final activeMedia = playlist.medias.elementAtOrNull(playlist.index);
        logger.i(
          '[AudioPlayerStreamListeners] playlistStream received: ${playlist.index}, medias count: ${playlist.medias.length}',
        );

        if (activeMedia != null && notificationService != null) {
          final extras = activeMedia.extras;
          if (extras != null) {
            final album = extras['album'] as String?;
            final artist = extras['artist'] as String?;
            final duration = extras['duration'] as int?;
            final id = extras['id'] as String? ?? '';
            final title = extras['title'] as String? ?? '';

            String? artUri;
            if (album != null &&
                artist != null &&
                ToneHarborMedia.serverPort > 0) {
              artUri =
                  'http://${ToneHarborMedia.host}:${ToneHarborMedia.serverPort}/cover/${Uri.encodeComponent(album)}/${Uri.encodeComponent(artist)}';
            }

            await notificationService!.addTrackMedia(
              id,
              title,
              album,
              artist,
              duration,
              artUri,
            );
            logger.i(
              '[AudioPlayerStreamListeners] track added to notification: $title, $id, artUri: ${artUri ?? "null"}',
            );
          }
        }
      } catch (e, stack) {
        logger.e(
          'Failed to add track to notification',
          error: e,
          stackTrace: stack,
        );
      }
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
