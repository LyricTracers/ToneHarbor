// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(albums)
final albumsProvider = AlbumsFamily._();

final class AlbumsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AlbumResponse>,
          AlbumResponse,
          FutureOr<AlbumResponse>
        >
    with $FutureModifier<AlbumResponse>, $FutureProvider<AlbumResponse> {
  AlbumsProvider._({
    required AlbumsFamily super.from,
    required ({
      int limit,
      int offset,
      String library,
      String sortBy,
      String sortDirection,
      String additional,
      String? artist,
      Duration? cacheDuration,
      Duration? keepAliveDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'albumsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$albumsHash();

  @override
  String toString() {
    return r'albumsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AlbumResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AlbumResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int limit,
              int offset,
              String library,
              String sortBy,
              String sortDirection,
              String additional,
              String? artist,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return albums(
      ref,
      limit: argument.limit,
      offset: argument.offset,
      library: argument.library,
      sortBy: argument.sortBy,
      sortDirection: argument.sortDirection,
      additional: argument.additional,
      artist: argument.artist,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$albumsHash() => r'0e0ce8959e167030fdf5e649bc9f792c5af4c3c6';

final class AlbumsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AlbumResponse>,
          ({
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
            String additional,
            String? artist,
            Duration? cacheDuration,
            Duration? keepAliveDuration,
          })
        > {
  AlbumsFamily._()
    : super(
        retry: null,
        name: r'albumsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AlbumsProvider call({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'asc',
    String additional = 'avg_rating',
    String? artist,
    Duration? cacheDuration,
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => AlbumsProvider._(
    argument: (
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      artist: artist,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'albumsProvider';
}

@ProviderFor(randomAlbums)
final randomAlbumsProvider = RandomAlbumsFamily._();

final class RandomAlbumsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AlbumResponse>,
          AlbumResponse,
          FutureOr<AlbumResponse>
        >
    with $FutureModifier<AlbumResponse>, $FutureProvider<AlbumResponse> {
  RandomAlbumsProvider._({
    required RandomAlbumsFamily super.from,
    required ({int limit, Duration? cacheDuration, Duration? keepAliveDuration})
    super.argument,
  }) : super(
         retry: null,
         name: r'randomAlbumsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$randomAlbumsHash();

  @override
  String toString() {
    return r'randomAlbumsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AlbumResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AlbumResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int limit,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return randomAlbums(
      ref,
      limit: argument.limit,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RandomAlbumsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$randomAlbumsHash() => r'ccd4baf129aa19d94681f50b1385c4e249cfa3dc';

final class RandomAlbumsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AlbumResponse>,
          ({int limit, Duration? cacheDuration, Duration? keepAliveDuration})
        > {
  RandomAlbumsFamily._()
    : super(
        retry: null,
        name: r'randomAlbumsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RandomAlbumsProvider call({
    int limit = 20,
    Duration? cacheDuration,
    Duration? keepAliveDuration,
  }) => RandomAlbumsProvider._(
    argument: (
      limit: limit,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'randomAlbumsProvider';
}

@ProviderFor(recentAlbums)
final recentAlbumsProvider = RecentAlbumsFamily._();

final class RecentAlbumsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AlbumResponse>,
          AlbumResponse,
          FutureOr<AlbumResponse>
        >
    with $FutureModifier<AlbumResponse>, $FutureProvider<AlbumResponse> {
  RecentAlbumsProvider._({
    required RecentAlbumsFamily super.from,
    required ({int limit, Duration? cacheDuration, Duration? keepAliveDuration})
    super.argument,
  }) : super(
         retry: null,
         name: r'recentAlbumsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recentAlbumsHash();

  @override
  String toString() {
    return r'recentAlbumsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AlbumResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AlbumResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int limit,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return recentAlbums(
      ref,
      limit: argument.limit,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RecentAlbumsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recentAlbumsHash() => r'3e5bdc576359727b52aed0935771a1cf413e6528';

final class RecentAlbumsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AlbumResponse>,
          ({int limit, Duration? cacheDuration, Duration? keepAliveDuration})
        > {
  RecentAlbumsFamily._()
    : super(
        retry: null,
        name: r'recentAlbumsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecentAlbumsProvider call({
    int limit = 20,
    Duration? cacheDuration = const Duration(days: 1),
    Duration? keepAliveDuration = const Duration(minutes: 20),
  }) => RecentAlbumsProvider._(
    argument: (
      limit: limit,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'recentAlbumsProvider';
}

@ProviderFor(artistAlbums)
final artistAlbumsProvider = ArtistAlbumsFamily._();

final class ArtistAlbumsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AlbumResponse>,
          AlbumResponse,
          FutureOr<AlbumResponse>
        >
    with $FutureModifier<AlbumResponse>, $FutureProvider<AlbumResponse> {
  ArtistAlbumsProvider._({
    required ArtistAlbumsFamily super.from,
    required ({
      String artist,
      int limit,
      Duration? cacheDuration,
      Duration? keepAliveDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'artistAlbumsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$artistAlbumsHash();

  @override
  String toString() {
    return r'artistAlbumsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AlbumResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AlbumResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String artist,
              int limit,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return artistAlbums(
      ref,
      artist: argument.artist,
      limit: argument.limit,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistAlbumsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$artistAlbumsHash() => r'c0f206cdb7505bbaafe675998f343ffb414b9fb1';

final class ArtistAlbumsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AlbumResponse>,
          ({
            String artist,
            int limit,
            Duration? cacheDuration,
            Duration? keepAliveDuration,
          })
        > {
  ArtistAlbumsFamily._()
    : super(
        retry: null,
        name: r'artistAlbumsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ArtistAlbumsProvider call({
    required String artist,
    int limit = 100,
    Duration? cacheDuration,
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => ArtistAlbumsProvider._(
    argument: (
      artist: artist,
      limit: limit,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'artistAlbumsProvider';
}

@ProviderFor(searchAlbums)
final searchAlbumsProvider = SearchAlbumsFamily._();

final class SearchAlbumsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AlbumResponse>,
          AlbumResponse,
          FutureOr<AlbumResponse>
        >
    with $FutureModifier<AlbumResponse>, $FutureProvider<AlbumResponse> {
  SearchAlbumsProvider._({
    required SearchAlbumsFamily super.from,
    required ({
      String filter,
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
         name: r'searchAlbumsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchAlbumsHash();

  @override
  String toString() {
    return r'searchAlbumsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AlbumResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AlbumResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String filter,
              int limit,
              int offset,
              String sortBy,
              String sortDirection,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return searchAlbums(
      ref,
      filter: argument.filter,
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
    return other is SearchAlbumsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchAlbumsHash() => r'6c204a2426303f5b41f11533d72aa0ed1c626829';

final class SearchAlbumsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AlbumResponse>,
          ({
            String filter,
            int limit,
            int offset,
            String sortBy,
            String sortDirection,
            Duration? cacheDuration,
            Duration? keepAliveDuration,
          })
        > {
  SearchAlbumsFamily._()
    : super(
        retry: null,
        name: r'searchAlbumsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SearchAlbumsProvider call({
    required String filter,
    int limit = 100,
    int offset = 0,
    String sortBy = 'name',
    String sortDirection = 'asc',
    Duration? cacheDuration = const Duration(minutes: 5),
    Duration? keepAliveDuration,
  }) => SearchAlbumsProvider._(
    argument: (
      filter: filter,
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
  String toString() => r'searchAlbumsProvider';
}

@ProviderFor(AlbumsState)
final albumsStateProvider = AlbumsStateProvider._();

final class AlbumsStateProvider
    extends $NotifierProvider<AlbumsState, AlbumResponse?> {
  AlbumsStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'albumsStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$albumsStateHash();

  @$internal
  @override
  AlbumsState create() => AlbumsState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AlbumResponse? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AlbumResponse?>(value),
    );
  }
}

String _$albumsStateHash() => r'00289814a9a37b2ccb9a86f49148a45019480427';

abstract class _$AlbumsState extends $Notifier<AlbumResponse?> {
  AlbumResponse? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AlbumResponse?, AlbumResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AlbumResponse?, AlbumResponse?>,
              AlbumResponse?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
