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
      Duration? keepAliveDuration,
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
              Duration? keepAliveDuration,
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
      keepAliveDuration: argument.keepAliveDuration,
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

String _$artistsHash() => r'6292abef5863edda0a0780f4989ef362b0f953c3';

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
            Duration? keepAliveDuration,
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
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => ArtistsProvider._(
    argument: (
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'artistsProvider';
}

@ProviderFor(searchArtists)
final searchArtistsProvider = SearchArtistsFamily._();

final class SearchArtistsProvider
    extends
        $FunctionalProvider<
          AsyncValue<ArtistResponse>,
          ArtistResponse,
          FutureOr<ArtistResponse>
        >
    with $FutureModifier<ArtistResponse>, $FutureProvider<ArtistResponse> {
  SearchArtistsProvider._({
    required SearchArtistsFamily super.from,
    required ({
      String filter,
      String library,
      int limit,
      int offset,
      String sortBy,
      String sortDirection,
      Duration? cacheDuration,
      Duration? keepAliveDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'searchArtistsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchArtistsHash();

  @override
  String toString() {
    return r'searchArtistsProvider'
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
              String filter,
              String library,
              int limit,
              int offset,
              String sortBy,
              String sortDirection,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return searchArtists(
      ref,
      filter: argument.filter,
      library: argument.library,
      limit: argument.limit,
      offset: argument.offset,
      sortBy: argument.sortBy,
      sortDirection: argument.sortDirection,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchArtistsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchArtistsHash() => r'3ea8f087b9cdc43a860315d1ee0796e2ed78d16e';

final class SearchArtistsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ArtistResponse>,
          ({
            String filter,
            String library,
            int limit,
            int offset,
            String sortBy,
            String sortDirection,
            Duration? cacheDuration,
            Duration? keepAliveDuration,
          })
        > {
  SearchArtistsFamily._()
    : super(
        retry: null,
        name: r'searchArtistsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchArtistsProvider call({
    required String filter,
    String library = 'all',
    int limit = 5000,
    int offset = 0,
    String sortBy = 'name',
    String sortDirection = 'asc',
    Duration? cacheDuration = const Duration(minutes: 5),
    Duration? keepAliveDuration,
  }) => SearchArtistsProvider._(
    argument: (
      filter: filter,
      library: library,
      limit: limit,
      offset: offset,
      sortBy: sortBy,
      sortDirection: sortDirection,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'searchArtistsProvider';
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

String _$artistsStateHash() => r'54531294956292974b27a0fb68c821919157e9ea';

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
