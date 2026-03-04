import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart' hide Track;
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/services/audio_player/playback_state.dart';
import 'package:toneharbor/init/initialized.dart';

class MobileAudioService extends BaseAudioHandler {
  AudioSession? session;
  final Ref ref;
  final List<StreamSubscription> _subscriptions = [];

  MobileAudioService(this.ref);

  ToneHarborAudioPlayer get _player => ref.read(audioPlayerProvider);

  Future<void> init() async {
    final s = await AudioSession.instance;
    session = s;
    await session?.configure(const AudioSessionConfiguration.music());

    bool wasPausedByBeginEvent = false;

    _subscriptions.add(
      s.interruptionEventStream.listen((event) async {
        if (event.begin) {
          switch (event.type) {
            case AudioInterruptionType.duck:
              await _player.setVolume(0.5);
              break;
            case AudioInterruptionType.pause:
            case AudioInterruptionType.unknown:
              wasPausedByBeginEvent = _player.isPlaying;
              await _player.pause();
              break;
          }
        } else {
          switch (event.type) {
            case AudioInterruptionType.duck:
              await _player.setVolume(1.0);
              break;
            case AudioInterruptionType.pause when wasPausedByBeginEvent:
            case AudioInterruptionType.unknown when wasPausedByBeginEvent:
              await _player.resume();
              wasPausedByBeginEvent = false;
              break;
            default:
              break;
          }
        }
      }),
    );

    _subscriptions.add(
      s.becomingNoisyEventStream.listen((_) {
        _player.pause();
      }),
    );

    _subscriptions.add(
      _player.playerStateStream.listen((state) async {
        if (state == AudioPlaybackState.playing) {
          await session?.setActive(true);
        }
        playbackState.add(await _transformEvent());
      }),
    );

    _subscriptions.add(
      _player.positionStream.listen((pos) async {
        playbackState.add(await _transformEvent());
      }),
    );

    _subscriptions.add(
      _player.bufferedPositionStream.listen((pos) async {
        playbackState.add(await _transformEvent());
      }),
    );
  }

  void addItem(MediaItem item) {
    session?.setActive(true);
    mediaItem.add(item);
  }

  @override
  Future<void> play() => _player.resume();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> setShuffleMode(AudioServiceShuffleMode shuffleMode) async {
    await super.setShuffleMode(shuffleMode);
    await _player.setShuffle(shuffleMode == AudioServiceShuffleMode.all);
  }

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    await super.setRepeatMode(repeatMode);
    await _player.setLoopMode(switch (repeatMode) {
      AudioServiceRepeatMode.all || AudioServiceRepeatMode.group =>
        PlaylistMode.loop,
      AudioServiceRepeatMode.one => PlaylistMode.single,
      _ => PlaylistMode.none,
    });
  }

  @override
  Future<void> stop() async {
    await ref.read(playlistProvider.notifier).stop();
  }

  @override
  Future<void> skipToNext() async {
    await _player.skipToNext();
    await super.skipToNext();
  }

  @override
  Future<void> skipToPrevious() async {
    await _player.skipToPrevious();
    await super.skipToPrevious();
  }

  @override
  Future<void> onTaskRemoved() async {
    await _player.pause();
    if (Platform.isAndroid) exit(0);
  }

  Future<PlaybackState> _transformEvent() async {
    try {
      return PlaybackState(
        controls: [
          MediaControl.skipToPrevious,
          _player.isPlaying ? MediaControl.pause : MediaControl.play,
          MediaControl.skipToNext,
          MediaControl.stop,
        ],
        systemActions: {
          MediaAction.seek,
        },
        androidCompactActionIndices: const [0, 1, 2],
        playing: _player.isPlaying,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        shuffleMode: _player.isShuffled
            ? AudioServiceShuffleMode.all
            : AudioServiceShuffleMode.none,
        repeatMode: switch (_player.loopMode) {
          PlaylistMode.loop => AudioServiceRepeatMode.all,
          PlaylistMode.single => AudioServiceRepeatMode.one,
          _ => AudioServiceRepeatMode.none,
        },
        processingState: _player.isBuffering
            ? AudioProcessingState.loading
            : AudioProcessingState.ready,
      );
    } catch (e, stack) {
      logger.e('Transform event error', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> dispose() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    _subscriptions.clear();
    await session?.setActive(false);
  }
}
