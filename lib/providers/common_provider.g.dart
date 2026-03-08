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
        isAutoDispose: true,
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

String _$requestFlagHash() => r'48979857bd3627fa81f0747f453efb30ad525a1c';

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
    extends $NotifierProvider<LocaleNotifier, Locale> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$localeNotifierHash() => r'4a3b2a6f3928bf80bd29a81ffb96c6c56f5be8d0';

abstract class _$LocaleNotifier extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SearchHistoryNotifier)
final searchHistoryProvider = SearchHistoryNotifierProvider._();

final class SearchHistoryNotifierProvider
    extends $NotifierProvider<SearchHistoryNotifier, List<String>> {
  SearchHistoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchHistoryNotifierHash();

  @$internal
  @override
  SearchHistoryNotifier create() => SearchHistoryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$searchHistoryNotifierHash() =>
    r'f464b85b4e16cfb557b55894bf0d18b75462b66a';

abstract class _$SearchHistoryNotifier extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
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
          AppLocalizations,
          AppLocalizations,
          AppLocalizations
        >
    with $Provider<AppLocalizations> {
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
  $ProviderElement<AppLocalizations> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppLocalizations create(Ref ref) {
    return l10n(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLocalizations value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLocalizations>(value),
    );
  }
}

String _$l10nHash() => r'c9a40ac4f6cc3b76e8a2c47c6b75db724026e3b9';

@ProviderFor(VolumeNotifier)
final volumeProvider = VolumeNotifierProvider._();

final class VolumeNotifierProvider
    extends $NotifierProvider<VolumeNotifier, double> {
  VolumeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'volumeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$volumeNotifierHash();

  @$internal
  @override
  VolumeNotifier create() => VolumeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$volumeNotifierHash() => r'280a0130e433d512ba89825679ba8af7225cef12';

abstract class _$VolumeNotifier extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AudioQualityNotifier)
final audioQualityProvider = AudioQualityNotifierProvider._();

final class AudioQualityNotifierProvider
    extends $NotifierProvider<AudioQualityNotifier, AudioQuality> {
  AudioQualityNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioQualityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioQualityNotifierHash();

  @$internal
  @override
  AudioQualityNotifier create() => AudioQualityNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudioQuality value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudioQuality>(value),
    );
  }
}

String _$audioQualityNotifierHash() =>
    r'0af6f8744337c9617b03d6bee649af25dcaa9e12';

abstract class _$AudioQualityNotifier extends $Notifier<AudioQuality> {
  AudioQuality build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AudioQuality, AudioQuality>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AudioQuality, AudioQuality>,
              AudioQuality,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
