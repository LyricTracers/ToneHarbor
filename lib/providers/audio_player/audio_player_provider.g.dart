// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
        isAutoDispose: false,
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

String _$playlistNotifierHash() => r'23cbdce33c1ffbff275d4b2b0e82a5724f5acbb4';

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

String _$isPlayingHash() => r'968cf57ff2275097ca46ea11309f091c5b683358';

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

String _$loopModeHash() => r'a3f3ede5da53630087edd147aa7d14265b5ef409';

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

String _$isShuffledHash() => r'5dfc707113a9c96f93ad58b21dfbeef8958bc255';

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

String _$currentIndexHash() => r'8e45ea86ce6d84dff40b42898d915baa0eadc0db';

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

String _$activeTrackHash() => r'9a7978a91dbacaa7eb9c933c6de9242c99bdcb43';

@ProviderFor(collections)
final collectionsProvider = CollectionsProvider._();

final class CollectionsProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  CollectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionsHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return collections(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$collectionsHash() => r'2bb6c99e7388ec6b249c6563c7e2089b28f5e639';

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

String _$positionStreamHash() => r'445bc16bb021193aafc213bfc007b3d83f8c6e55';

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

String _$durationStreamHash() => r'460e236b8f5625e3c0263b8e2fe9a96821c8121f';

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
    r'6e377ea261e2398b090e8a327c1f7f981c13c771';

@ProviderFor(bufferingPercentageStream)
final bufferingPercentageStreamProvider = BufferingPercentageStreamProvider._();

final class BufferingPercentageStreamProvider
    extends $FunctionalProvider<AsyncValue<double>, double, Stream<double>>
    with $FutureModifier<double>, $StreamProvider<double> {
  BufferingPercentageStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bufferingPercentageStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bufferingPercentageStreamHash();

  @$internal
  @override
  $StreamProviderElement<double> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<double> create(Ref ref) {
    return bufferingPercentageStream(ref);
  }
}

String _$bufferingPercentageStreamHash() =>
    r'44257b6707577b90da7fd8b389c4a5caf82667c7';

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

String _$playingStreamHash() => r'a95a15057c5f0b53b4c88c90c885917c5d031347';

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

String _$loopModeStreamHash() => r'cea39ace361da12e46147fd6d01193c50014fcdc';

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

String _$indexChangeStreamHash() => r'0a402309bc383accf2d5fe917eb2afb52a1ae8b8';
