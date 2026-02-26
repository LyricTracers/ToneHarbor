// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

@ProviderFor(appLocalizations)
final appLocalizationsProvider = AppLocalizationsProvider._();

final class AppLocalizationsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppLocalizations>,
          AppLocalizations,
          FutureOr<AppLocalizations>
        >
    with $FutureModifier<AppLocalizations>, $FutureProvider<AppLocalizations> {
  AppLocalizationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLocalizationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLocalizationsHash();

  @$internal
  @override
  $FutureProviderElement<AppLocalizations> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppLocalizations> create(Ref ref) {
    return appLocalizations(ref);
  }
}

String _$appLocalizationsHash() => r'ab77246334990d5cf3f21f9587eaadf4bd5041e9';
