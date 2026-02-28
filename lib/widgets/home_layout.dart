import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/base_bg_layout.dart';
import 'package:toneharbor/widgets/widgets.dart';

class HomeLayout extends BaseBgLayout {
  final Widget child;
  const HomeLayout({super.key, required this.child});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = AppLocalizations.of(context)!;
    final gradientDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(-0.8, -0.8),
        end: Alignment(0.8, 0.8),
        stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
        colors: [
          colorScheme.surface,
          colorScheme.surfaceContainerHighest,
          colorScheme.surface,
          colorScheme.surfaceContainerHighest,
          colorScheme.surface,
        ],
      ),
    );

    return Row(
      children: [
        SizedBox(
          width: 230,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeInOutSine,
            decoration: gradientDecoration,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 8),
                  child: InputHistoryTextField(
                    historyKey: 'search',
                    limit: 10,
                    decoration: InputDecoration(
                      labelText: l10n.search,
                      hintText: l10n.searchHint,
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                const Text("data"),
                const Text("data2"),
                const Spacer(),
              ],
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
