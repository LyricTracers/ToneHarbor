// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaylistResponseNotifier)
final playlistResponseProvider = PlaylistResponseNotifierFamily._();

final class PlaylistResponseNotifierProvider
    extends
        $AsyncNotifierProvider<PlaylistResponseNotifier, PlaylistListResponse> {
  PlaylistResponseNotifierProvider._({
    required PlaylistResponseNotifierFamily super.from,
    required ({
      int limit,
      int offset,
      String library,
      String sortBy,
      String sortDirection,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'playlistResponseProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playlistResponseNotifierHash();

  @override
  String toString() {
    return r'playlistResponseProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  PlaylistResponseNotifier create() => PlaylistResponseNotifier();

  @override
  bool operator ==(Object other) {
    return other is PlaylistResponseNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playlistResponseNotifierHash() =>
    r'76ae547985c765b25a8636022d93d52e5886638e';

final class PlaylistResponseNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PlaylistResponseNotifier,
          AsyncValue<PlaylistListResponse>,
          PlaylistListResponse,
          FutureOr<PlaylistListResponse>,
          ({
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
          })
        > {
  PlaylistResponseNotifierFamily._()
    : super(
        retry: null,
        name: r'playlistResponseProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlaylistResponseNotifierProvider call({
    int limit = 100,
    int offset = 0,
    String library = 'all',
    String sortBy = '',
    String sortDirection = 'ASC',
  }) => PlaylistResponseNotifierProvider._(
    argument: (
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
    ),
    from: this,
  );

  @override
  String toString() => r'playlistResponseProvider';
}

abstract class _$PlaylistResponseNotifier
    extends $AsyncNotifier<PlaylistListResponse> {
  late final _$args =
      ref.$arg
          as ({
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
          });
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  String get library => _$args.library;
  String get sortBy => _$args.sortBy;
  String get sortDirection => _$args.sortDirection;

  FutureOr<PlaylistListResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'all',
    String sortBy = '',
    String sortDirection = 'ASC',
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<PlaylistListResponse>, PlaylistListResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PlaylistListResponse>,
                PlaylistListResponse
              >,
              AsyncValue<PlaylistListResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        limit: _$args.limit,
        offset: _$args.offset,
        library: _$args.library,
        sortBy: _$args.sortBy,
        sortDirection: _$args.sortDirection,
      ),
    );
  }
}

@ProviderFor(PlaylistStateNotifier)
final playlistStateProvider = PlaylistStateNotifierProvider._();

final class PlaylistStateNotifierProvider
    extends $NotifierProvider<PlaylistStateNotifier, void> {
  PlaylistStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistStateNotifierHash();

  @$internal
  @override
  PlaylistStateNotifier create() => PlaylistStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$playlistStateNotifierHash() =>
    r'd47638e8824ad1de04b0a215d19b018490f570d6';

abstract class _$PlaylistStateNotifier extends $Notifier<void> {
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
