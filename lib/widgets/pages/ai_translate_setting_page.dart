import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/providers/translate/translate_provider.dart';
import 'package:toneharbor/services/translate/translate_service.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';

class AITranslateSettingPage extends HookConsumerWidget with BuildItem {
  const AITranslateSettingPage({super.key});

  Widget _buildDivider(ColorScheme colorScheme) {
    return Divider(
      height: 1,
      color: colorScheme.outline.withValues(alpha: 0.2),
      indent: 15,
      endIndent: 15,
    );
  }

  Widget _apiSettings(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    final apiKey = ref.watch(zhipuApiKeyProvider);

    return Column(
      children: [
        ListTile(
          title: Text(
            l10n.api_key,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            apiKey != null && apiKey.isNotEmpty
                ? '${apiKey.substring(0, 8)}...${apiKey.substring(apiKey.length - 4)}'
                : l10n.not_configured,
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          onTap: () => _showApiKeyDialog(ref, colorScheme, l10n),
        ),
      ],
    );
  }

  Widget _modelSettings(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    final selectedModel = ref.watch(aIModelSettingProvider);
    final customModel = ref.watch(aICustomModelProvider);

    return Column(
      children: [
        buildDropdownTile(
          title: l10n.model,
          items: AIModel.values,
          value: selectedModel,
          colorScheme: colorScheme,
          labelBuilder: (m) => m.displayName,
          onChanged: (value) {
            if (value != null) {
              ref.read(aIModelSettingProvider.notifier).setModel(value);
            }
          },
        ),
        if (selectedModel == AIModel.custom) ...[
          _buildDivider(colorScheme),
          ListTile(
            title: Text(
              l10n.custom_model,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              customModel ?? l10n.not_configured,
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
            onTap: () => _showCustomModelDialog(ref, colorScheme, l10n),
          ),
        ],
        _buildDivider(colorScheme),
        buildDropdownTile(
          title: l10n.default_target_language,
          items: TranslateTargetLanguage.values,
          value: ref.watch(zhipuTargetLanguageSettingProvider),
          colorScheme: colorScheme,
          labelBuilder: (l) => '→ ${l.displayName}',
          onChanged: (value) {
            if (value != null) {
              ref
                  .read(zhipuTargetLanguageSettingProvider.notifier)
                  .setTargetLanguage(value);
            }
          },
        ),
      ],
    );
  }

  Widget _advancedSettings(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return Column(
      children: [
        ListTile(
          title: Text(
            l10n.api_endpoint,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            ref.watch(zhipuEndpointSettingProvider),
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          onTap: () => _showEndpointDialog(ref, colorScheme, l10n),
        ),
        _buildDivider(colorScheme),
        buildSliderTile(
          title: l10n.temperature,
          value: ref.watch(zhipuTemperatureSettingProvider),
          onChanged: (value) {
            ref
                .read(zhipuTemperatureSettingProvider.notifier)
                .setTemperature(value);
          },
          minValue: 0.0,
          maxValue: 2.0,
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  void _showApiKeyDialog(
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final controller = TextEditingController(
      text: ref.read(zhipuApiKeyProvider) ?? '',
    );

    showDialog(
      context: ref.context,
      builder: (context) => AlertDialog(
        title: Text(
          l10n.api_key,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: l10n.enter_api_key,
            border: const OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              await ref
                  .read(zhipuApiKeyProvider.notifier)
                  .setApiKey(controller.text);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }

  void _showCustomModelDialog(
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final controller = TextEditingController(
      text: ref.read(aICustomModelProvider) ?? '',
    );

    showDialog(
      context: ref.context,
      builder: (context) => AlertDialog(
        title: Text(
          l10n.custom_model,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'gpt-4, deepseek-chat, etc.',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.custom_model_hint,
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(aICustomModelProvider.notifier)
                  .setCustomModel(controller.text);
              Navigator.pop(context);
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }

  void _showEndpointDialog(
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final controller = TextEditingController(
      text: ref.read(zhipuEndpointSettingProvider),
    );

    showDialog(
      context: ref.context,
      builder: (context) => AlertDialog(
        title: Text(
          l10n.api_endpoint,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: TranslateService.defaultEndpoint,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(zhipuEndpointSettingProvider.notifier)
                  .setEndpoint(controller.text);
              Navigator.pop(context);
            },
            child: Text(l10n.save),
          ),
          TextButton(
            onPressed: () {
              ref.read(zhipuEndpointSettingProvider.notifier).resetToDefault();
              Navigator.pop(context);
            },
            child: Text(l10n.reset_default),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);

    return Column(
      children: [
        buildAppBar(
          context,
          ref,
          l10n,
          colorScheme,
          l10n.ai_translate_settings,
        ),
        buildContent(context, ref, l10n, colorScheme, [
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.api_settings,
            _apiSettings(ref, l10n, colorScheme),
          ),
          const SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.model_settings,
            _modelSettings(ref, l10n, colorScheme),
          ),
          const SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.advanced_settings,
            _advancedSettings(ref, l10n, colorScheme),
          ),
        ]),
      ],
    );
  }
}
