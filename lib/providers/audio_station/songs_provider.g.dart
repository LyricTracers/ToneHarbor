// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SongRating)
final songRatingProvider = SongRatingProvider._();

final class SongRatingProvider
    extends $NotifierProvider<SongRating, Set<String>> {
  SongRatingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songRatingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songRatingHash();

  @$internal
  @override
  SongRating create() => SongRating();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$songRatingHash() => r'216279edced28cae3a0a7b7b2dd2174f0d7a8176';

abstract class _$SongRating extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

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

String _$songCommonHash() => r'd8f4705b17243c7197b481454ee30e43ec63dc58';

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
    extends $AsyncNotifierProvider<RandomSongs, ToneHarborTrackObjectList> {
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

String _$randomSongsHash() => r'95d79b38eef11e09061ad47a4516f060f99fb0e3';

final class RandomSongsFamily extends $Family
    with
        $ClassFamilyOverride<
          RandomSongs,
          AsyncValue<ToneHarborTrackObjectList>,
          ToneHarborTrackObjectList,
          FutureOr<ToneHarborTrackObjectList>,
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

abstract class _$RandomSongs extends $AsyncNotifier<ToneHarborTrackObjectList> {
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

  FutureOr<ToneHarborTrackObjectList> build({
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
        this.ref
            as $Ref<
              AsyncValue<ToneHarborTrackObjectList>,
              ToneHarborTrackObjectList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ToneHarborTrackObjectList>,
                ToneHarborTrackObjectList
              >,
              AsyncValue<ToneHarborTrackObjectList>,
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
    extends $AsyncNotifierProvider<FavoriteSongs, ToneHarborTrackObjectList> {
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

String _$favoriteSongsHash() => r'1ba1c921dcaa802534bb897a8243b00d6979de75';

final class FavoriteSongsFamily extends $Family
    with
        $ClassFamilyOverride<
          FavoriteSongs,
          AsyncValue<ToneHarborTrackObjectList>,
          ToneHarborTrackObjectList,
          FutureOr<ToneHarborTrackObjectList>,
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

abstract class _$FavoriteSongs
    extends $AsyncNotifier<ToneHarborTrackObjectList> {
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

  FutureOr<ToneHarborTrackObjectList> build({
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
        this.ref
            as $Ref<
              AsyncValue<ToneHarborTrackObjectList>,
              ToneHarborTrackObjectList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ToneHarborTrackObjectList>,
                ToneHarborTrackObjectList
              >,
              AsyncValue<ToneHarborTrackObjectList>,
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
    extends $AsyncNotifierProvider<ArtistSongs, ToneHarborTrackObjectList> {
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

String _$artistSongsHash() => r'2b7905c695d7f5d9183616f8201bda7164f36c5e';

final class ArtistSongsFamily extends $Family
    with
        $ClassFamilyOverride<
          ArtistSongs,
          AsyncValue<ToneHarborTrackObjectList>,
          ToneHarborTrackObjectList,
          FutureOr<ToneHarborTrackObjectList>,
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

abstract class _$ArtistSongs extends $AsyncNotifier<ToneHarborTrackObjectList> {
  late final _$args =
      ref.$arg
          as ({String artist, int limit, int offset, Duration? cacheDuration});
  String get artist => _$args.artist;
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<ToneHarborTrackObjectList> build({
    required String artist,
    int limit = 100,
    int offset = 0,
    Duration? cacheDuration = const Duration(minutes: 5),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ToneHarborTrackObjectList>,
              ToneHarborTrackObjectList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ToneHarborTrackObjectList>,
                ToneHarborTrackObjectList
              >,
              AsyncValue<ToneHarborTrackObjectList>,
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
          AsyncValue<ToneHarborTrackObjectList>,
          ToneHarborTrackObjectList,
          FutureOr<ToneHarborTrackObjectList>
        >
    with
        $FutureModifier<ToneHarborTrackObjectList>,
        $FutureProvider<ToneHarborTrackObjectList> {
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
  $FutureProviderElement<ToneHarborTrackObjectList> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ToneHarborTrackObjectList> create(Ref ref) {
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

String _$searchSongsHash() => r'9a3114323dfa7b29ca3c88d1411f313714464274';

final class SearchSongsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ToneHarborTrackObjectList>,
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
    extends $AsyncNotifierProvider<AlbumSongs, ToneHarborTrackObjectList> {
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

String _$albumSongsHash() => r'2384e3344f5a1cad610800d1c55ea030cd27ad70';

final class AlbumSongsFamily extends $Family
    with
        $ClassFamilyOverride<
          AlbumSongs,
          AsyncValue<ToneHarborTrackObjectList>,
          ToneHarborTrackObjectList,
          FutureOr<ToneHarborTrackObjectList>,
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

abstract class _$AlbumSongs extends $AsyncNotifier<ToneHarborTrackObjectList> {
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

  FutureOr<ToneHarborTrackObjectList> build({
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
        this.ref
            as $Ref<
              AsyncValue<ToneHarborTrackObjectList>,
              ToneHarborTrackObjectList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ToneHarborTrackObjectList>,
                ToneHarborTrackObjectList
              >,
              AsyncValue<ToneHarborTrackObjectList>,
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
    extends $AsyncNotifierProvider<Songs, ToneHarborTrackObjectList> {
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

String _$songsHash() => r'e8722c4fe06905cffce0f04f814f285918481525';

final class SongsFamily extends $Family
    with
        $ClassFamilyOverride<
          Songs,
          AsyncValue<ToneHarborTrackObjectList>,
          ToneHarborTrackObjectList,
          FutureOr<ToneHarborTrackObjectList>,
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

abstract class _$Songs extends $AsyncNotifier<ToneHarborTrackObjectList> {
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

  FutureOr<ToneHarborTrackObjectList> build({
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
        this.ref
            as $Ref<
              AsyncValue<ToneHarborTrackObjectList>,
              ToneHarborTrackObjectList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ToneHarborTrackObjectList>,
                ToneHarborTrackObjectList
              >,
              AsyncValue<ToneHarborTrackObjectList>,
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
