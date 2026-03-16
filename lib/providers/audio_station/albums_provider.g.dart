// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$randomAlbumsHash() => r'8431240b978c41a96f63e69c5e8a9308e00bf624';

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

String _$recentAlbumsHash() => r'475bff23ca74addef420defd95f565568f30b9b0';

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

String _$artistAlbumsHash() => r'19f837d9335bfee8a4e9a84da075193b1fc5e556';

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
         isAutoDispose: true,
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

String _$searchAlbumsHash() => r'2fcb0d54cac69f3ef621e669b745ea99b8ba6cfe';

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
        isAutoDispose: true,
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

@ProviderFor(Albums)
final albumsProvider = AlbumsFamily._();

final class AlbumsProvider
    extends $AsyncNotifierProvider<Albums, AlbumResponse> {
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
  Albums create() => Albums();

  @override
  bool operator ==(Object other) {
    return other is AlbumsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$albumsHash() => r'13139c97369d678098b5cab7eabf5b04d8998201';

final class AlbumsFamily extends $Family
    with
        $ClassFamilyOverride<
          Albums,
          AsyncValue<AlbumResponse>,
          AlbumResponse,
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
    Duration? cacheDuration = const Duration(minutes: 30),
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
    ),
    from: this,
  );

  @override
  String toString() => r'albumsProvider';
}

abstract class _$Albums extends $AsyncNotifier<AlbumResponse> {
  late final _$args =
      ref.$arg
          as ({
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
            String additional,
            String? artist,
            Duration? cacheDuration,
          });
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  String get library => _$args.library;
  String get sortBy => _$args.sortBy;
  String get sortDirection => _$args.sortDirection;
  String get additional => _$args.additional;
  String? get artist => _$args.artist;
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<AlbumResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'asc',
    String additional = 'avg_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 30),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AlbumResponse>, AlbumResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AlbumResponse>, AlbumResponse>,
              AsyncValue<AlbumResponse>,
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
        additional: _$args.additional,
        artist: _$args.artist,
        cacheDuration: _$args.cacheDuration,
      ),
    );
  }
}
