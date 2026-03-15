// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SongCommon)
final songCommonProvider = SongCommonProvider._();

final class SongCommonProvider extends $NotifierProvider<SongCommon, void> {
  SongCommonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songCommonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songCommonHash();

  @$internal
  @override
  SongCommon create() => SongCommon();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$songCommonHash() => r'dd3b66614462684707ba227e48c4bb0d33e8c67b';

abstract class _$SongCommon extends $Notifier<void> {
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

@ProviderFor(RandomSongs)
final randomSongsProvider = RandomSongsFamily._();

final class RandomSongsProvider
    extends $AsyncNotifierProvider<RandomSongs, SongListResponse> {
  RandomSongsProvider._({
    required RandomSongsFamily super.from,
    required ({
      int limit,
      int offset,
      String library,
      String additional,
      Duration? cacheDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'randomSongsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$randomSongsHash();

  @override
  String toString() {
    return r'randomSongsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  RandomSongs create() => RandomSongs();

  @override
  bool operator ==(Object other) {
    return other is RandomSongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$randomSongsHash() => r'bb60eb9212f59af623b5fa501b0444279a33cb5b';

final class RandomSongsFamily extends $Family
    with
        $ClassFamilyOverride<
          RandomSongs,
          AsyncValue<SongListResponse>,
          SongListResponse,
          FutureOr<SongListResponse>,
          ({
            int limit,
            int offset,
            String library,
            String additional,
            Duration? cacheDuration,
          })
        > {
  RandomSongsFamily._()
    : super(
        retry: null,
        name: r'randomSongsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RandomSongsProvider call({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration,
  }) => RandomSongsProvider._(
    argument: (
      limit: limit,
      offset: offset,
      library: library,
      additional: additional,
      cacheDuration: cacheDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'randomSongsProvider';
}

abstract class _$RandomSongs extends $AsyncNotifier<SongListResponse> {
  late final _$args =
      ref.$arg
          as ({
            int limit,
            int offset,
            String library,
            String additional,
            Duration? cacheDuration,
          });
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  String get library => _$args.library;
  String get additional => _$args.additional;
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<SongListResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SongListResponse>, SongListResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SongListResponse>, SongListResponse>,
              AsyncValue<SongListResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        limit: _$args.limit,
        offset: _$args.offset,
        library: _$args.library,
        additional: _$args.additional,
        cacheDuration: _$args.cacheDuration,
      ),
    );
  }
}

@ProviderFor(FavoriteSongs)
final favoriteSongsProvider = FavoriteSongsFamily._();

final class FavoriteSongsProvider
    extends $AsyncNotifierProvider<FavoriteSongs, SongListResponse> {
  FavoriteSongsProvider._({
    required FavoriteSongsFamily super.from,
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
         name: r'favoriteSongsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$favoriteSongsHash();

  @override
  String toString() {
    return r'favoriteSongsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  FavoriteSongs create() => FavoriteSongs();

  @override
  bool operator ==(Object other) {
    return other is FavoriteSongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$favoriteSongsHash() => r'71cc0982115976252ed6946e101ae5985831d27a';

final class FavoriteSongsFamily extends $Family
    with
        $ClassFamilyOverride<
          FavoriteSongs,
          AsyncValue<SongListResponse>,
          SongListResponse,
          FutureOr<SongListResponse>,
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
  FavoriteSongsFamily._()
    : super(
        retry: null,
        name: r'favoriteSongsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FavoriteSongsProvider call({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'desc',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration = const Duration(minutes: 30),
  }) => FavoriteSongsProvider._(
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
  String toString() => r'favoriteSongsProvider';
}

abstract class _$FavoriteSongs extends $AsyncNotifier<SongListResponse> {
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

  FutureOr<SongListResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'desc',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration = const Duration(minutes: 30),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SongListResponse>, SongListResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SongListResponse>, SongListResponse>,
              AsyncValue<SongListResponse>,
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

@ProviderFor(ArtistSongs)
final artistSongsProvider = ArtistSongsFamily._();

final class ArtistSongsProvider
    extends $AsyncNotifierProvider<ArtistSongs, SongListResponse> {
  ArtistSongsProvider._({
    required ArtistSongsFamily super.from,
    required ({String artist, int limit, int offset, Duration? cacheDuration})
    super.argument,
  }) : super(
         retry: null,
         name: r'artistSongsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$artistSongsHash();

  @override
  String toString() {
    return r'artistSongsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ArtistSongs create() => ArtistSongs();

  @override
  bool operator ==(Object other) {
    return other is ArtistSongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$artistSongsHash() => r'a158471afce601365cc869f1baec4c73a6fd6cbf';

final class ArtistSongsFamily extends $Family
    with
        $ClassFamilyOverride<
          ArtistSongs,
          AsyncValue<SongListResponse>,
          SongListResponse,
          FutureOr<SongListResponse>,
          ({String artist, int limit, int offset, Duration? cacheDuration})
        > {
  ArtistSongsFamily._()
    : super(
        retry: null,
        name: r'artistSongsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ArtistSongsProvider call({
    required String artist,
    int limit = 100,
    int offset = 0,
    Duration? cacheDuration = const Duration(minutes: 5),
  }) => ArtistSongsProvider._(
    argument: (
      artist: artist,
      limit: limit,
      offset: offset,
      cacheDuration: cacheDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'artistSongsProvider';
}

abstract class _$ArtistSongs extends $AsyncNotifier<SongListResponse> {
  late final _$args =
      ref.$arg
          as ({String artist, int limit, int offset, Duration? cacheDuration});
  String get artist => _$args.artist;
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<SongListResponse> build({
    required String artist,
    int limit = 100,
    int offset = 0,
    Duration? cacheDuration = const Duration(minutes: 5),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SongListResponse>, SongListResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SongListResponse>, SongListResponse>,
              AsyncValue<SongListResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        artist: _$args.artist,
        limit: _$args.limit,
        offset: _$args.offset,
        cacheDuration: _$args.cacheDuration,
      ),
    );
  }
}

@ProviderFor(searchSongs)
final searchSongsProvider = SearchSongsFamily._();

final class SearchSongsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SongListResponse>,
          SongListResponse,
          FutureOr<SongListResponse>
        >
    with $FutureModifier<SongListResponse>, $FutureProvider<SongListResponse> {
  SearchSongsProvider._({
    required SearchSongsFamily super.from,
    required ({
      String title,
      String library,
      int limit,
      int offset,
      String sortDirection,
      String additional,
      Duration? cacheDuration,
      Duration? keepAliveDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'searchSongsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchSongsHash();

  @override
  String toString() {
    return r'searchSongsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<SongListResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SongListResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String title,
              String library,
              int limit,
              int offset,
              String sortDirection,
              String additional,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return searchSongs(
      ref,
      title: argument.title,
      library: argument.library,
      limit: argument.limit,
      offset: argument.offset,
      sortDirection: argument.sortDirection,
      additional: argument.additional,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchSongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchSongsHash() => r'9dd01b36c82dc497c2f5c8ffdb666e7bd7b883be';

final class SearchSongsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<SongListResponse>,
          ({
            String title,
            String library,
            int limit,
            int offset,
            String sortDirection,
            String additional,
            Duration? cacheDuration,
            Duration? keepAliveDuration,
          })
        > {
  SearchSongsFamily._()
    : super(
        retry: null,
        name: r'searchSongsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchSongsProvider call({
    required String title,
    String library = 'all',
    int limit = 5000,
    int offset = 0,
    String sortDirection = 'asc',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration = const Duration(minutes: 5),
    Duration? keepAliveDuration,
  }) => SearchSongsProvider._(
    argument: (
      title: title,
      library: library,
      limit: limit,
      offset: offset,
      sortDirection: sortDirection,
      additional: additional,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'searchSongsProvider';
}

@ProviderFor(AlbumSongs)
final albumSongsProvider = AlbumSongsFamily._();

final class AlbumSongsProvider
    extends $AsyncNotifierProvider<AlbumSongs, SongListResponse> {
  AlbumSongsProvider._({
    required AlbumSongsFamily super.from,
    required ({
      String album,
      String albumArtist,
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
         name: r'albumSongsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$albumSongsHash();

  @override
  String toString() {
    return r'albumSongsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  AlbumSongs create() => AlbumSongs();

  @override
  bool operator ==(Object other) {
    return other is AlbumSongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$albumSongsHash() => r'ab3f99ac1915a8f7879e1e335f38a67a42a10eb1';

final class AlbumSongsFamily extends $Family
    with
        $ClassFamilyOverride<
          AlbumSongs,
          AsyncValue<SongListResponse>,
          SongListResponse,
          FutureOr<SongListResponse>,
          ({
            String album,
            String albumArtist,
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
  AlbumSongsFamily._()
    : super(
        retry: null,
        name: r'albumSongsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AlbumSongsProvider call({
    required String album,
    required String albumArtist,
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'DESC',
    String additional = 'song_tag,song_audio,song_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 5),
  }) => AlbumSongsProvider._(
    argument: (
      album: album,
      albumArtist: albumArtist,
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
  String toString() => r'albumSongsProvider';
}

abstract class _$AlbumSongs extends $AsyncNotifier<SongListResponse> {
  late final _$args =
      ref.$arg
          as ({
            String album,
            String albumArtist,
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
            String additional,
            String? artist,
            Duration? cacheDuration,
          });
  String get album => _$args.album;
  String get albumArtist => _$args.albumArtist;
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  String get library => _$args.library;
  String get sortBy => _$args.sortBy;
  String get sortDirection => _$args.sortDirection;
  String get additional => _$args.additional;
  String? get artist => _$args.artist;
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<SongListResponse> build({
    required String album,
    required String albumArtist,
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'name',
    String sortDirection = 'DESC',
    String additional = 'song_tag,song_audio,song_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 5),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SongListResponse>, SongListResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SongListResponse>, SongListResponse>,
              AsyncValue<SongListResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        album: _$args.album,
        albumArtist: _$args.albumArtist,
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

@ProviderFor(Songs)
final songsProvider = SongsFamily._();

final class SongsProvider
    extends $AsyncNotifierProvider<Songs, SongListResponse> {
  SongsProvider._({
    required SongsFamily super.from,
    required ({
      int limit,
      int offset,
      String library,
      String sortBy,
      String sortDirection,
      String additional,
      String? artist,
      Duration? cacheDuration,
      String group,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'songsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$songsHash();

  @override
  String toString() {
    return r'songsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  Songs create() => Songs();

  @override
  bool operator ==(Object other) {
    return other is SongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$songsHash() => r'fee786e46af5ebc6b0359bd8c8971fb6761cc284';

final class SongsFamily extends $Family
    with
        $ClassFamilyOverride<
          Songs,
          AsyncValue<SongListResponse>,
          SongListResponse,
          FutureOr<SongListResponse>,
          ({
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
            String additional,
            String? artist,
            Duration? cacheDuration,
            String group,
          })
        > {
  SongsFamily._()
    : super(
        retry: null,
        name: r'songsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SongsProvider call({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'artist',
    String sortDirection = 'ASC',
    String additional = 'song_tag,song_audio,song_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 30),
    String group = 'songs',
  }) => SongsProvider._(
    argument: (
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      artist: artist,
      cacheDuration: cacheDuration,
      group: group,
    ),
    from: this,
  );

  @override
  String toString() => r'songsProvider';
}

abstract class _$Songs extends $AsyncNotifier<SongListResponse> {
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
            String group,
          });
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  String get library => _$args.library;
  String get sortBy => _$args.sortBy;
  String get sortDirection => _$args.sortDirection;
  String get additional => _$args.additional;
  String? get artist => _$args.artist;
  Duration? get cacheDuration => _$args.cacheDuration;
  String get group => _$args.group;

  FutureOr<SongListResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'artist',
    String sortDirection = 'ASC',
    String additional = 'song_tag,song_audio,song_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 30),
    String group = 'songs',
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SongListResponse>, SongListResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SongListResponse>, SongListResponse>,
              AsyncValue<SongListResponse>,
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
        group: _$args.group,
      ),
    );
  }
}
