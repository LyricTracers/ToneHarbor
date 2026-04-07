// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(streamUrl)
final streamUrlProvider = StreamUrlFamily._();

final class StreamUrlProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  StreamUrlProvider._({
    required StreamUrlFamily super.from,
    required ({String id, AudioQuality? quality, String? container})
    super.argument,
  }) : super(
         retry: null,
         name: r'streamUrlProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$streamUrlHash();

  @override
  String toString() {
    return r'streamUrlProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument =
        this.argument
            as ({String id, AudioQuality? quality, String? container});
    return streamUrl(
      ref,
      id: argument.id,
      quality: argument.quality,
      container: argument.container,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StreamUrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$streamUrlHash() => r'56d38da10f61616483a1b045de4cf23d1f04cfbc';

final class StreamUrlFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<String>,
          ({String id, AudioQuality? quality, String? container})
        > {
  StreamUrlFamily._()
    : super(
        retry: null,
        name: r'streamUrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StreamUrlProvider call({
    required String id,
    AudioQuality? quality,
    String? container,
  }) => StreamUrlProvider._(
    argument: (id: id, quality: quality, container: container),
    from: this,
  );

  @override
  String toString() => r'streamUrlProvider';
}

@ProviderFor(coverUrlBySongId)
final coverUrlBySongIdProvider = CoverUrlBySongIdFamily._();

final class CoverUrlBySongIdProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  CoverUrlBySongIdProvider._({
    required CoverUrlBySongIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'coverUrlBySongIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$coverUrlBySongIdHash();

  @override
  String toString() {
    return r'coverUrlBySongIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as String;
    return coverUrlBySongId(ref, songId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CoverUrlBySongIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coverUrlBySongIdHash() => r'fc2df3af8f8d5424688c685b8e147b2f8769181a';

final class CoverUrlBySongIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String>, String> {
  CoverUrlBySongIdFamily._()
    : super(
        retry: null,
        name: r'coverUrlBySongIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CoverUrlBySongIdProvider call({required String songId}) =>
      CoverUrlBySongIdProvider._(argument: songId, from: this);

  @override
  String toString() => r'coverUrlBySongIdProvider';
}

@ProviderFor(coverUrlByArtist)
final coverUrlByArtistProvider = CoverUrlByArtistFamily._();

final class CoverUrlByArtistProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  CoverUrlByArtistProvider._({
    required CoverUrlByArtistFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'coverUrlByArtistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$coverUrlByArtistHash();

  @override
  String toString() {
    return r'coverUrlByArtistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as String;
    return coverUrlByArtist(ref, artistName: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CoverUrlByArtistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coverUrlByArtistHash() => r'0317bfc96fade9d2839671caeba2887131baf7ad';

final class CoverUrlByArtistFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String>, String> {
  CoverUrlByArtistFamily._()
    : super(
        retry: null,
        name: r'coverUrlByArtistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CoverUrlByArtistProvider call({required String artistName}) =>
      CoverUrlByArtistProvider._(argument: artistName, from: this);

  @override
  String toString() => r'coverUrlByArtistProvider';
}

@ProviderFor(coverUrlByAlbum)
final coverUrlByAlbumProvider = CoverUrlByAlbumFamily._();

final class CoverUrlByAlbumProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  CoverUrlByAlbumProvider._({
    required CoverUrlByAlbumFamily super.from,
    required ({
      String albumName,
      String albumArtistName,
      String view,
      bool outputDefault,
      bool isHr,
      String library,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'coverUrlByAlbumProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$coverUrlByAlbumHash();

  @override
  String toString() {
    return r'coverUrlByAlbumProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String albumName,
              String albumArtistName,
              String view,
              bool outputDefault,
              bool isHr,
              String library,
            });
    return coverUrlByAlbum(
      ref,
      albumName: argument.albumName,
      albumArtistName: argument.albumArtistName,
      view: argument.view,
      outputDefault: argument.outputDefault,
      isHr: argument.isHr,
      library: argument.library,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CoverUrlByAlbumProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coverUrlByAlbumHash() => r'c5001a811b1108aa1c70d4aee39f36d2e4490d8f';

final class CoverUrlByAlbumFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<String>,
          ({
            String albumName,
            String albumArtistName,
            String view,
            bool outputDefault,
            bool isHr,
            String library,
          })
        > {
  CoverUrlByAlbumFamily._()
    : super(
        retry: null,
        name: r'coverUrlByAlbumProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CoverUrlByAlbumProvider call({
    required String albumName,
    required String albumArtistName,
    String view = 'album',
    bool outputDefault = true,
    bool isHr = true,
    String library = 'shared',
  }) => CoverUrlByAlbumProvider._(
    argument: (
      albumName: albumName,
      albumArtistName: albumArtistName,
      view: view,
      outputDefault: outputDefault,
      isHr: isHr,
      library: library,
    ),
    from: this,
  );

  @override
  String toString() => r'coverUrlByAlbumProvider';
}
