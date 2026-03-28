import 'dart:convert';

import 'package:rhttp/rhttp.dart';
import 'package:toneharbor/init/initialized.dart';

enum ZhipuModel {
  glm5('glm-5', 'GLM-5'),
  glm4_7('glm-4.7', 'GLM-4.7'),
  glm4_7Flash('glm-4.7-flash', 'GLM-4.7-Flash (免费)'),
  glm4_7Flashx('glm-4.7-flashx', 'GLM-4.7-FlashX'),
  glm4_5Air('glm-4.5-air', 'GLM-4.5-Air'),
  glm4Flash250414('glm-4-flash-250414', 'GLM-4-Flash-250414 (免费)'),
  glm4Flashx250414('glm-4-flashx-250414', 'GLM-4-FlashX-250414');

  final String value;
  final String displayName;
  const ZhipuModel(this.value, this.displayName);
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
  final String endpoint;
  final ZhipuModel model;
  final double temperature;

  TranslateService({
    required this.apiKey,
    this.endpoint = defaultEndpoint,
    this.model = ZhipuModel.glm4Flash250414,
    this.temperature = 0.3,
  });

  bool get hasApiKey => apiKey.isNotEmpty;

  Future<String> translate(
    String text, {
    TranslateTargetLanguage target = TranslateTargetLanguage.simplifiedChinese,
  }) async {
    if (!hasApiKey) {
      throw TranslateException(
        type: TranslateErrorType.missingApiKey,
        message: 'ZhipuAI API key is not configured',
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
      final response = await httpClientWrapper.post(
        endpoint,
        body: HttpBody.json({
          'model': model.value,
          'messages': messages.map((m) => m.toJson()).toList(),
          'temperature': temperature,
        }),
        headers: HttpHeaders.rawMap({
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        }),
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
