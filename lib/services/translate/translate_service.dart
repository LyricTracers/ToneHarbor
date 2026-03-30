import 'dart:convert';

import 'package:rhttp/rhttp.dart';
import 'package:toneharbor/init/initialized.dart';

enum AIPlatform {
  zhipu('智谱', true),
  siliconflow('硅基流动', true),
  custom('自定义', false);

  final String displayName;
  final bool hasBuiltInApiKey;
  const AIPlatform(this.displayName, this.hasBuiltInApiKey);
}

class PlatformConfig {
  final String defaultEndpoint;
  final List<AIModel> builtInModels;
  final String? builtInApiKey;

  const PlatformConfig({
    required this.defaultEndpoint,
    this.builtInModels = const [],
    this.builtInApiKey,
  });
}

class PlatformConfigs {
  static const String zhipuBuiltInApiKey =
      '48e673dfc1e74f14a5138449188fbe72.6ikVQcvReyFc8i1n';
  static const String siliconflowBuiltInApiKey =
      'sk-pvwbojahqwxykwrvrdtdlmpkglmjktiajbvgjrixfspiuqty';

  static const Map<AIPlatform, PlatformConfig> configs = {
    AIPlatform.zhipu: PlatformConfig(
      defaultEndpoint: 'https://open.bigmodel.cn/api/paas/v4/chat/completions',
      builtInModels: [
        AIModel.glm4Flash250414,
        AIModel.glm4_5Flash,
        AIModel.glm4_7Flash,
        AIModel.glm4_6Flash,
      ],
      builtInApiKey: zhipuBuiltInApiKey,
    ),
    AIPlatform.siliconflow: PlatformConfig(
      defaultEndpoint: 'https://api.siliconflow.cn/v1/chat/completions',
      builtInModels: [
        AIModel.qwen2_5_7BInstruct,
        AIModel.qwen3_8B,
        AIModel.qwen3_5_4B,
      ],
      builtInApiKey: siliconflowBuiltInApiKey,
    ),
    AIPlatform.custom: PlatformConfig(defaultEndpoint: '', builtInModels: []),
  };

  static PlatformConfig getConfig(AIPlatform platform) {
    return configs[platform]!;
  }
}

enum AIModel {
  // Zhipu models (free)
  glm4_7Flash('glm-4.7-flash', 'GLM-4.7-Flash', AIPlatform.zhipu),
  glm4_6Flash('glm-4.6-flash', 'GLM-4.6-Flash', AIPlatform.zhipu),
  glm4Flash250414('glm-4-flash-250414', 'GLM-4-Flash-250414', AIPlatform.zhipu),
  glm4_5Flash('glm-4.5-flash', 'GLM-4.5-Flash', AIPlatform.zhipu),

  // SiliconFlow models (free)
  qwen2_5_7BInstruct(
    'Qwen/Qwen2.5-7B-Instruct',
    'Qwen2.5-7B-Instruct',
    AIPlatform.siliconflow,
  ),
  qwen3_8B('Qwen/Qwen3-8B', 'Qwen3-8B', AIPlatform.siliconflow),
  qwen3_5_4B('Qwen/Qwen3.5-4B', 'Qwen3.5-4B', AIPlatform.siliconflow),

  // Custom
  custom('custom', '自定义模型', AIPlatform.custom);

  final String value;
  final String displayName;
  final AIPlatform platform;
  const AIModel(this.value, this.displayName, this.platform);

  bool get isCustom => platform == AIPlatform.custom;
}

enum TranslateTargetLanguage {
  simplifiedChinese,
  english;

  String get displayName {
    switch (this) {
      case TranslateTargetLanguage.simplifiedChinese:
        return '简体中文';
      case TranslateTargetLanguage.english:
        return 'English';
    }
  }

  String get queryLanguageName {
    switch (this) {
      case TranslateTargetLanguage.simplifiedChinese:
        return 'Simplified Chinese';
      case TranslateTargetLanguage.english:
        return 'English';
    }
  }
}

enum ChatRole { system, user, assistant }

class ChatMessage {
  final ChatRole role;
  final String content;

  const ChatMessage({required this.role, required this.content});

  Map<String, String> toJson() => {'role': role.name, 'content': content};
}

class TranslateService {
  static const String defaultEndpoint =
      'https://open.bigmodel.cn/api/paas/v4/chat/completions';

  static const String _translationSystemPrompt = '''
You are a translation expert proficient in various languages, specializing in song lyrics translation. You accurately understand the meanings of proper nouns, idioms, metaphors, allusions, and other obscure words in sentences, translating them appropriately based on the context and language environment. The translation should be natural, fluent, and poetic when appropriate. Only return the translated text, without including redundant quotes or additional notes.

Important rules for lyrics translation:
1. Preserve all timing tags (like [00:00.00]) exactly as they appear
2. Maintain the original line breaks and structure
3. Keep the rhythm and flow suitable for singing when possible
4. Translate the meaning and emotion, not word-by-word
5. Keep original English words/names if they are commonly used as is in the target language''';

  final String apiKey;
  final AIPlatform platform;
  final String endpoint;
  final AIModel model;
  final String? customModel;
  final double temperature;

  TranslateService({
    required this.apiKey,
    required this.platform,
    required this.endpoint,
    this.model = AIModel.glm4Flash250414,
    this.customModel,
    this.temperature = 0.3,
  });

  String get _modelValue {
    if (model.isCustom && customModel != null && customModel!.isNotEmpty) {
      return customModel!;
    }
    return model.value;
  }

  bool get hasApiKey => apiKey.isNotEmpty;

  List<AIModel> get availableModels =>
      PlatformConfigs.getConfig(platform).builtInModels;

  Future<String> translate(
    String text, {
    TranslateTargetLanguage target = TranslateTargetLanguage.simplifiedChinese,
    CancelToken? cancelToken,
  }) async {
    if (!hasApiKey) {
      throw TranslateException(
        type: TranslateErrorType.missingApiKey,
        message: 'AI API key is not configured',
      );
    }

    if (text.trim().isEmpty) {
      throw TranslateException(
        type: TranslateErrorType.emptyInput,
        message: 'Text is empty',
      );
    }

    final messages = _buildChatMessages(text, target);

    try {
      final response = await translateHttpClientWrapper.post(
        endpoint,
        body: HttpBody.json({
          'model': _modelValue,
          'messages': messages.map((m) => m.toJson()).toList(),
          'temperature': temperature,
        }),
        headers: HttpHeaders.rawMap({
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        }),
        cancelToken: cancelToken,
      );

      if (response.statusCode != 200) {
        throw TranslateException(
          type: TranslateErrorType.apiError,
          message: 'API request failed with status ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }

      final body = response.body;
      final json = jsonDecode(body) as Map<String, dynamic>;
      final content = json['choices']?[0]?['message']?['content'] as String?;

      if (content == null || content.isEmpty) {
        throw TranslateException(
          type: TranslateErrorType.emptyResult,
          message: 'Empty translation result',
        );
      }

      logger.i('[TranslateService] Translated successfully');
      return content.trim();
    } on TranslateException {
      rethrow;
    } catch (e) {
      logger.e('[TranslateService] Translation failed: $e');
      throw TranslateException(
        type: TranslateErrorType.unknown,
        message: e.toString(),
      );
    }
  }

  List<ChatMessage> _buildChatMessages(
    String text,
    TranslateTargetLanguage target,
  ) {
    final targetLanguageName = target.queryLanguageName;

    return [
      const ChatMessage(
        role: ChatRole.system,
        content: _translationSystemPrompt,
      ),
      ..._fewShotExamples(target),
      ChatMessage(
        role: ChatRole.user,
        content:
            'Translate the following lyrics into $targetLanguageName:\n"""$text"""',
      ),
    ];
  }

  List<ChatMessage> _fewShotExamples(TranslateTargetLanguage target) {
    if (target == TranslateTargetLanguage.simplifiedChinese) {
      return [
        const ChatMessage(
          role: ChatRole.user,
          content:
              'Translate the following lyrics into Simplified Chinese:\n"""[00:12.00]Hello, it\'s me\n[00:15.00]I was wondering if after all these years you\'d like to meet"""',
        ),
        const ChatMessage(
          role: ChatRole.assistant,
          content: '[00:12.00]你好，是我\n[00:15.00]我在想这么多年过去，你是否愿意见上一面',
        ),
        const ChatMessage(
          role: ChatRole.user,
          content:
              'Translate the following lyrics into Simplified Chinese:\n"""Take me to your heart\nTake me to your soul"""',
        ),
        const ChatMessage(
          role: ChatRole.assistant,
          content: '让我靠近你的心\n让我走进你的灵魂',
        ),
      ];
    }

    return [
      const ChatMessage(
        role: ChatRole.user,
        content:
            'Translate the following lyrics into English:\n"""[00:00.00]后来\n[00:05.00]我总算学会了如何去爱"""',
      ),
      const ChatMessage(
        role: ChatRole.assistant,
        content: '[00:00.00]Later\n[00:05.00]I finally learned how to love',
      ),
    ];
  }
}

enum TranslateErrorType {
  missingApiKey,
  emptyInput,
  apiError,
  invalidResponse,
  emptyResult,
  unknown,
}

class TranslateException implements Exception {
  final TranslateErrorType type;
  final String message;
  final int? statusCode;

  const TranslateException({
    required this.type,
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => 'TranslateException($type): $message';
}
