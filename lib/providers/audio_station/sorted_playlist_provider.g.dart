// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sorted_playlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SortedPlaylist)
final sortedPlaylistProvider = SortedPlaylistFamily._();

final class SortedPlaylistProvider
    extends $NotifierProvider<SortedPlaylist, SortedPlaylistState> {
  SortedPlaylistProvider._({
    required SortedPlaylistFamily super.from,
    required $AsyncNotifierProvider<
      ExtraProvider<PlaylistListResponse>,
      PlaylistListResponse
    >
    super.argument,
  }) : super(
         retry: null,
         name: r'sortedPlaylistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sortedPlaylistHash();

  @override
  String toString() {
    return r'sortedPlaylistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SortedPlaylist create() => SortedPlaylist();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SortedPlaylistState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SortedPlaylistState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SortedPlaylistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sortedPlaylistHash() => r'b34cc010f0937fe4bbf0b7cb430f43ee5cfc2073';

final class SortedPlaylistFamily extends $Family
    with
        $ClassFamilyOverride<
          SortedPlaylist,
          SortedPlaylistState,
          SortedPlaylistState,
          SortedPlaylistState,
          $AsyncNotifierProvider<
            ExtraProvider<PlaylistListResponse>,
            PlaylistListResponse
          >
        > {
  SortedPlaylistFamily._()
    : super(
        retry: null,
        name: r'sortedPlaylistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SortedPlaylistProvider call({
    required $AsyncNotifierProvider<
      ExtraProvider<PlaylistListResponse>,
      PlaylistListResponse
    >
    baseProvider,
  }) => SortedPlaylistProvider._(argument: baseProvider, from: this);

  @override
  String toString() => r'sortedPlaylistProvider';
}

abstract class _$SortedPlaylist extends $Notifier<SortedPlaylistState> {
  late final _$args =
      ref.$arg
          as $AsyncNotifierProvider<
            ExtraProvider<PlaylistListResponse>,
            PlaylistListResponse
          >;
  $AsyncNotifierProvider<
    ExtraProvider<PlaylistListResponse>,
    PlaylistListResponse
  >
  get baseProvider => _$args;

  SortedPlaylistState build({
    required $AsyncNotifierProvider<
      ExtraProvider<PlaylistListResponse>,
      PlaylistListResponse
    >
    baseProvider,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SortedPlaylistState, SortedPlaylistState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SortedPlaylistState, SortedPlaylistState>,
              SortedPlaylistState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(baseProvider: _$args));
  }
}
