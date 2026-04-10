// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_songs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocalSongs)
final localSongsProvider = LocalSongsProvider._();

final class LocalSongsProvider
    extends $AsyncNotifierProvider<LocalSongs, ToneHarborTrackObjectList> {
  LocalSongsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localSongsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localSongsHash();

  @$internal
  @override
  LocalSongs create() => LocalSongs();
}

String _$localSongsHash() => r'c3017b613caf9c6822e99ef0d2facb8eb2200b8a';

abstract class _$LocalSongs extends $AsyncNotifier<ToneHarborTrackObjectList> {
  FutureOr<ToneHarborTrackObjectList> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ToneHarborTrackObjectList>,
              ToneHarborTrackObjectList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ToneHarborTrackObjectList>,
                ToneHarborTrackObjectList
              >,
              AsyncValue<ToneHarborTrackObjectList>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
