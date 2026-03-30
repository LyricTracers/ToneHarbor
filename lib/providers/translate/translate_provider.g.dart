// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AIPlatformSetting)
final aIPlatformSettingProvider = AIPlatformSettingProvider._();

final class AIPlatformSettingProvider
    extends $NotifierProvider<AIPlatformSetting, AIPlatform> {
  AIPlatformSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aIPlatformSettingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aIPlatformSettingHash();

  @$internal
  @override
  AIPlatformSetting create() => AIPlatformSetting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AIPlatform value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AIPlatform>(value),
    );
  }
}

String _$aIPlatformSettingHash() => r'aedf1d5d2e3d85315224b0f212b0665144ce910f';

abstract class _$AIPlatformSetting extends $Notifier<AIPlatform> {
  AIPlatform build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AIPlatform, AIPlatform>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AIPlatform, AIPlatform>,
              AIPlatform,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AIApiKey)
final aIApiKeyProvider = AIApiKeyProvider._();

final class AIApiKeyProvider extends $NotifierProvider<AIApiKey, String?> {
  AIApiKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aIApiKeyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aIApiKeyHash();

  @$internal
  @override
  AIApiKey create() => AIApiKey();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$aIApiKeyHash() => r'18d6ec1d9bc8ac9374fed2274813955aa4c6af33';

abstract class _$AIApiKey extends $Notifier<String?> {
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

@ProviderFor(AIModelSetting)
final aIModelSettingProvider = AIModelSettingProvider._();

final class AIModelSettingProvider
    extends $NotifierProvider<AIModelSetting, AIModel> {
  AIModelSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aIModelSettingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aIModelSettingHash();

  @$internal
  @override
  AIModelSetting create() => AIModelSetting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AIModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AIModel>(value),
    );
  }
}

String _$aIModelSettingHash() => r'be05e1c455d939c21fe4fd7f7166674056c7deac';

abstract class _$AIModelSetting extends $Notifier<AIModel> {
  AIModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AIModel, AIModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AIModel, AIModel>,
              AIModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AICustomModel)
final aICustomModelProvider = AICustomModelProvider._();

final class AICustomModelProvider
    extends $NotifierProvider<AICustomModel, String?> {
  AICustomModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aICustomModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aICustomModelHash();

  @$internal
  @override
  AICustomModel create() => AICustomModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$aICustomModelHash() => r'46c1299a8668c3b59189e5e709fd678922a08ba9';

abstract class _$AICustomModel extends $Notifier<String?> {
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

@ProviderFor(AIEndpointSetting)
final aIEndpointSettingProvider = AIEndpointSettingProvider._();

final class AIEndpointSettingProvider
    extends $NotifierProvider<AIEndpointSetting, String> {
  AIEndpointSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aIEndpointSettingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aIEndpointSettingHash();

  @$internal
  @override
  AIEndpointSetting create() => AIEndpointSetting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$aIEndpointSettingHash() => r'794ce099713bb01c44676eecf4dd6284595d03a3';

abstract class _$AIEndpointSetting extends $Notifier<String> {
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

@ProviderFor(AITemperatureSetting)
final aITemperatureSettingProvider = AITemperatureSettingProvider._();

final class AITemperatureSettingProvider
    extends $NotifierProvider<AITemperatureSetting, double> {
  AITemperatureSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aITemperatureSettingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aITemperatureSettingHash();

  @$internal
  @override
  AITemperatureSetting create() => AITemperatureSetting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$aITemperatureSettingHash() =>
    r'bf5a8161cceff828ee44036ef61c02f5309e6851';

abstract class _$AITemperatureSetting extends $Notifier<double> {
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

@ProviderFor(AITargetLanguageSetting)
final aITargetLanguageSettingProvider = AITargetLanguageSettingProvider._();

final class AITargetLanguageSettingProvider
    extends
        $NotifierProvider<AITargetLanguageSetting, TranslateTargetLanguage> {
  AITargetLanguageSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aITargetLanguageSettingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aITargetLanguageSettingHash();

  @$internal
  @override
  AITargetLanguageSetting create() => AITargetLanguageSetting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TranslateTargetLanguage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TranslateTargetLanguage>(value),
    );
  }
}

String _$aITargetLanguageSettingHash() =>
    r'16879a3af68108575598256db7b54ccbb7d7e636';

abstract class _$AITargetLanguageSetting
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

String _$translateServiceHash() => r'b2263a102fe346f6fa7add2eaac24555bce44031';

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

String _$translateTextHash() => r'e5cd079f14c7e0d85dd8206d40f6af1901f322fb';

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
