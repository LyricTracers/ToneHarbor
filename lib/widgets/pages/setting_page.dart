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

  Widget buildContent(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return const Center(child: Text('设置内容'));
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
