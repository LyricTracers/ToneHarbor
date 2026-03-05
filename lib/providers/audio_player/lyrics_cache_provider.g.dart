// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics_cache_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$currentLyricsHash() => r'98783a385a9e4bdac18e07431189c7cddf2fe342';
