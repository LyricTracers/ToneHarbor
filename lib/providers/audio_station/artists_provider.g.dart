// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchArtist)
final searchArtistProvider = SearchArtistFamily._();

final class SearchArtistProvider
    extends $AsyncNotifierProvider<SearchArtist, ArtistResponse> {
  SearchArtistProvider._({
    required SearchArtistFamily super.from,
    required ({
      String filter,
      String library,
      int limit,
      int offset,
      String sortBy,
      String sortDirection,
      Duration? cacheDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'searchArtistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchArtistHash();

  @override
  String toString() {
    return r'searchArtistProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SearchArtist create() => SearchArtist();

  @override
  bool operator ==(Object other) {
    return other is SearchArtistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchArtistHash() => r'0c7f569edf72ce87d54b1e026403d12be5623fac';

final class SearchArtistFamily extends $Family
    with
        $ClassFamilyOverride<
          SearchArtist,
          AsyncValue<ArtistResponse>,
          ArtistResponse,
          FutureOr<ArtistResponse>,
          ({
            String filter,
            String library,
            int limit,
            int offset,
            String sortBy,
            String sortDirection,
            Duration? cacheDuration,
          })
        > {
  SearchArtistFamily._()
    : super(
        retry: null,
        name: r'searchArtistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchArtistProvider call({
    required String filter,
    String library = 'all',
    int limit = 5000,
    int offset = 0,
    String sortBy = 'name',
    String sortDirection = 'asc',
    Duration? cacheDuration = const Duration(minutes: 30),
  }) => SearchArtistProvider._(
    argument: (
      filter: filter,
      library: library,
      limit: limit,
      offset: offset,
      sortBy: sortBy,
      sortDirection: sortDirection,
      cacheDuration: cacheDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'searchArtistProvider';
}

abstract class _$SearchArtist extends $AsyncNotifier<ArtistResponse> {
  late final _$args =
      ref.$arg
          as ({
            String filter,
            String library,
            int limit,
            int offset,
            String sortBy,
            String sortDirection,
            Duration? cacheDuration,
          });
  String get filter => _$args.filter;
  String get library => _$args.library;
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  String get sortBy => _$args.sortBy;
  String get sortDirection => _$args.sortDirection;
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<ArtistResponse> build({
    required String filter,
    String library = 'all',
    int limit = 5000,
    int offset = 0,
    String sortBy = 'name',
    String sortDirection = 'asc',
    Duration? cacheDuration = const Duration(minutes: 30),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ArtistResponse>, ArtistResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ArtistResponse>, ArtistResponse>,
              AsyncValue<ArtistResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        filter: _$args.filter,
        library: _$args.library,
        limit: _$args.limit,
        offset: _$args.offset,
        sortBy: _$args.sortBy,
        sortDirection: _$args.sortDirection,
        cacheDuration: _$args.cacheDuration,
      ),
    );
  }
}

@ProviderFor(Artists)
final artistsProvider = ArtistsFamily._();

final class ArtistsProvider
    extends $AsyncNotifierProvider<Artists, ArtistResponse> {
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
  Artists create() => Artists();

  @override
  bool operator ==(Object other) {
    return other is ArtistsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$artistsHash() => r'd92fb409512f0323ca89422f72d837d0431e0a31';

final class ArtistsFamily extends $Family
    with
        $ClassFamilyOverride<
          Artists,
          AsyncValue<ArtistResponse>,
          ArtistResponse,
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
    String library = 'all',
    String sortBy = 'name',
    String sortDirection = 'ASC',
    String additional = 'avg_rating',
    Duration? cacheDuration = const Duration(minutes: 30),
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

abstract class _$Artists extends $AsyncNotifier<ArtistResponse> {
  late final _$args =
      ref.$arg
          as ({
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
            String additional,
            Duration? cacheDuration,
          });
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  String get library => _$args.library;
  String get sortBy => _$args.sortBy;
  String get sortDirection => _$args.sortDirection;
  String get additional => _$args.additional;
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<ArtistResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'all',
    String sortBy = 'name',
    String sortDirection = 'ASC',
    String additional = 'avg_rating',
    Duration? cacheDuration = const Duration(minutes: 30),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ArtistResponse>, ArtistResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ArtistResponse>, ArtistResponse>,
              AsyncValue<ArtistResponse>,
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
        cacheDuration: _$args.cacheDuration,
      ),
    );
  }
}
