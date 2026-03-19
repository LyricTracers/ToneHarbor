// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_selection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SongSelection)
final songSelectionProvider = SongSelectionProvider._();

final class SongSelectionProvider
    extends $NotifierProvider<SongSelection, SongSelectionState> {
  SongSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songSelectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songSelectionHash();

  @$internal
  @override
  SongSelection create() => SongSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SongSelectionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SongSelectionState>(value),
    );
  }
}

String _$songSelectionHash() => r'd8f9feeb1cb1f355c2acdb3e11176e02e3fac56f';

abstract class _$SongSelection extends $Notifier<SongSelectionState> {
  SongSelectionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SongSelectionState, SongSelectionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SongSelectionState, SongSelectionState>,
              SongSelectionState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
