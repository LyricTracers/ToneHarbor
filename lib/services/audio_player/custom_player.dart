import 'dart:async';
import 'package:media_kit/media_kit.dart';
import 'package:flutter/foundation.dart';
import 'playback_state.dart';

class CustomPlayer extends Player {
  final StreamController<AudioPlaybackState> _playerStateStream;

  late final List<StreamSubscription> _subscriptions;

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
    for (var element in _subscriptions) {
      element.cancel();
    }
    await _playerStateStream.close();
    return super.dispose();
  }

  NativePlayer get nativePlayer => platform as NativePlayer;

  Future<void> insert(int index, Media media) async {
    final addedMediaCompleter = Completer<int>();
    final playlistStream = stream.playlist.listen((event) {
      final mediaAddedIndex = event.medias.indexWhere(
        (m) => m.uri == media.uri,
      );
      if (mediaAddedIndex != -1 && !addedMediaCompleter.isCompleted) {
        addedMediaCompleter.complete(mediaAddedIndex);
      }
    });
    try {
      await add(media);
      final mediaAddedIndex = await addedMediaCompleter.future;
      await move(mediaAddedIndex, index);
    } finally {
      playlistStream.cancel();
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
}
