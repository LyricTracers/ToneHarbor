import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  Widget buildAppBar(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return AppBar(
      title: Text(
        "设置",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
    );
  }

  Widget _buildSectionTitle(String title, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: colorScheme.secondary,
        ),
      ),
    );
  }

  Widget _buildDropdownTile<T>({
    required String title,
    required List<T> items,
    required T value,
    required ValueChanged<T?>? onChanged,
  }) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 14)),
      trailing: DropdownButton<T>(
        value: value ?? items.first,
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e.toString().split('.').last,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSliderTile({
    required String title,
    required double value,
    required Function(double) onChanged,
    required double minValue,
    required double maxValue,
    required ColorScheme colorScheme,
  }) {
    return ListTile(
      title: Text(
        '$title: ${value.toStringAsFixed(1)}',
        style: const TextStyle(fontSize: 14),
      ),
      trailing: SizedBox(
        width: 200,
        child: Slider(
          value: value,
          min: minValue,
          max: maxValue,
          divisions: ((maxValue - minValue) * 10).toInt(),
          onChanged: (v) => onChanged(v),
          activeColor: colorScheme.secondary.withValues(alpha: 0.9),
          inactiveColor: colorScheme.outline.withValues(alpha: 0.9),
          thumbColor: colorScheme.secondary.withValues(alpha: 0.9),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String? title2,
    String subtitle,
    String? subtitle2,
    bool value,
    Function(bool) onChanged,
    ColorScheme colorScheme,
  ) {
    return ListTile(
      title: Text(
        value ? title : title2 ?? '',
        style: const TextStyle(fontSize: 14),
      ),
      subtitle: Text(
        value ? subtitle : subtitle2 ?? '',
        style: const TextStyle(fontSize: 10),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: colorScheme.secondary.withValues(alpha: 0.9),
        activeThumbColor: colorScheme.secondaryContainer.withValues(alpha: 0.9),
        inactiveTrackColor: colorScheme.outline.withValues(alpha: 0.9),
      ),
    );
  }

  Widget buildContent(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
          bottom: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("主题设置", colorScheme),
            Divider(
              height: 1,
              color: colorScheme.outline,
              indent: 10,
              endIndent: 10,
            ),
            _buildSwitchTile(
              '自动切换背景',
              '手动切换背景',
              '跟随歌曲封面',
              '长按封面设置背景',
              ref.watch(syncSongIconProvider),
              (value) => ref
                  .read(syncSongIconProvider.notifier)
                  .setSyncSongIcon(value),
              colorScheme,
            ),
            _buildDropdownTile(
              title: '配色方案',
              items: DynamicSchemeVariant.values,
              value: ref.watch(dynamicSchemeProvider),
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(dynamicSchemeProvider.notifier)
                      .setSchemeVariant(value);
                }
              },
            ),
            _buildSliderTile(
              title: '亮度对比度',
              value: ref.watch(contrastLevelProvider),
              onChanged: (value) => ref
                  .read(contrastLevelProvider.notifier)
                  .setContrastLevel(value),
              minValue: -1.0,
              maxValue: 1.0,
              colorScheme: colorScheme,
            ),
            // Container(
            //   width: double.infinity,
            //   alignment: Alignment.centerLeft,
            //   decoration: BoxDecoration(
            //     color: colorScheme.tertiary.withValues(alpha: 0.1),
            //     borderRadius: BorderRadius.circular(8),
            //     border: Border.all(color: colorScheme.tertiary),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       children: [

            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    return Column(
      children: [
        buildAppBar(context, ref, l10n, colorScheme),
        Expanded(child: buildContent(context, ref, l10n, colorScheme)),
      ],
    );
  }
}
