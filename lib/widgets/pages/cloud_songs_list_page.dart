import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_common_songs.dart';
import 'package:toneharbor/widgets/components/common_shimmer_loader.dart';

class CloudSongsListPage<T extends ExtraProvider<CloudSongsListData>>
    extends HookConsumerWidget {
  final $AsyncNotifierProvider<T, CloudSongsListData> baseProvider;
  final String title;

  const CloudSongsListPage({
    super.key,
    required this.baseProvider,
    required this.title,
  });

  PreferredSizeWidget _buildAppBar(
    WidgetRef ref,
    ColorScheme colorScheme,
    Size size,
    AppLocalizations l10n,
  ) {
    final toolbarHeight = kToolbarHeight * size.multiplier3;
    return AppBar(
      centerTitle: false,
      toolbarHeight: toolbarHeight,
      backgroundColor: size.lgAndUp
          ? colorScheme.tertiary.withValues(alpha: 0.1)
          : Colors.transparent,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16 * size.multiplier2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final size = MediaQuery.of(context).size;
    final scrollController = useScrollController();
    final isLoadingMore = useState(false);
    final songsProvider = ref.watch(baseProvider);
    final l10n = ref.watch(l10nProvider);
    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;
        if (currentScroll >= maxScroll * 0.8 && !isLoadingMore.value) {
          final songDates = ref.read(baseProvider).value;
          if (songDates?.hasMore == true) {
            ref.read(baseProvider.notifier).loadMore();
            isLoadingMore.value = true;
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController, isLoadingMore.value]);

    useEffect(() {
      isLoadingMore.value = false;
      return null;
    }, [songsProvider.value]);
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAppBar(ref, colorScheme, size, l10n),
            const SizedBox(height: 16),
            Expanded(
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  songsProvider.when(
                    data: (data) => buildTrackList(
                      ref,
                      data.songs,
                      colorScheme,
                      size,
                      l10n,
                      isLoadingMore.value,
                      null,
                      null,
                    ),
                    loading: () => TrackListShimmerLoading(
                      colorScheme: colorScheme,
                      size: size,
                    ),
                    error: (error, stack) => SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: Text('Error: $error'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
