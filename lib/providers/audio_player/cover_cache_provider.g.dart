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
    required ({String url, String key, Duration? liveKeepDuration})
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
        this.argument as ({String url, String key, Duration? liveKeepDuration});
    return fetchCoverBytes(
      ref,
      url: argument.url,
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

String _$fetchCoverBytesHash() => r'9335f643028a376171220a871e38d2509ebae513';

final class FetchCoverBytesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Uint8List?>,
          ({String url, String key, Duration? liveKeepDuration})
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
    required String url,
    required String key,
    Duration? liveKeepDuration,
  }) => FetchCoverBytesProvider._(
    argument: (url: url, key: key, liveKeepDuration: liveKeepDuration),
    from: this,
  );

  @override
  String toString() => r'fetchCoverBytesProvider';
}
