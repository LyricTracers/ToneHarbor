// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(setRating)
final setRatingProvider = SetRatingFamily._();

final class SetRatingProvider
    extends
        $FunctionalProvider<
          AsyncValue<SetRatingResponse>,
          SetRatingResponse,
          FutureOr<SetRatingResponse>
        >
    with
        $FutureModifier<SetRatingResponse>,
        $FutureProvider<SetRatingResponse> {
  SetRatingProvider._({
    required SetRatingFamily super.from,
    required ({String id, int rating}) super.argument,
  }) : super(
         retry: null,
         name: r'setRatingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$setRatingHash();

  @override
  String toString() {
    return r'setRatingProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<SetRatingResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SetRatingResponse> create(Ref ref) {
    final argument = this.argument as ({String id, int rating});
    return setRating(ref, id: argument.id, rating: argument.rating);
  }

  @override
  bool operator ==(Object other) {
    return other is SetRatingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$setRatingHash() => r'579cbd8a7d344ef5ca07ab57dff12242e243f027';

final class SetRatingFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<SetRatingResponse>,
          ({String id, int rating})
        > {
  SetRatingFamily._()
    : super(
        retry: null,
        name: r'setRatingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SetRatingProvider call({required String id, int rating = 5}) =>
      SetRatingProvider._(argument: (id: id, rating: rating), from: this);

  @override
  String toString() => r'setRatingProvider';
}

@ProviderFor(songs)
final songsProvider = SongsFamily._();

final class SongsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SongListResponse>,
          SongListResponse,
          FutureOr<SongListResponse>
        >
    with $FutureModifier<SongListResponse>, $FutureProvider<SongListResponse> {
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
      Duration? keepAliveDuration,
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
  $FutureProviderElement<SongListResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SongListResponse> create(Ref ref) {
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
    return songs(
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
    return other is SongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$songsHash() => r'f6c42798822b6485cb7b11659e33512e372d2563';

final class SongsFamily extends $Family
    with
        $FunctionalFamilyOverride<
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
            Duration? keepAliveDuration,
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
    Duration? cacheDuration = const Duration(minutes: 5),
    Duration? keepAliveDuration = const Duration(minutes: 5),
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
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'songsProvider';
}

@ProviderFor(randomSongs)
final randomSongsProvider = RandomSongsFamily._();

final class RandomSongsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SongListResponse>,
          SongListResponse,
          FutureOr<SongListResponse>
        >
    with $FutureModifier<SongListResponse>, $FutureProvider<SongListResponse> {
  RandomSongsProvider._({
    required RandomSongsFamily super.from,
    required ({
      int limit,
      int offset,
      String library,
      String additional,
      Duration? cacheDuration,
      Duration? keepAliveDuration,
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
  $FutureProviderElement<SongListResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SongListResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int limit,
              int offset,
              String library,
              String additional,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return randomSongs(
      ref,
      limit: argument.limit,
      offset: argument.offset,
      library: argument.library,
      additional: argument.additional,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RandomSongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$randomSongsHash() => r'c133700572d6c5d173cdc3ca42cac3ada73ab162';

final class RandomSongsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<SongListResponse>,
          ({
            int limit,
            int offset,
            String library,
            String additional,
            Duration? cacheDuration,
            Duration? keepAliveDuration,
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
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => RandomSongsProvider._(
    argument: (
      limit: limit,
      offset: offset,
      library: library,
      additional: additional,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'randomSongsProvider';
}

@ProviderFor(artistSongs)
final artistSongsProvider = ArtistSongsFamily._();

final class ArtistSongsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SongListResponse>,
          SongListResponse,
          FutureOr<SongListResponse>
        >
    with $FutureModifier<SongListResponse>, $FutureProvider<SongListResponse> {
  ArtistSongsProvider._({
    required ArtistSongsFamily super.from,
    required ({
      String artist,
      int limit,
      int offset,
      Duration? cacheDuration,
      Duration? keepAliveDuration,
    })
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
  $FutureProviderElement<SongListResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SongListResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String artist,
              int limit,
              int offset,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return artistSongs(
      ref,
      artist: argument.artist,
      limit: argument.limit,
      offset: argument.offset,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistSongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$artistSongsHash() => r'237ce7ed196571840393d76a6fbbb1acb813ed1f';

final class ArtistSongsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<SongListResponse>,
          ({
            String artist,
            int limit,
            int offset,
            Duration? cacheDuration,
            Duration? keepAliveDuration,
          })
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
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => ArtistSongsProvider._(
    argument: (
      artist: artist,
      limit: limit,
      offset: offset,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'artistSongsProvider';
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

String _$searchSongsHash() => r'd3b8d705e4de8f9e34edb8efe6384228ee483562';

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
    Duration? cacheDuration = const Duration(minutes: 1),
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

@ProviderFor(albumSongs)
final albumSongsProvider = AlbumSongsFamily._();

final class AlbumSongsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SongListResponse>,
          SongListResponse,
          FutureOr<SongListResponse>
        >
    with $FutureModifier<SongListResponse>, $FutureProvider<SongListResponse> {
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
      Duration? keepAliveDuration,
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
  $FutureProviderElement<SongListResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SongListResponse> create(Ref ref) {
    final argument =
        this.argument
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
              Duration? keepAliveDuration,
            });
    return albumSongs(
      ref,
      album: argument.album,
      albumArtist: argument.albumArtist,
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
    return other is AlbumSongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$albumSongsHash() => r'a892dfbd2bb93535cf3aaa9383be2f50b3e4266e';

final class AlbumSongsFamily extends $Family
    with
        $FunctionalFamilyOverride<
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
            Duration? keepAliveDuration,
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
    String sortBy = 'song_rating',
    String sortDirection = 'DESC',
    String additional = 'song_tag,song_audio,song_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 5),
    Duration? keepAliveDuration = const Duration(minutes: 5),
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
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'albumSongsProvider';
}

@ProviderFor(lyrics)
final lyricsProvider = LyricsFamily._();

final class LyricsProvider
    extends
        $FunctionalProvider<
          AsyncValue<LyricsResponse>,
          LyricsResponse,
          FutureOr<LyricsResponse>
        >
    with $FutureModifier<LyricsResponse>, $FutureProvider<LyricsResponse> {
  LyricsProvider._({
    required LyricsFamily super.from,
    required ({String id, Duration? cacheDuration, Duration? keepAliveDuration})
    super.argument,
  }) : super(
         retry: null,
         name: r'lyricsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lyricsHash();

  @override
  String toString() {
    return r'lyricsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<LyricsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LyricsResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String id,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return lyrics(
      ref,
      id: argument.id,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LyricsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lyricsHash() => r'e69ea1f76a6d1ffd24c22570a6752159521768d4';

final class LyricsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<LyricsResponse>,
          ({String id, Duration? cacheDuration, Duration? keepAliveDuration})
        > {
  LyricsFamily._()
    : super(
        retry: null,
        name: r'lyricsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LyricsProvider call({
    required String id,
    Duration? cacheDuration = const Duration(minutes: 5),
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => LyricsProvider._(
    argument: (
      id: id,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'lyricsProvider';
}

@ProviderFor(searchLyrics)
final searchLyricsProvider = SearchLyricsFamily._();

final class SearchLyricsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SearchLyricsResponse>,
          SearchLyricsResponse,
          FutureOr<SearchLyricsResponse>
        >
    with
        $FutureModifier<SearchLyricsResponse>,
        $FutureProvider<SearchLyricsResponse> {
  SearchLyricsProvider._({
    required SearchLyricsFamily super.from,
    required ({
      String title,
      String? artist,
      int limit,
      String additional,
      Duration? cacheDuration,
      Duration? keepAliveDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'searchLyricsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchLyricsHash();

  @override
  String toString() {
    return r'searchLyricsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<SearchLyricsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SearchLyricsResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String title,
              String? artist,
              int limit,
              String additional,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return searchLyrics(
      ref,
      title: argument.title,
      artist: argument.artist,
      limit: argument.limit,
      additional: argument.additional,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchLyricsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchLyricsHash() => r'7f85a39007030726bbfe101df1f7bc156c04750f';

final class SearchLyricsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<SearchLyricsResponse>,
          ({
            String title,
            String? artist,
            int limit,
            String additional,
            Duration? cacheDuration,
            Duration? keepAliveDuration,
          })
        > {
  SearchLyricsFamily._()
    : super(
        retry: null,
        name: r'searchLyricsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchLyricsProvider call({
    required String title,
    String? artist,
    int limit = 10,
    String additional = 'full_lyrics',
    Duration? cacheDuration = const Duration(minutes: 5),
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => SearchLyricsProvider._(
    argument: (
      title: title,
      artist: artist,
      limit: limit,
      additional: additional,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'searchLyricsProvider';
}

@ProviderFor(songInfo)
final songInfoProvider = SongInfoFamily._();

final class SongInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<SongInfoResponse>,
          SongInfoResponse,
          FutureOr<SongInfoResponse>
        >
    with $FutureModifier<SongInfoResponse>, $FutureProvider<SongInfoResponse> {
  SongInfoProvider._({
    required SongInfoFamily super.from,
    required ({
      String id,
      String additional,
      Duration? cacheDuration,
      Duration? keepAliveDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'songInfoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$songInfoHash();

  @override
  String toString() {
    return r'songInfoProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<SongInfoResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SongInfoResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String id,
              String additional,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return songInfo(
      ref,
      id: argument.id,
      additional: argument.additional,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SongInfoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$songInfoHash() => r'2600a44b80dcde8d8ed257aec3fc6c3224cfe75d';

final class SongInfoFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<SongInfoResponse>,
          ({
            String id,
            String additional,
            Duration? cacheDuration,
            Duration? keepAliveDuration,
          })
        > {
  SongInfoFamily._()
    : super(
        retry: null,
        name: r'songInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SongInfoProvider call({
    required String id,
    String additional = 'song_rating',
    Duration? cacheDuration = const Duration(minutes: 5),
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => SongInfoProvider._(
    argument: (
      id: id,
      additional: additional,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'songInfoProvider';
}

@ProviderFor(numberOfPlugIns)
final numberOfPlugInsProvider = NumberOfPlugInsFamily._();

final class NumberOfPlugInsProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetNumberOfPlugInsResponse>,
          GetNumberOfPlugInsResponse,
          FutureOr<GetNumberOfPlugInsResponse>
        >
    with
        $FutureModifier<GetNumberOfPlugInsResponse>,
        $FutureProvider<GetNumberOfPlugInsResponse> {
  NumberOfPlugInsProvider._({
    required NumberOfPlugInsFamily super.from,
    required ({Duration? cacheDuration, Duration? keepAliveDuration})
    super.argument,
  }) : super(
         retry: null,
         name: r'numberOfPlugInsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$numberOfPlugInsHash();

  @override
  String toString() {
    return r'numberOfPlugInsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<GetNumberOfPlugInsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GetNumberOfPlugInsResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({Duration? cacheDuration, Duration? keepAliveDuration});
    return numberOfPlugIns(
      ref,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NumberOfPlugInsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$numberOfPlugInsHash() => r'412b0049f09b11ee321fd44fe71af901b9aee4ae';

final class NumberOfPlugInsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<GetNumberOfPlugInsResponse>,
          ({Duration? cacheDuration, Duration? keepAliveDuration})
        > {
  NumberOfPlugInsFamily._()
    : super(
        retry: null,
        name: r'numberOfPlugInsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NumberOfPlugInsProvider call({
    Duration? cacheDuration = const Duration(hours: 24),
    Duration? keepAliveDuration = const Duration(minutes: 1),
  }) => NumberOfPlugInsProvider._(
    argument: (
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'numberOfPlugInsProvider';
}

@ProviderFor(SongsState)
final songsStateProvider = SongsStateProvider._();

final class SongsStateProvider
    extends $NotifierProvider<SongsState, SongListResponse?> {
  SongsStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songsStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songsStateHash();

  @$internal
  @override
  SongsState create() => SongsState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SongListResponse? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SongListResponse?>(value),
    );
  }
}

String _$songsStateHash() => r'b16dc42da59858c0a1de4fa880d3d1d0609674f6';

abstract class _$SongsState extends $Notifier<SongListResponse?> {
  SongListResponse? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SongListResponse?, SongListResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SongListResponse?, SongListResponse?>,
              SongListResponse?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
