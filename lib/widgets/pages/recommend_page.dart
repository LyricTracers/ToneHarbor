import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/widgets.dart';

class RecommendPage extends BaseContentPage {
  const RecommendPage({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.recommend,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.refresh_rounded,
            color: colorScheme.onSurface,
            size: 16,
          ),
          onPressed: () {
            ref.invalidate(randomSongsProvider);
          },
        ),
      ],
      centerTitle: false,
      toolbarOpacity: 0.5,
    );
  }

  @override
  Widget buildContent(BuildContext context, WidgetRef ref) {
    var colorScheme = getColorSchemeWhenReady(ref);
    final i10n = getValueWhenReadyWithWidgetRef(
      ref,
      l10nProvider,
      AppLocalizations.of(context),
    )!;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      i10n.daily_recommend,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // todo('查看更多');
                      },
                      child: Text(
                        i10n.more,
                        style: TextStyle(
                          fontSize: 11,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 2,
                indent: 16,
                endIndent: 16,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              SizedBox(height: 8),
              const RecommendPageDailySongs(),
            ],
          ),
        ),
      ),
    );
  }
}
