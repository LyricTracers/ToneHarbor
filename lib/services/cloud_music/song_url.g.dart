// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_url.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cloudMusicSongUrl)
final cloudMusicSongUrlProvider = CloudMusicSongUrlFamily._();

final class CloudMusicSongUrlProvider
    extends
        $FunctionalProvider<
          AsyncValue<CloudMusicSongUrlData?>,
          CloudMusicSongUrlData?,
          FutureOr<CloudMusicSongUrlData?>
        >
    with
        $FutureModifier<CloudMusicSongUrlData?>,
        $FutureProvider<CloudMusicSongUrlData?> {
  CloudMusicSongUrlProvider._({
    required CloudMusicSongUrlFamily super.from,
    required ({int songId, CloudMusicQuality quality}) super.argument,
  }) : super(
         retry: null,
         name: r'cloudMusicSongUrlProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cloudMusicSongUrlHash();

  @override
  String toString() {
    return r'cloudMusicSongUrlProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<CloudMusicSongUrlData?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CloudMusicSongUrlData?> create(Ref ref) {
    final argument = this.argument as ({int songId, CloudMusicQuality quality});
    return cloudMusicSongUrl(
      ref,
      songId: argument.songId,
      quality: argument.quality,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CloudMusicSongUrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cloudMusicSongUrlHash() => r'e25f8a18e7b48a45ae0ee4c5034f71bdf7e2f118';

final class CloudMusicSongUrlFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<CloudMusicSongUrlData?>,
          ({int songId, CloudMusicQuality quality})
        > {
  CloudMusicSongUrlFamily._()
    : super(
        retry: null,
        name: r'cloudMusicSongUrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CloudMusicSongUrlProvider call({
    required int songId,
    CloudMusicQuality quality = CloudMusicQuality.exhigh,
  }) => CloudMusicSongUrlProvider._(
    argument: (songId: songId, quality: quality),
    from: this,
  );

  @override
  String toString() => r'cloudMusicSongUrlProvider';
}
