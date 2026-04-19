// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_playlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritePlaylistStateNotifier)
final favoritePlaylistStateProvider = FavoritePlaylistStateNotifierProvider._();

final class FavoritePlaylistStateNotifierProvider
    extends
        $NotifierProvider<
          FavoritePlaylistStateNotifier,
          FavoritePlaylistState
        > {
  FavoritePlaylistStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritePlaylistStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritePlaylistStateNotifierHash();

  @$internal
  @override
  FavoritePlaylistStateNotifier create() => FavoritePlaylistStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoritePlaylistState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoritePlaylistState>(value),
    );
  }
}

String _$favoritePlaylistStateNotifierHash() =>
    r'eacb3ac0c33139af821d539630d418ba11b19c23';

abstract class _$FavoritePlaylistStateNotifier
    extends $Notifier<FavoritePlaylistState> {
  FavoritePlaylistState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FavoritePlaylistState, FavoritePlaylistState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FavoritePlaylistState, FavoritePlaylistState>,
              FavoritePlaylistState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
