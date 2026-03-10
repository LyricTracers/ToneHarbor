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
    required String super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Lyrics?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Lyrics?> create(Ref ref) {
    final argument = this.argument as String;
    return getLyrics(ref, songId: argument);
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

String _$getLyricsHash() => r'54a406deb1d738c03410bc1fca8b2453dc1abba7';

final class GetLyricsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Lyrics?>, String> {
  GetLyricsFamily._()
    : super(
        retry: null,
        name: r'getLyricsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetLyricsProvider call({required String songId}) =>
      GetLyricsProvider._(argument: songId, from: this);

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

String _$currentLyricsHash() => r'c7b0c4706fd8425541733012e17421466dc3eb03';
