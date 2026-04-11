// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LyricDoubleClick)
final lyricDoubleClickProvider = LyricDoubleClickProvider._();

final class LyricDoubleClickProvider
    extends $NotifierProvider<LyricDoubleClick, LyricsDoubleClickAction> {
  LyricDoubleClickProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lyricDoubleClickProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lyricDoubleClickHash();

  @$internal
  @override
  LyricDoubleClick create() => LyricDoubleClick();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LyricsDoubleClickAction value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LyricsDoubleClickAction>(value),
    );
  }
}

String _$lyricDoubleClickHash() => r'817648f92135bc82c4dc993dadb350351b6aa009';

abstract class _$LyricDoubleClick extends $Notifier<LyricsDoubleClickAction> {
  LyricsDoubleClickAction build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<LyricsDoubleClickAction, LyricsDoubleClickAction>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LyricsDoubleClickAction, LyricsDoubleClickAction>,
              LyricsDoubleClickAction,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

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
    r'7d1e4cec50e0be36c8d03a9f56feb7d64eb3fec1';

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

@ProviderFor(StatusBarLyric)
final statusBarLyricProvider = StatusBarLyricProvider._();

final class StatusBarLyricProvider
    extends $NotifierProvider<StatusBarLyric, bool> {
  StatusBarLyricProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statusBarLyricProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statusBarLyricHash();

  @$internal
  @override
  StatusBarLyric create() => StatusBarLyric();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$statusBarLyricHash() => r'9ad21f513b00c6f849e1eb193ad12877b865b7ef';

abstract class _$StatusBarLyric extends $Notifier<bool> {
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

@ProviderFor(NormalizeAudio)
final normalizeAudioProvider = NormalizeAudioProvider._();

final class NormalizeAudioProvider
    extends $NotifierProvider<NormalizeAudio, bool> {
  NormalizeAudioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'normalizeAudioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$normalizeAudioHash();

  @$internal
  @override
  NormalizeAudio create() => NormalizeAudio();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$normalizeAudioHash() => r'33da9653a17731ed959603259b61dab9e90f5126';

abstract class _$NormalizeAudio extends $Notifier<bool> {
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

@ProviderFor(TrayFontSize)
final trayFontSizeProvider = TrayFontSizeProvider._();

final class TrayFontSizeProvider
    extends $NotifierProvider<TrayFontSize, double> {
  TrayFontSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trayFontSizeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trayFontSizeHash();

  @$internal
  @override
  TrayFontSize create() => TrayFontSize();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$trayFontSizeHash() => r'80113bb9f42702d8fbd26a4988087e16280fd535';

abstract class _$TrayFontSize extends $Notifier<double> {
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

@ProviderFor(CloudMusicApiUrls)
final cloudMusicApiUrlsProvider = CloudMusicApiUrlsProvider._();

final class CloudMusicApiUrlsProvider
    extends $NotifierProvider<CloudMusicApiUrls, CloudMusicApiState> {
  CloudMusicApiUrlsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudMusicApiUrlsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudMusicApiUrlsHash();

  @$internal
  @override
  CloudMusicApiUrls create() => CloudMusicApiUrls();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CloudMusicApiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CloudMusicApiState>(value),
    );
  }
}

String _$cloudMusicApiUrlsHash() => r'7d5cdf2d14524545d8a4ecf8ebf6cb3372445e4c';

abstract class _$CloudMusicApiUrls extends $Notifier<CloudMusicApiState> {
  CloudMusicApiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CloudMusicApiState, CloudMusicApiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CloudMusicApiState, CloudMusicApiState>,
              CloudMusicApiState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CloudMusicLanguage)
final cloudMusicLanguageProvider = CloudMusicLanguageProvider._();

final class CloudMusicLanguageProvider
    extends $NotifierProvider<CloudMusicLanguage, CloudMusicLanguageType> {
  CloudMusicLanguageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudMusicLanguageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudMusicLanguageHash();

  @$internal
  @override
  CloudMusicLanguage create() => CloudMusicLanguage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CloudMusicLanguageType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CloudMusicLanguageType>(value),
    );
  }
}

String _$cloudMusicLanguageHash() =>
    r'59a542896076cd25f1153ce17c172ae113fb5d51';

abstract class _$CloudMusicLanguage extends $Notifier<CloudMusicLanguageType> {
  CloudMusicLanguageType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<CloudMusicLanguageType, CloudMusicLanguageType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CloudMusicLanguageType, CloudMusicLanguageType>,
              CloudMusicLanguageType,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CloudMusicAuthState)
final cloudMusicAuthStateProvider = CloudMusicAuthStateProvider._();

final class CloudMusicAuthStateProvider
    extends $NotifierProvider<CloudMusicAuthState, bool> {
  CloudMusicAuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudMusicAuthStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudMusicAuthStateHash();

  @$internal
  @override
  CloudMusicAuthState create() => CloudMusicAuthState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$cloudMusicAuthStateHash() =>
    r'90853d53f0e97c7540bd5a06063b489d098bcaee';

abstract class _$CloudMusicAuthState extends $Notifier<bool> {
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

@ProviderFor(CloudMusicCategory)
final cloudMusicCategoryProvider = CloudMusicCategoryProvider._();

final class CloudMusicCategoryProvider
    extends $NotifierProvider<CloudMusicCategory, List<String>> {
  CloudMusicCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudMusicCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudMusicCategoryHash();

  @$internal
  @override
  CloudMusicCategory create() => CloudMusicCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$cloudMusicCategoryHash() =>
    r'c5b03b41b2bc096777c69efbaa4c011664ca09ca';

abstract class _$CloudMusicCategory extends $Notifier<List<String>> {
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
