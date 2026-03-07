// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preload_track_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PreloadTrack)
final preloadTrackProvider = PreloadTrackProvider._();

final class PreloadTrackProvider extends $NotifierProvider<PreloadTrack, void> {
  PreloadTrackProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preloadTrackProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preloadTrackHash();

  @$internal
  @override
  PreloadTrack create() => PreloadTrack();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$preloadTrackHash() => r'71ff74145589cf8178cb784bb8ec5281135fccdd';

abstract class _$PreloadTrack extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
