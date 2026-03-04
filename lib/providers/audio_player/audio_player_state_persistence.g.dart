// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_state_persistence.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AudioPlayerStatePersistence)
final audioPlayerStatePersistenceProvider =
    AudioPlayerStatePersistenceProvider._();

final class AudioPlayerStatePersistenceProvider
    extends
        $AsyncNotifierProvider<
          AudioPlayerStatePersistence,
          AudioPlayerPersistedState
        > {
  AudioPlayerStatePersistenceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioPlayerStatePersistenceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioPlayerStatePersistenceHash();

  @$internal
  @override
  AudioPlayerStatePersistence create() => AudioPlayerStatePersistence();
}

String _$audioPlayerStatePersistenceHash() =>
    r'68695ce830e5dd494337cc8d26544c194a9c5c8e';

abstract class _$AudioPlayerStatePersistence
    extends $AsyncNotifier<AudioPlayerPersistedState> {
  FutureOr<AudioPlayerPersistedState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<AudioPlayerPersistedState>,
              AudioPlayerPersistedState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<AudioPlayerPersistedState>,
                AudioPlayerPersistedState
              >,
              AsyncValue<AudioPlayerPersistedState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
