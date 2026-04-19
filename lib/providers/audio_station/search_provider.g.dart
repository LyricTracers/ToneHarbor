// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MixSearch)
final mixSearchProvider = MixSearchFamily._();

final class MixSearchProvider
    extends $NotifierProvider<MixSearch, MixSearchData> {
  MixSearchProvider._({
    required MixSearchFamily super.from,
    required String super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  MixSearch create() => MixSearch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MixSearchData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MixSearchData>(value),
    );
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

String _$mixSearchHash() => r'86d6cca12db6073b496b77fafa47079a8d54d943';

final class MixSearchFamily extends $Family
    with
        $ClassFamilyOverride<
          MixSearch,
          MixSearchData,
          MixSearchData,
          MixSearchData,
          String
        > {
  MixSearchFamily._()
    : super(
        retry: null,
        name: r'mixSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MixSearchProvider call({required String query}) =>
      MixSearchProvider._(argument: query, from: this);

  @override
  String toString() => r'mixSearchProvider';
}

abstract class _$MixSearch extends $Notifier<MixSearchData> {
  late final _$args = ref.$arg as String;
  String get query => _$args;

  MixSearchData build({required String query});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MixSearchData, MixSearchData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MixSearchData, MixSearchData>,
              MixSearchData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(query: _$args));
  }
}

@ProviderFor(searchCloudHot)
final searchCloudHotProvider = SearchCloudHotProvider._();

final class SearchCloudHotProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>?>,
          List<String>?,
          FutureOr<List<String>?>
        >
    with $FutureModifier<List<String>?>, $FutureProvider<List<String>?> {
  SearchCloudHotProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchCloudHotProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchCloudHotHash();

  @$internal
  @override
  $FutureProviderElement<List<String>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>?> create(Ref ref) {
    return searchCloudHot(ref);
  }
}

String _$searchCloudHotHash() => r'2045ba891d67f07c80505d3e3d6c6182571daa4a';
