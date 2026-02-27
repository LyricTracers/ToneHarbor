// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(artists)
final artistsProvider = ArtistsFamily._();

final class ArtistsProvider
    extends
        $FunctionalProvider<
          AsyncValue<ArtistResponse>,
          ArtistResponse,
          FutureOr<ArtistResponse>
        >
    with $FutureModifier<ArtistResponse>, $FutureProvider<ArtistResponse> {
  ArtistsProvider._({
    required ArtistsFamily super.from,
    required ({
      int limit,
      int offset,
      String library,
      String sortBy,
      String sortDirection,
      String additional,
      Duration? cacheDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'artistsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$artistsHash();

  @override
  String toString() {
    return r'artistsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<ArtistResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ArtistResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int limit,
              int offset,
              String library,
              String sortBy,
              String sortDirection,
              String additional,
              Duration? cacheDuration,
            });
    return artists(
      ref,
      limit: argument.limit,
      offset: argument.offset,
      library: argument.library,
      sortBy: argument.sortBy,
      sortDirection: argument.sortDirection,
      additional: argument.additional,
      cacheDuration: argument.cacheDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$artistsHash() => r'31b89aa1f1de203caca9ded802a4c75b14593828';

final class ArtistsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ArtistResponse>,
          ({
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
            String additional,
            Duration? cacheDuration,
          })
        > {
  ArtistsFamily._()
    : super(
        retry: null,
        name: r'artistsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ArtistsProvider call({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'ASC',
    String additional = 'avg_rating',
    Duration? cacheDuration = const Duration(minutes: 5),
  }) => ArtistsProvider._(
    argument: (
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      cacheDuration: cacheDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'artistsProvider';
}

@ProviderFor(ArtistsState)
final artistsStateProvider = ArtistsStateProvider._();

final class ArtistsStateProvider
    extends $NotifierProvider<ArtistsState, ArtistResponse?> {
  ArtistsStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'artistsStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$artistsStateHash();

  @$internal
  @override
  ArtistsState create() => ArtistsState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ArtistResponse? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ArtistResponse?>(value),
    );
  }
}

String _$artistsStateHash() => r'68582240cad49b70929e39fb8e3ed7e67b0d1d88';

abstract class _$ArtistsState extends $Notifier<ArtistResponse?> {
  ArtistResponse? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ArtistResponse?, ArtistResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ArtistResponse?, ArtistResponse?>,
              ArtistResponse?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
