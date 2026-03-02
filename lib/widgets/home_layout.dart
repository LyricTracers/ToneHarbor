import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/base_bg_layout.dart';
import 'package:toneharbor/widgets/widgets.dart';
part 'home_layout_logic.dart';

class HomeLayout extends BaseBgLayout {
  final Widget child;
  const HomeLayout({super.key, super.showLoading = false, required this.child});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    logger.i("build!!!!");
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = getValueWhenReadyWithWidgetRef(
      ref,
      l10nProvider,
      AppLocalizations.of(context),
    )!;
    final router = GoRouter.of(context);
    final isRecommendPage =
        router.routeInformationProvider.value.uri.path == '/';
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
                  child: SearchHistoryTextField(
                    showHistoryIcon: false,
                    listTextStyle: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: l10n.search,
                      labelStyle: const TextStyle(fontSize: 16),
                      hintText: l10n.searchHint,
                      hintStyle: const TextStyle(fontSize: 14),
                      prefixIcon: const Icon(Icons.search, size: 16),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    onSubmitSearch: (value) {
                      onSubmitSearch(ref, value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: InkWell(
                    onTap: () {
                      if (!isRecommendPage) {
                        context.go('/');
                      }
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isRecommendPage
                            ? colorScheme.primary.withValues(alpha: 0.3)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.recommend,
                            size: 20,
                            color: isRecommendPage
                                ? colorScheme.primary
                                : colorScheme.onSurface.withValues(alpha: 0.8),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.recommend,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isRecommendPage
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: isRecommendPage
                                  ? colorScheme.primary
                                  : colorScheme.onSurface.withValues(
                                      alpha: 0.8,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
