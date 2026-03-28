import 'dart:async';

import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/services/translate/translate_service.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'translate_provider.g.dart';

@riverpod
class ZhipuApiKey extends _$ZhipuApiKey {
  @override
  String? build() {
    return SharedPreferencesUtils.getZhipuApiKey();
  }

  Future<void> setApiKey(String key) async {
    await SharedPreferencesUtils.setZhipuApiKey(key);
    state = key.isEmpty ? null : key;
  }

  Future<void> clearApiKey() async {
    await SharedPreferencesUtils.setZhipuApiKey('');
    state = null;
  }
}

@riverpod
class ZhipuModelSetting extends _$ZhipuModelSetting {
  @override
  ZhipuModel build() {
    final savedIndex = SharedPreferencesUtils.getZhipuModel();
    if (savedIndex != null && savedIndex < ZhipuModel.values.length) {
      return ZhipuModel.values[savedIndex];
    }
    return ZhipuModel.glm4Flash250414;
  }

  Future<void> setModel(ZhipuModel model) async {
    await SharedPreferencesUtils.setZhipuModel(model.index);
    state = model;
  }
}

@riverpod
class ZhipuEndpointSetting extends _$ZhipuEndpointSetting {
  @override
  String build() {
    return SharedPreferencesUtils.getZhipuEndpoint() ??
        TranslateService.defaultEndpoint;
  }

  Future<void> setEndpoint(String endpoint) async {
    await SharedPreferencesUtils.setZhipuEndpoint(endpoint);
    state = endpoint;
  }

  Future<void> resetToDefault() async {
    await SharedPreferencesUtils.setZhipuEndpoint(
      TranslateService.defaultEndpoint,
    );
    state = TranslateService.defaultEndpoint;
  }
}

@riverpod
class ZhipuTemperatureSetting extends _$ZhipuTemperatureSetting {
  @override
  double build() {
    return SharedPreferencesUtils.getZhipuTemperature() ?? 0.3;
  }

  Future<void> setTemperature(double value) async {
    final clampedValue = value.clamp(0.0, 2.0);
    await SharedPreferencesUtils.setZhipuTemperature(clampedValue);
    state = clampedValue;
  }
}

@riverpod
class ZhipuTargetLanguageSetting extends _$ZhipuTargetLanguageSetting {
  @override
  TranslateTargetLanguage build() {
    final savedIndex = SharedPreferencesUtils.getZhipuTargetLanguage();
    if (savedIndex != null &&
        savedIndex < TranslateTargetLanguage.values.length) {
      return TranslateTargetLanguage.values[savedIndex];
    }
    return TranslateTargetLanguage.simplifiedChinese;
  }

  Future<void> setTargetLanguage(TranslateTargetLanguage language) async {
    await SharedPreferencesUtils.setZhipuTargetLanguage(language.index);
    state = language;
  }
}

@riverpod
TranslateService translateService(Ref ref) {
  final apiKey = ref.watch(zhipuApiKeyProvider) ?? '';
  final model = ref.watch(zhipuModelSettingProvider);
  final endpoint = ref.watch(zhipuEndpointSettingProvider);
  final temperature = ref.watch(zhipuTemperatureSettingProvider);

  return TranslateService(
    apiKey: apiKey,
    model: model,
    endpoint: endpoint,
    temperature: temperature,
  );
}

@riverpod
class TranslateText extends _$TranslateText {
  CancelToken? _cancelToken;

  @override
  FutureOr<String?> build() {
    ref.keepAliveFor(Duration(minutes: 5));
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
