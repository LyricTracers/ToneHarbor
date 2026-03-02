// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RequestFlag)
final requestFlagProvider = RequestFlagProvider._();

final class RequestFlagProvider extends $NotifierProvider<RequestFlag, bool> {
  RequestFlagProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'requestFlagProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$requestFlagHash();

  @$internal
  @override
  RequestFlag create() => RequestFlag();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$requestFlagHash() => r'e2dbd48ea8bbe2c0f9098f62a1301d06aba6e723';

abstract class _$RequestFlag extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(LocaleNotifier)
final localeProvider = LocaleNotifierProvider._();

final class LocaleNotifierProvider
    extends $AsyncNotifierProvider<LocaleNotifier, Locale> {
  LocaleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeNotifierHash();

  @$internal
  @override
  LocaleNotifier create() => LocaleNotifier();
}

String _$localeNotifierHash() => r'874e14067866ecbc319a40adbec51455f7220ea1';

abstract class _$LocaleNotifier extends $AsyncNotifier<Locale> {
  FutureOr<Locale> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Locale>, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Locale>, Locale>,
              AsyncValue<Locale>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SearchHistoryNotifier)
final searchHistoryProvider = SearchHistoryNotifierProvider._();

final class SearchHistoryNotifierProvider
    extends $AsyncNotifierProvider<SearchHistoryNotifier, List<String>> {
  SearchHistoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchHistoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchHistoryNotifierHash();

  @$internal
  @override
  SearchHistoryNotifier create() => SearchHistoryNotifier();
}

String _$searchHistoryNotifierHash() =>
    r'0966461be9606f31e486605e6d630be754b169c9';

abstract class _$SearchHistoryNotifier extends $AsyncNotifier<List<String>> {
  FutureOr<List<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(l10n)
final l10nProvider = L10nProvider._();

final class L10nProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppLocalizations>,
          AppLocalizations,
          FutureOr<AppLocalizations>
        >
    with $FutureModifier<AppLocalizations>, $FutureProvider<AppLocalizations> {
  L10nProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'l10nProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$l10nHash();

  @$internal
  @override
  $FutureProviderElement<AppLocalizations> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppLocalizations> create(Ref ref) {
    return l10n(ref);
  }
}

String _$l10nHash() => r'35621e807409bd495177e23680254c38dffef3e4';
