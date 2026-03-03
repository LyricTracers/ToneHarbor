// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(audioPlayer)
final audioPlayerProvider = AudioPlayerProvider._();

final class AudioPlayerProvider
    extends
        $FunctionalProvider<
          ToneHarborAudioPlayer,
          ToneHarborAudioPlayer,
          ToneHarborAudioPlayer
        >
    with $Provider<ToneHarborAudioPlayer> {
  AudioPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioPlayerHash();

  @$internal
  @override
  $ProviderElement<ToneHarborAudioPlayer> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ToneHarborAudioPlayer create(Ref ref) {
    return audioPlayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToneHarborAudioPlayer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToneHarborAudioPlayer>(value),
    );
  }
}

String _$audioPlayerHash() => r'21fd7ee4ef101920ee390c87f83c4515d9be2dd2';

@ProviderFor(PlaylistNotifier)
final playlistProvider = PlaylistNotifierProvider._();

final class PlaylistNotifierProvider
    extends $NotifierProvider<PlaylistNotifier, List<Song>> {
  PlaylistNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistNotifierHash();

  @$internal
  @override
  PlaylistNotifier create() => PlaylistNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Song> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Song>>(value),
    );
  }
}

String _$playlistNotifierHash() => r'8c15d8ebb852bbe08f58c205cea5e356ae269914';

abstract class _$PlaylistNotifier extends $Notifier<List<Song>> {
  List<Song> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Song>, List<Song>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Song>, List<Song>>,
              List<Song>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(isPlaying)
final isPlayingProvider = IsPlayingProvider._();

final class IsPlayingProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsPlayingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isPlayingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isPlayingHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isPlaying(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isPlayingHash() => r'2eb6b2f31a49267d108830f30bc31bc6029c5873';

@ProviderFor(loopMode)
final loopModeProvider = LoopModeProvider._();

final class LoopModeProvider
    extends $FunctionalProvider<PlaylistMode, PlaylistMode, PlaylistMode>
    with $Provider<PlaylistMode> {
  LoopModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loopModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loopModeHash();

  @$internal
  @override
  $ProviderElement<PlaylistMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlaylistMode create(Ref ref) {
    return loopMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaylistMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaylistMode>(value),
    );
  }
}

String _$loopModeHash() => r'beb2926607f9ef8ccbe4fc7fd299ddf5753c5c52';

@ProviderFor(isShuffled)
final isShuffledProvider = IsShuffledProvider._();

final class IsShuffledProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsShuffledProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isShuffledProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isShuffledHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isShuffled(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isShuffledHash() => r'1e58cff410eaf96ad50278bfc96cf3dcd5ffe794';

@ProviderFor(currentIndex)
final currentIndexProvider = CurrentIndexProvider._();

final class CurrentIndexProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  CurrentIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentIndexHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return currentIndex(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentIndexHash() => r'1bcbd11528781398af7f663096de59b8b07bfdf2';

@ProviderFor(activeTrack)
final activeTrackProvider = ActiveTrackProvider._();

final class ActiveTrackProvider extends $FunctionalProvider<Song?, Song?, Song?>
    with $Provider<Song?> {
  ActiveTrackProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeTrackProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeTrackHash();

  @$internal
  @override
  $ProviderElement<Song?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Song? create(Ref ref) {
    return activeTrack(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Song? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Song?>(value),
    );
  }
}

String _$activeTrackHash() => r'db030bef46f10f0edf5509e0054a6574c71b2eb5';

@ProviderFor(positionStream)
final positionStreamProvider = PositionStreamProvider._();

final class PositionStreamProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  PositionStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'positionStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$positionStreamHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return positionStream(ref);
  }
}

String _$positionStreamHash() => r'037a7918a281af309d4aa0c7305393bce49a890e';

@ProviderFor(durationStream)
final durationStreamProvider = DurationStreamProvider._();

final class DurationStreamProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  DurationStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'durationStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$durationStreamHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return durationStream(ref);
  }
}

String _$durationStreamHash() => r'fba046fad63d95fae0cfcf3226d341d0d202ef10';

@ProviderFor(bufferedPositionStream)
final bufferedPositionStreamProvider = BufferedPositionStreamProvider._();

final class BufferedPositionStreamProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  BufferedPositionStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bufferedPositionStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bufferedPositionStreamHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return bufferedPositionStream(ref);
  }
}

String _$bufferedPositionStreamHash() =>
    r'56ef4043ba5c404ea53604fe9c5b942cf8141578';

@ProviderFor(playingStream)
final playingStreamProvider = PlayingStreamProvider._();

final class PlayingStreamProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  PlayingStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playingStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playingStreamHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return playingStream(ref);
  }
}

String _$playingStreamHash() => r'7f56d8a74a60da5b6057360c3fa479030b3e3eba';

@ProviderFor(loopModeStream)
final loopModeStreamProvider = LoopModeStreamProvider._();

final class LoopModeStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaylistMode>,
          PlaylistMode,
          Stream<PlaylistMode>
        >
    with $FutureModifier<PlaylistMode>, $StreamProvider<PlaylistMode> {
  LoopModeStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loopModeStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loopModeStreamHash();

  @$internal
  @override
  $StreamProviderElement<PlaylistMode> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PlaylistMode> create(Ref ref) {
    return loopModeStream(ref);
  }
}

String _$loopModeStreamHash() => r'62d858330e562ea1502df4e0373cff6ae273fb91';

@ProviderFor(indexChangeStream)
final indexChangeStreamProvider = IndexChangeStreamProvider._();

final class IndexChangeStreamProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  IndexChangeStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'indexChangeStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$indexChangeStreamHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return indexChangeStream(ref);
  }
}

String _$indexChangeStreamHash() => r'55e9cc47a7f7696ed8c0d8dc3b6639ef6165bbe5';
