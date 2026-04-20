import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/common/common_provider.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';

typedef ArtistItemBuilder =
    Widget Function(
      BuildContext context,
      CloudMusicArtistData artist,
      int index,
    );

class CommonArtistGrid<T extends ExtraProvider<CloudArtistListData>>
    extends HookConsumerWidget {
  const CommonArtistGrid({
    super.key,
    required this.baseProvider,
    required this.itemBuilder,
    required this.items,
    required this.hasMore,
    this.maxCrossAxisExtent = 180,
    this.mainAxisSpacing = 24,
    this.crossAxisSpacing = 24,
    this.childAspectRatio = 0.75,
    this.emptyWidget,
  });

  final $AsyncNotifierProvider<T, CloudArtistListData> baseProvider;
  final ArtistItemBuilder itemBuilder;
  final List<CloudMusicArtistData> items;
  final bool hasMore;
  final double maxCrossAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);
    final scrollController = useScrollController();
    final isLoadingMore = useState(false);

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        if (currentScroll >= maxScroll * 0.8 &&
            hasMore &&
            !isLoadingMore.value) {
          isLoadingMore.value = true;
          ref.read(baseProvider.notifier).loadMore().then((_) {
            isLoadingMore.value = false;
          });
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [hasMore]);

    if (items.isEmpty) {
      return emptyWidget ?? SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.smAndUp ? 16 : 8,
        vertical: size.smAndUp ? 8 : 4,
      ),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxCrossAxisExtent,
              mainAxisSpacing: mainAxisSpacing,
              crossAxisSpacing: crossAxisSpacing,
              childAspectRatio: childAspectRatio,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index == items.length) {
                return Padding(
                  padding: EdgeInsets.all(size.smAndUp ? 16 : 12),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
              return itemBuilder(context, items[index], index);
            }, childCount: hasMore ? items.length + 1 : items.length),
          ),
          if (!hasMore)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20 * size.multiplier),
                child: Center(
                  child: Text(
                    l10n.reach_end,
                    style: TextStyle(
                      fontSize: 12 * size.multiplier,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
