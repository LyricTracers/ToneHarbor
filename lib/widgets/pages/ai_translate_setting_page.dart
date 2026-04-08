import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/translate/translate_service.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
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

  Widget _platformSettings(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    final currentPlatform = ref.watch(aIPlatformSettingProvider);

    return Column(
      children: [
        buildDropdownTile(
          title: l10n.platform,
          items: AIPlatform.values,
          value: currentPlatform,
          colorScheme: colorScheme,
          multiplier: multiplier,
          labelBuilder: (p) => p.displayName,
          onChanged: (value) {
            if (value != null) {
              ref.read(aIPlatformSettingProvider.notifier).setPlatform(value);
              ref.read(aIEndpointSettingProvider.notifier).resetToDefault();
              ref
                  .read(aIModelSettingProvider.notifier)
                  .setModel(
                    PlatformConfigs.getConfig(value).builtInModels.isNotEmpty
                        ? PlatformConfigs.getConfig(value).builtInModels.first
                        : AIModel.glm4Flash250414,
                  );
            }
          },
        ),
      ],
    );
  }

  Widget _apiSettings(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    final platform = ref.watch(aIPlatformSettingProvider);
    final apiKey = ref.watch(aIApiKeyProvider);
    final needsApiKey = !platform.hasBuiltInApiKey;

    return Column(
      children: [
        if (needsApiKey) ...[
          ListTile(
            title: Text(
              l10n.api_key,
              style: TextStyle(
                fontSize: 15 * multiplier,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              apiKey != null && apiKey.isNotEmpty
                  ? '${apiKey.substring(0, 8)}...${apiKey.substring(apiKey.length - 4)}'
                  : l10n.not_configured,
              style: TextStyle(
                fontSize: 12 * multiplier,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
            onTap: () => _showApiKeyDialog(ref, colorScheme, l10n),
          ),
        ] else ...[
          ListTile(
            title: Text(
              l10n.api_key,
              style: TextStyle(
                fontSize: 15 * multiplier,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              'Built-in API Key',
              style: TextStyle(
                fontSize: 12 * multiplier,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            trailing: Icon(Icons.check_circle, size: 18, color: Colors.green),
          ),
        ],
      ],
    );
  }

  Widget _modelSettings(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    final platform = ref.watch(aIPlatformSettingProvider);
    final selectedModel = ref.watch(aIModelSettingProvider);
    final customModel = ref.watch(aICustomModelProvider);
    final availableModels = PlatformConfigs.getConfig(platform).builtInModels;

    return Column(
      children: [
        if (availableModels.isNotEmpty) ...[
          buildDropdownTile(
            title: l10n.model,
            items: availableModels,
            value: availableModels.contains(selectedModel)
                ? selectedModel
                : availableModels.first,
            colorScheme: colorScheme,
            multiplier: multiplier,
            labelBuilder: (m) => m.displayName,
            onChanged: (value) {
              if (value != null) {
                ref.read(aIModelSettingProvider.notifier).setModel(value);
              }
            },
          ),
        ] else ...[
          ListTile(
            title: Text(
              l10n.model,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              l10n.custom_model,
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
            onTap: () => _showCustomModelDialog(ref, colorScheme, l10n),
          ),
        ],
        if (selectedModel.isCustom) ...[
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
          value: ref.watch(aITargetLanguageSettingProvider),
          colorScheme: colorScheme,
          labelBuilder: (l) => '→ ${l.displayName}',
          multiplier: multiplier,
          onChanged: (value) {
            if (value != null) {
              ref
                  .read(aITargetLanguageSettingProvider.notifier)
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
    double multiplier,
  ) {
    return Column(
      children: [
        ListTile(
          title: Text(
            l10n.api_endpoint,
            style: TextStyle(
              fontSize: 15 * multiplier,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            ref.watch(aIEndpointSettingProvider),
            style: TextStyle(
              fontSize: 12 * multiplier,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          onTap: () => _showEndpointDialog(ref, colorScheme, l10n),
        ),
        _buildDivider(colorScheme),
        buildSliderTile(
          title: l10n.temperature,
          value: ref.watch(aITemperatureSettingProvider),
          onChanged: (value) {
            ref
                .read(aITemperatureSettingProvider.notifier)
                .setTemperature(value);
          },
          minValue: 0.0,
          maxValue: 2.0,
          multiplier: multiplier,
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
      text: ref.read(aIApiKeyProvider) ?? '',
    );

    showCommonDialog(
      context: ref.context,
      colorScheme: colorScheme,
      title: l10n.api_key,
      contentBuilder: (innerContext) {
        return TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: l10n.enter_api_key,
            border: const OutlineInputBorder(),
          ),
          obscureText: true,
        );
      },
      cancelText: l10n.cancel,
      confirmText: l10n.save,
      onConfirm: (innerContext) async {
        await ref.read(aIApiKeyProvider.notifier).setApiKey(controller.text);
      },
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

    showCommonDialog(
      context: ref.context,
      colorScheme: colorScheme,
      title: l10n.custom_model,
      contentBuilder: (innerContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Qwen/Qwen2.5-7B-Instruct, deepseek-chat, etc.',
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
        );
      },
      cancelText: l10n.cancel,
      confirmText: l10n.save,
      onConfirm: (innerContext) async {
        ref
            .read(aICustomModelProvider.notifier)
            .setCustomModel(controller.text);
      },
    );
  }

  void _showEndpointDialog(
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final controller = TextEditingController(
      text: ref.read(aIEndpointSettingProvider),
    );

    showCommonDialog(
      context: ref.context,
      colorScheme: colorScheme,
      title: l10n.api_endpoint,
      contentBuilder: (innerContext) {
        return TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'https://api.example.com/v1/chat/completions',
            border: const OutlineInputBorder(),
          ),
        );
      },
      cancelText: l10n.cancel,
      confirmText: l10n.save,
      thirdButtonText: l10n.reset_default,
      onConfirm: (innerContext) async {
        await ref
            .read(aIEndpointSettingProvider.notifier)
            .setEndpoint(controller.text);
      },
      onThirdButton: (innerContext) async {
        await ref.read(aIEndpointSettingProvider.notifier).resetToDefault();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier2;
    return Column(
      children: [
        buildAppBar(
          context,
          ref,
          l10n,
          colorScheme,
          l10n.ai_translate_settings,
          size,
        ),
        buildContent(context, ref, l10n, colorScheme, [
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.platform_settings,
            _platformSettings(ref, l10n, colorScheme, multiplier),
            multiplier,
          ),
          const SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.api_settings,
            _apiSettings(ref, l10n, colorScheme, multiplier),
            multiplier,
          ),
          const SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.model_settings,
            _modelSettings(ref, l10n, colorScheme, multiplier),
            multiplier,
          ),
          const SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.advanced_settings,
            _advancedSettings(ref, l10n, colorScheme, multiplier),
            multiplier,
          ),
        ]),
      ],
    );
  }
}
