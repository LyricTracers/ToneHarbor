// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MixSearchResults)
final mixSearchResultsProvider = MixSearchResultsProvider._();

final class MixSearchResultsProvider
    extends $NotifierProvider<MixSearchResults, MixSearchData?> {
  MixSearchResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mixSearchResultsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mixSearchResultsHash();

  @$internal
  @override
  MixSearchResults create() => MixSearchResults();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MixSearchData? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MixSearchData?>(value),
    );
  }
}

String _$mixSearchResultsHash() => r'a292a3318b799000723828698d196d2f7ebf03d4';

abstract class _$MixSearchResults extends $Notifier<MixSearchData?> {
  MixSearchData? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MixSearchData?, MixSearchData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MixSearchData?, MixSearchData?>,
              MixSearchData?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
