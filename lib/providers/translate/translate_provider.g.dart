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

String _$aIModelSettingHash() => r'9d8b9f29eb38ea1da48221c164451cf0d63f53d4';

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

String _$translateServiceHash() => r'b8f3474c2b9c736d3b2697d780c24bee9e47b594';

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
