import 'dart:async';
import 'package:media_kit/media_kit.dart';
import 'package:flutter/foundation.dart';
import 'playback_state.dart';

class CustomPlayer extends Player {
  final StreamController<AudioPlaybackState> _playerStateStream;

  late final List<StreamSubscription> _subscriptions;

  Timer? _fadeTimer;
  double _savedVolume = 1.0;
  bool _isFading = false;
  Completer<void>? _fadeCompleter;

  static const _fadeDuration = Duration(milliseconds: 300);
  static const _fadeInterval = Duration(milliseconds: 16);

  CustomPlayer({super.configuration})
    : _playerStateStream = StreamController.broadcast() {
    nativePlayer.setProperty("network-timeout", "120");

    _subscriptions = [
      stream.buffering.listen((event) {
        _playerStateStream.add(AudioPlaybackState.buffering);
      }),
      stream.playing.listen((playing) {
        if (playing) {
          _playerStateStream.add(AudioPlaybackState.playing);
        } else {
          _playerStateStream.add(AudioPlaybackState.paused);
        }
      }),
      stream.completed.listen((isCompleted) {
        if (!isCompleted) return;
        _playerStateStream.add(AudioPlaybackState.completed);
      }),
      stream.playlist.listen((event) {
        if (event.medias.isEmpty) {
          _playerStateStream.add(AudioPlaybackState.stopped);
        }
      }),
      stream.error.listen((event) {
        debugPrint('[MediaKitError] \n$event');
      }),
    ];
  }

  bool get shuffled => state.shuffle;

  Stream<AudioPlaybackState> get playerStateStream => _playerStateStream.stream;
  Stream<bool> get shuffleStream => stream.shuffle;

  Stream<int> get indexChangeStream {
    int oldIndex = state.playlist.index;
    return stream.playlist.map((event) => event.index).where((newIndex) {
      if (newIndex != oldIndex) {
        oldIndex = newIndex;
        return true;
      }
      return false;
    });
  }

  @override
  Future<void> setShuffle(bool shuffle) async {
    await super.setShuffle(shuffle);
  }

  @override
  Future<void> stop() async {
    await super.stop();
    _playerStateStream.add(AudioPlaybackState.stopped);
  }

  @override
  Future<void> dispose() async {
    _cancelFade();
    for (var element in _subscriptions) {
      element.cancel();
    }
    await _playerStateStream.close();
    return super.dispose();
  }

  NativePlayer get nativePlayer => platform as NativePlayer;

  Future<void> insert(int index, Media media) async {
    final addedMediaCompleter = Completer<int>();
    StreamSubscription<Playlist>? playlistStream;

    try {
      playlistStream = stream.playlist.listen((event) {
        final mediaAddedIndex = event.medias.lastIndexWhere(
          (m) => m.uri == media.uri,
        );
        if (mediaAddedIndex != -1 && !addedMediaCompleter.isCompleted) {
          addedMediaCompleter.complete(mediaAddedIndex);
        }
      });

      await add(media);

      final mediaAddedIndex = await addedMediaCompleter.future.timeout(
        const Duration(seconds: 5),
        onTimeout: () => -1,
      );

      if (mediaAddedIndex == -1) {
        return;
      }

      await move(mediaAddedIndex, index);
    } finally {
      await playlistStream?.cancel();
    }
  }

  Future<void> setAudioNormalization(bool normalize) async {
    if (normalize) {
      await nativePlayer.setProperty('af', 'dynaudnorm=g=5:f=250:r=0.9:p=0.5');
    } else {
      await nativePlayer.setProperty('af', '');
    }
  }

  Future<void> setDemuxerBufferSize(int sizeInBytes) async {
    await nativePlayer.setProperty('demuxer-max-bytes', sizeInBytes.toString());
    await nativePlayer.setProperty(
      'demuxer-max-back-bytes',
      sizeInBytes.toString(),
    );
  }

  Future<void> playWithFadeIn() async {
    if (_isFading) return;
    final currentVolume = state.volume / 100;
    _savedVolume = currentVolume > 0 ? currentVolume : 1.0;
    await setVolume(0);
    await play();
    await _fadeIn(_savedVolume);
  }

  Future<void> pauseWithFadeOut() async {
    if (_isFading) return;
    _savedVolume = state.volume / 100;
    await _fadeOut();
    await pause();
    await setVolume(_savedVolume * 100);
  }

  Future<void> crossfadeToNext() async {
    if (_isFading) return;
    _savedVolume = state.volume / 100;
    await _fadeOut();
    await next();
    await _fadeIn(_savedVolume);
  }

  Future<void> crossfadeToPrevious() async {
    if (_isFading) return;
    _savedVolume = state.volume / 100;
    await _fadeOut();
    await previous();
    await _fadeIn(_savedVolume);
  }

  void _cancelFade() {
    _fadeTimer?.cancel();
    _fadeTimer = null;
    if (_fadeCompleter != null && !_fadeCompleter!.isCompleted) {
      _fadeCompleter!.complete();
    }
    _fadeCompleter = null;
    _isFading = false;
  }

  Future<void> _fadeIn(double target) async {
    return _fadeVolume(startVolume: 0, targetVolume: target);
  }

  Future<void> _fadeOut() async {
    final startVolume = state.volume / 100;
    return _fadeVolume(startVolume: startVolume, targetVolume: 0);
  }

  Future<void> _fadeVolume({
    required double startVolume,
    required double targetVolume,
  }) async {
    _cancelFade();
    _isFading = true;
    _fadeCompleter = Completer<void>();

    final steps = _fadeDuration.inMilliseconds ~/ _fadeInterval.inMilliseconds;
    if (steps <= 0 || startVolume == targetVolume) {
      await setVolume(targetVolume * 100);
      _isFading = false;
      _fadeCompleter!.complete();
      _fadeCompleter = null;
      return;
    }

    final volumeDelta = (targetVolume - startVolume) / steps;
    var currentStep = 0;

    _fadeTimer = Timer.periodic(_fadeInterval, (timer) {
      currentStep++;
      final vol = (startVolume + volumeDelta * currentStep).clamp(0.0, 1.0);
      setVolume(vol * 100);
      if (currentStep >= steps) {
        timer.cancel();
        _fadeTimer = null;
        _isFading = false;
        _fadeCompleter?.complete();
        _fadeCompleter = null;
      }
    });

    return _fadeCompleter!.future;
  }
}
