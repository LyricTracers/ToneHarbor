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
    extends $AsyncNotifierProvider<MixSearch, MixSearchData> {
  MixSearchProvider._({
    required MixSearchFamily super.from,
    required ({String query, SearchType type}) super.argument,
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
  MixSearch create() => MixSearch();

  @override
  bool operator ==(Object other) {
    return other is MixSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mixSearchHash() => r'58ceba7a61cfba84338802790e02f620f4a56f16';

final class MixSearchFamily extends $Family
    with
        $ClassFamilyOverride<
          MixSearch,
          AsyncValue<MixSearchData>,
          MixSearchData,
          FutureOr<MixSearchData>,
          ({String query, SearchType type})
        > {
  MixSearchFamily._()
    : super(
        retry: null,
        name: r'mixSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MixSearchProvider call({
    required String query,
    SearchType type = SearchType.all,
  }) => MixSearchProvider._(argument: (query: query, type: type), from: this);

  @override
  String toString() => r'mixSearchProvider';
}

abstract class _$MixSearch extends $AsyncNotifier<MixSearchData> {
  late final _$args = ref.$arg as ({String query, SearchType type});
  String get query => _$args.query;
  SearchType get type => _$args.type;

  FutureOr<MixSearchData> build({
    required String query,
    SearchType type = SearchType.all,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<MixSearchData>, MixSearchData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MixSearchData>, MixSearchData>,
              AsyncValue<MixSearchData>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(query: _$args.query, type: _$args.type),
    );
  }
}
