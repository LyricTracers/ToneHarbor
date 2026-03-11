// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mixSearch)
final mixSearchProvider = MixSearchFamily._();

final class MixSearchProvider
    extends
        $FunctionalProvider<
          AsyncValue<MixSearchData>,
          MixSearchData,
          FutureOr<MixSearchData>
        >
    with $FutureModifier<MixSearchData>, $FutureProvider<MixSearchData> {
  MixSearchProvider._({
    required MixSearchFamily super.from,
    required (String, SearchType) super.argument,
  }) : super(
         retry: null,
         name: r'mixSearchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mixSearchHash();

  @override
  String toString() {
    return r'mixSearchProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<MixSearchData> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MixSearchData> create(Ref ref) {
    final argument = this.argument as (String, SearchType);
    return mixSearch(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is MixSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mixSearchHash() => r'90a0a3ce5ff69ee66ef62064bde9eb326f138e68';

final class MixSearchFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<MixSearchData>,
          (String, SearchType)
        > {
  MixSearchFamily._()
    : super(
        retry: null,
        name: r'mixSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MixSearchProvider call(String query, SearchType type) =>
      MixSearchProvider._(argument: (query, type), from: this);

  @override
  String toString() => r'mixSearchProvider';
}
