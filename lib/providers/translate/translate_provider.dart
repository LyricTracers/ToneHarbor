import 'dart:async';

import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/services/translate/translate_service.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'translate_provider.g.dart';

@riverpod
class AIPlatformSetting extends _$AIPlatformSetting {
  @override
  AIPlatform build() {
    final savedIndex = SharedPreferencesUtils.getAIPlatform();
    if (savedIndex != null && savedIndex < AIPlatform.values.length) {
      return AIPlatform.values[savedIndex];
    }
    return AIPlatform.zhipu;
  }

  Future<void> setPlatform(AIPlatform platform) async {
    await SharedPreferencesUtils.setAIPlatform(platform.index);
    state = platform;
  }
}

@riverpod
class AIApiKey extends _$AIApiKey {
  @override
  String? build() {
    return SharedPreferencesUtils.getAIApiKey();
  }

  Future<void> setApiKey(String key) async {
    await SharedPreferencesUtils.setAIApiKey(key);
    state = key.isEmpty ? null : key;
  }

  Future<void> clearApiKey() async {
    await SharedPreferencesUtils.setAIApiKey('');
    state = null;
  }
}

@riverpod
class AIModelSetting extends _$AIModelSetting {
  @override
  AIModel build() {
    final savedIndex = SharedPreferencesUtils.getAIModel();
    if (savedIndex != null && savedIndex < AIModel.values.length) {
      return AIModel.values[savedIndex];
    }
    return AIModel.glm4Flash250414;
  }

  Future<void> setModel(AIModel model) async {
    await SharedPreferencesUtils.setAIModel(model.index);
    state = model;
  }
}

@riverpod
class AICustomModel extends _$AICustomModel {
  @override
  String? build() {
    return SharedPreferencesUtils.getAICustomModel();
  }

  Future<void> setCustomModel(String model) async {
    await SharedPreferencesUtils.setAICustomModel(model);
    state = model.isEmpty ? null : model;
  }
}

@riverpod
class AIEndpointSetting extends _$AIEndpointSetting {
  @override
  String build() {
    final platform = SharedPreferencesUtils.getAIPlatform();
    final savedEndpoint = SharedPreferencesUtils.getAIEndpoint();
    if (savedEndpoint != null && savedEndpoint.isNotEmpty) {
      return savedEndpoint;
    }
    return PlatformConfigs.getConfig(
      platform != null && platform < AIPlatform.values.length
          ? AIPlatform.values[platform]
          : AIPlatform.zhipu,
    ).defaultEndpoint;
  }

  Future<void> setEndpoint(String endpoint) async {
    await SharedPreferencesUtils.setAIEndpoint(endpoint);
    state = endpoint;
  }

  Future<void> resetToDefault() async {
    final platform = SharedPreferencesUtils.getAIPlatform();
    final platformEnum = platform != null && platform < AIPlatform.values.length
        ? AIPlatform.values[platform]
        : AIPlatform.zhipu;
    final defaultEndpoint = PlatformConfigs.getConfig(
      platformEnum,
    ).defaultEndpoint;
    await SharedPreferencesUtils.setAIEndpoint(defaultEndpoint);
    state = defaultEndpoint;
  }
}

@riverpod
class AITemperatureSetting extends _$AITemperatureSetting {
  @override
  double build() {
    return SharedPreferencesUtils.getAITemperature() ?? 0.3;
  }

  Future<void> setTemperature(double value) async {
    final clampedValue = value.clamp(0.0, 2.0);
    await SharedPreferencesUtils.setAITemperature(clampedValue);
    state = clampedValue;
  }
}

@riverpod
class AITargetLanguageSetting extends _$AITargetLanguageSetting {
  @override
  TranslateTargetLanguage build() {
    final savedIndex = SharedPreferencesUtils.getAITargetLanguage();
    if (savedIndex != null &&
        savedIndex < TranslateTargetLanguage.values.length) {
      return TranslateTargetLanguage.values[savedIndex];
    }
    return TranslateTargetLanguage.simplifiedChinese;
  }

  Future<void> setTargetLanguage(TranslateTargetLanguage language) async {
    await SharedPreferencesUtils.setAITargetLanguage(language.index);
    state = language;
  }
}

@riverpod
TranslateService translateService(Ref ref) {
  final platform = ref.watch(aIPlatformSettingProvider);
  final userApiKey = ref.watch(aIApiKeyProvider) ?? '';
  final model = ref.watch(aIModelSettingProvider);
  final customModel = ref.watch(aICustomModelProvider);
  final endpoint = ref.watch(aIEndpointSettingProvider);
  final temperature = ref.watch(aITemperatureSettingProvider);

  final effectiveApiKey = platform.hasBuiltInApiKey
      ? PlatformConfigs.getConfig(platform).builtInApiKey ?? userApiKey
      : userApiKey;

  return TranslateService(
    apiKey: effectiveApiKey,
    platform: platform,
    endpoint: endpoint,
    model: model,
    customModel: customModel,
    temperature: temperature,
  );
}

@riverpod
class TranslateText extends _$TranslateText {
  CancelToken? _cancelToken;

  @override
  FutureOr<String?> build() {
    ref.keepAliveFor(Duration(minutes: 10));
    ref.onDispose(() {
      _cancelToken?.cancel();
    });
    return null;
  }

  Future<void> translate(
    String text, {
    TranslateTargetLanguage target = TranslateTargetLanguage.simplifiedChinese,
  }) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    state = const AsyncValue.loading();

    final service = ref.read(translateServiceProvider);

    state = await AsyncValue.guard(
      () => service.translate(text, target: target, cancelToken: _cancelToken),
    );
  }
}
