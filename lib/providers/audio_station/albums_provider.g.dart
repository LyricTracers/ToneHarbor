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

String _$albumsHash() => r'f8d34b62130554d44145c120e42a0bae80bfe440';

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
    Duration? cacheDuration = const Duration(minutes: 5),
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
    required ({int limit, Duration? cacheDuration}) super.argument,
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
    final argument = this.argument as ({int limit, Duration? cacheDuration});
    return recentAlbums(
      ref,
      limit: argument.limit,
      cacheDuration: argument.cacheDuration,
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

String _$recentAlbumsHash() => r'85aead22af4f91c36c3c3133f2c83bbd252c09f1';

final class RecentAlbumsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AlbumResponse>,
          ({int limit, Duration? cacheDuration})
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
    int limit = 50,
    Duration? cacheDuration = const Duration(minutes: 5),
  }) => RecentAlbumsProvider._(
    argument: (limit: limit, cacheDuration: cacheDuration),
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
    required ({String artist, int limit, Duration? cacheDuration})
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
        this.argument as ({String artist, int limit, Duration? cacheDuration});
    return artistAlbums(
      ref,
      artist: argument.artist,
      limit: argument.limit,
      cacheDuration: argument.cacheDuration,
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

String _$artistAlbumsHash() => r'c88bce79e166fbfe8e86763d3c48c708a7705138';

final class ArtistAlbumsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AlbumResponse>,
          ({String artist, int limit, Duration? cacheDuration})
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
    Duration? cacheDuration = const Duration(minutes: 5),
  }) => ArtistAlbumsProvider._(
    argument: (artist: artist, limit: limit, cacheDuration: cacheDuration),
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

String _$searchAlbumsHash() => r'1f92ce1968e06ce9ecb5c3587f240cb51f893f12';

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
    Duration? keepAliveDuration = const Duration(minutes: 5),
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
