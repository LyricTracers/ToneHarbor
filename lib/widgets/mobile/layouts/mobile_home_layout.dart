import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/widgets/mobile/pages/library_page.dart';
import 'package:toneharbor/widgets/widgets.dart';

class MobileHomeLayout extends BaseBgLayout {
  final int tab;
  const MobileHomeLayout({super.key, required this.tab});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    final tabController = useTabController(initialLength: 3);
    final l10n = ref.watch(l10nProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Material(
          color: colorScheme.tertiary.withValues(alpha: 0.1),
          child: TabBar(
            controller: tabController,
            labelColor: colorScheme.primary,
            labelStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            unselectedLabelColor: colorScheme.onSurface,
            indicatorColor: colorScheme.primary,
            tabs: [
              Tab(text: l10n.recommend),
              Tab(text: l10n.music_house),
              Tab(text: l10n.settings),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              const RecommendPage(),
              const LibraryPage(),
              const SettingPage(),
            ],
          ),
        ),
      ],
    );
  }
}
