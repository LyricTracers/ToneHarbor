import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
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

  List<Song> get _tracks => ref.read(playlistProvider);

  StreamSubscription subscribeToPlaylist() {
    return audioPlayer.currentIndexChangedStream.listen((index) async {
      try {
        final activeTrack = _tracks.elementAtOrNull(index);
        if (activeTrack != null && notificationService != null) {
          await notificationService!.addTrack(activeTrack);
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
    for (final subscription in subscriptions) {
      subscription.cancel();
    }
    subscriptions.clear();
    notificationService?.dispose();
    notificationService = null;
  }
}

final audioPlayerStreamListenersProvider = Provider<AudioPlayerStreamListeners>(
  AudioPlayerStreamListeners.new,
);
