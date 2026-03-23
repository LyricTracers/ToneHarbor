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
    extends $AsyncNotifierProvider<LocalSongs, SongListResponse> {
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

String _$localSongsHash() => r'e73adf27a4405df200144d9a6babadbbf235fd8c';

abstract class _$LocalSongs extends $AsyncNotifier<SongListResponse> {
  FutureOr<SongListResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SongListResponse>, SongListResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SongListResponse>, SongListResponse>,
              AsyncValue<SongListResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
