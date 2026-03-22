// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics_cache_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getLyrics)
final getLyricsProvider = GetLyricsFamily._();

final class GetLyricsProvider
    extends $FunctionalProvider<AsyncValue<Lyrics?>, Lyrics?, FutureOr<Lyrics?>>
    with $FutureModifier<Lyrics?>, $FutureProvider<Lyrics?> {
  GetLyricsProvider._({
    required GetLyricsFamily super.from,
    required ({String songId, String? title, String? artist}) super.argument,
  }) : super(
         retry: null,
         name: r'getLyricsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getLyricsHash();

  @override
  String toString() {
    return r'getLyricsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Lyrics?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Lyrics?> create(Ref ref) {
    final argument =
        this.argument as ({String songId, String? title, String? artist});
    return getLyrics(
      ref,
      songId: argument.songId,
      title: argument.title,
      artist: argument.artist,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetLyricsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getLyricsHash() => r'87bccb45bf22af73a0ab471fafdd6b7183e86699';

final class GetLyricsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Lyrics?>,
          ({String songId, String? title, String? artist})
        > {
  GetLyricsFamily._()
    : super(
        retry: null,
        name: r'getLyricsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetLyricsProvider call({
    required String songId,
    String? title,
    String? artist,
  }) => GetLyricsProvider._(
    argument: (songId: songId, title: title, artist: artist),
    from: this,
  );

  @override
  String toString() => r'getLyricsProvider';
}

@ProviderFor(currentLyrics)
final currentLyricsProvider = CurrentLyricsProvider._();

final class CurrentLyricsProvider
    extends $FunctionalProvider<AsyncValue<Lyrics?>, Lyrics?, FutureOr<Lyrics?>>
    with $FutureModifier<Lyrics?>, $FutureProvider<Lyrics?> {
  CurrentLyricsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentLyricsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentLyricsHash();

  @$internal
  @override
  $FutureProviderElement<Lyrics?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Lyrics?> create(Ref ref) {
    return currentLyrics(ref);
  }
}

String _$currentLyricsHash() => r'e169d40e4391f4a50b7a159db44d498360db537d';
