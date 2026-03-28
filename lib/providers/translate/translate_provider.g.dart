// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ZhipuApiKey)
final zhipuApiKeyProvider = ZhipuApiKeyProvider._();

final class ZhipuApiKeyProvider
    extends $NotifierProvider<ZhipuApiKey, String?> {
  ZhipuApiKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'zhipuApiKeyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$zhipuApiKeyHash();

  @$internal
  @override
  ZhipuApiKey create() => ZhipuApiKey();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$zhipuApiKeyHash() => r'5c3265790c14c58455951da395f609f3a521b600';

abstract class _$ZhipuApiKey extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ZhipuModelSetting)
final zhipuModelSettingProvider = ZhipuModelSettingProvider._();

final class ZhipuModelSettingProvider
    extends $NotifierProvider<ZhipuModelSetting, ZhipuModel> {
  ZhipuModelSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'zhipuModelSettingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$zhipuModelSettingHash();

  @$internal
  @override
  ZhipuModelSetting create() => ZhipuModelSetting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ZhipuModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ZhipuModel>(value),
    );
  }
}

String _$zhipuModelSettingHash() => r'6c956f429dbe2d886873a252bfdaadf8703641ff';

abstract class _$ZhipuModelSetting extends $Notifier<ZhipuModel> {
  ZhipuModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ZhipuModel, ZhipuModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ZhipuModel, ZhipuModel>,
              ZhipuModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ZhipuEndpointSetting)
final zhipuEndpointSettingProvider = ZhipuEndpointSettingProvider._();

final class ZhipuEndpointSettingProvider
    extends $NotifierProvider<ZhipuEndpointSetting, String> {
  ZhipuEndpointSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'zhipuEndpointSettingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$zhipuEndpointSettingHash();

  @$internal
  @override
  ZhipuEndpointSetting create() => ZhipuEndpointSetting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$zhipuEndpointSettingHash() =>
    r'53958d131e94ffcff37ac3ea603bae18bf95bf71';

abstract class _$ZhipuEndpointSetting extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ZhipuTemperatureSetting)
final zhipuTemperatureSettingProvider = ZhipuTemperatureSettingProvider._();

final class ZhipuTemperatureSettingProvider
    extends $NotifierProvider<ZhipuTemperatureSetting, double> {
  ZhipuTemperatureSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'zhipuTemperatureSettingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$zhipuTemperatureSettingHash();

  @$internal
  @override
  ZhipuTemperatureSetting create() => ZhipuTemperatureSetting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$zhipuTemperatureSettingHash() =>
    r'8a115b3a753aa1e6faf1a01c376fbc440e72de6c';

abstract class _$ZhipuTemperatureSetting extends $Notifier<double> {
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

@ProviderFor(ZhipuTargetLanguageSetting)
final zhipuTargetLanguageSettingProvider =
    ZhipuTargetLanguageSettingProvider._();

final class ZhipuTargetLanguageSettingProvider
    extends
        $NotifierProvider<ZhipuTargetLanguageSetting, TranslateTargetLanguage> {
  ZhipuTargetLanguageSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'zhipuTargetLanguageSettingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$zhipuTargetLanguageSettingHash();

  @$internal
  @override
  ZhipuTargetLanguageSetting create() => ZhipuTargetLanguageSetting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TranslateTargetLanguage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TranslateTargetLanguage>(value),
    );
  }
}

String _$zhipuTargetLanguageSettingHash() =>
    r'2ca27e20c7724e2ba3ecc85fc0b84967fec83684';

abstract class _$ZhipuTargetLanguageSetting
    extends $Notifier<TranslateTargetLanguage> {
  TranslateTargetLanguage build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<TranslateTargetLanguage, TranslateTargetLanguage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TranslateTargetLanguage, TranslateTargetLanguage>,
              TranslateTargetLanguage,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(translateService)
final translateServiceProvider = TranslateServiceProvider._();

final class TranslateServiceProvider
    extends
        $FunctionalProvider<
          TranslateService,
          TranslateService,
          TranslateService
        >
    with $Provider<TranslateService> {
  TranslateServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'translateServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$translateServiceHash();

  @$internal
  @override
  $ProviderElement<TranslateService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TranslateService create(Ref ref) {
    return translateService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TranslateService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TranslateService>(value),
    );
  }
}

String _$translateServiceHash() => r'5c83c81cba463f6b01680471c1582035ca74bfeb';

@ProviderFor(TranslateText)
final translateTextProvider = TranslateTextProvider._();

final class TranslateTextProvider
    extends $AsyncNotifierProvider<TranslateText, String?> {
  TranslateTextProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'translateTextProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$translateTextHash();

  @$internal
  @override
  TranslateText create() => TranslateText();
}

String _$translateTextHash() => r'b496dbf85d06e36c15c380620b55164871704256';

abstract class _$TranslateText extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
