import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';

class SettingPage extends HookConsumerWidget with BuildItem {
  const SettingPage({super.key});

  Widget _theme(WidgetRef ref, AppLocalizations l10n, ColorScheme colorScheme) {
    return Column(
      children: [
        buildSwitchTile(
          '自动切换背景',
          '手动切换背景',
          '跟随歌曲封面',
          '长按封面设置背景',
          ref.watch(syncSongIconProvider),
          (value) =>
              ref.read(syncSongIconProvider.notifier).setSyncSongIcon(value),
          colorScheme,
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        buildDropdownTile(
          title: '配色方案',
          items: DynamicSchemeVariant.values,
          value: ref.watch(dynamicSchemeProvider),
          onChanged: (value) {
            if (value != null) {
              ref.read(dynamicSchemeProvider.notifier).setSchemeVariant(value);
            }
          },
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        buildSliderTile(
          title: '亮度对比度',
          value: ref.watch(contrastLevelProvider),
          onChanged: (value) =>
              ref.read(contrastLevelProvider.notifier).setContrastLevel(value),
          minValue: -1.0,
          maxValue: 1.0,
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget _account(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return ListTile(
      title: Text(
        ref.read(accountInfoProvider)?.account ?? '',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        ref.read(baseUrlProvider),
        style: TextStyle(
          fontSize: 12,
          color: colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
      leading: Icon(Icons.person, size: 24),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
      onTap: () {
        ref.context.push("/account");
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    return Column(
      children: [
        buildAppBar(context, ref, l10n, colorScheme, "设置"),
        buildContent(context, ref, l10n, colorScheme, [
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            "账号",
            _account(ref, l10n, colorScheme),
          ),
          SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            '主题设置',
            _theme(ref, l10n, colorScheme),
          ),
        ]),
      ],
    );
  }
}
