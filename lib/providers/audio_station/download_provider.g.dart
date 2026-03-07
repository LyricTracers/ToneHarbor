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
    required ({String id, String format}) super.argument,
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
    final argument = this.argument as ({String id, String format});
    return streamUrl(ref, id: argument.id, format: argument.format);
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

String _$streamUrlHash() => r'2b85c01835e40e4f84058f8117a88313bc9f0290';

final class StreamUrlFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<String>,
          ({String id, String format})
        > {
  StreamUrlFamily._()
    : super(
        retry: null,
        name: r'streamUrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StreamUrlProvider call({required String id, String format = 'mp3'}) =>
      StreamUrlProvider._(argument: (id: id, format: format), from: this);

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

String _$coverUrlBySongIdHash() => r'991c586aefb47e3190de916e838a74f7ae5a5d85';

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
