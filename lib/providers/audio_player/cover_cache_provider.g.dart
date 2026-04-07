// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_cache_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchCoverBytes)
final fetchCoverBytesProvider = FetchCoverBytesFamily._();

final class FetchCoverBytesProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List?>,
          Uint8List?,
          FutureOr<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $FutureProvider<Uint8List?> {
  FetchCoverBytesProvider._({
    required FetchCoverBytesFamily super.from,
    required ({
      String songId,
      String albumName,
      String artistName,
      String key,
      Duration? liveKeepDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'fetchCoverBytesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchCoverBytesHash();

  @override
  String toString() {
    return r'fetchCoverBytesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List?> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String songId,
              String albumName,
              String artistName,
              String key,
              Duration? liveKeepDuration,
            });
    return fetchCoverBytes(
      ref,
      songId: argument.songId,
      albumName: argument.albumName,
      artistName: argument.artistName,
      key: argument.key,
      liveKeepDuration: argument.liveKeepDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCoverBytesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchCoverBytesHash() => r'717664fd288e0982b96a66e20b9f86eef854cc4a';

final class FetchCoverBytesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Uint8List?>,
          ({
            String songId,
            String albumName,
            String artistName,
            String key,
            Duration? liveKeepDuration,
          })
        > {
  FetchCoverBytesFamily._()
    : super(
        retry: null,
        name: r'fetchCoverBytesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchCoverBytesProvider call({
    required String songId,
    required String albumName,
    required String artistName,
    required String key,
    Duration? liveKeepDuration,
  }) => FetchCoverBytesProvider._(
    argument: (
      songId: songId,
      albumName: albumName,
      artistName: artistName,
      key: key,
      liveKeepDuration: liveKeepDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'fetchCoverBytesProvider';
}

@ProviderFor(fetchCloudMusicCoverBytes)
final fetchCloudMusicCoverBytesProvider = FetchCloudMusicCoverBytesFamily._();

final class FetchCloudMusicCoverBytesProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List?>,
          Uint8List?,
          FutureOr<Uint8List?>
        >
    with $FutureModifier<Uint8List?>, $FutureProvider<Uint8List?> {
  FetchCloudMusicCoverBytesProvider._({
    required FetchCloudMusicCoverBytesFamily super.from,
    required ({String imageUrl, String key, Duration? liveKeepDuration})
    super.argument,
  }) : super(
         retry: null,
         name: r'fetchCloudMusicCoverBytesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchCloudMusicCoverBytesHash();

  @override
  String toString() {
    return r'fetchCloudMusicCoverBytesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List?> create(Ref ref) {
    final argument =
        this.argument
            as ({String imageUrl, String key, Duration? liveKeepDuration});
    return fetchCloudMusicCoverBytes(
      ref,
      imageUrl: argument.imageUrl,
      key: argument.key,
      liveKeepDuration: argument.liveKeepDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCloudMusicCoverBytesProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchCloudMusicCoverBytesHash() =>
    r'0fb26c9b54f4d1e03ea5cdbc195e3c0cf13ddaaf';

final class FetchCloudMusicCoverBytesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Uint8List?>,
          ({String imageUrl, String key, Duration? liveKeepDuration})
        > {
  FetchCloudMusicCoverBytesFamily._()
    : super(
        retry: null,
        name: r'fetchCloudMusicCoverBytesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchCloudMusicCoverBytesProvider call({
    required String imageUrl,
    required String key,
    Duration? liveKeepDuration,
  }) => FetchCloudMusicCoverBytesProvider._(
    argument: (
      imageUrl: imageUrl,
      key: key,
      liveKeepDuration: liveKeepDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'fetchCloudMusicCoverBytesProvider';
}
