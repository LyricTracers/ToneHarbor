import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/widgets.dart';

class CloudPlaylistsCat<T extends ExtraProvider<CloudMusicPlaylistDataList>>
    extends HookConsumerWidget {
  const CloudPlaylistsCat({
    super.key,
    this.visibleRows = -1,
    this.mainAxisSpacing = 10,
    this.crossAxisSpacing = 20,
    this.childAspectRatio = 0.75,
    required this.baseProvider,
  });

  final int visibleRows;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final $AsyncNotifierProvider<T, CloudMusicPlaylistDataList> baseProvider;

  int _calculateCrossAxisCount(
    double availableWidth,
    double maxCrossAxisExtent,
  ) {
    return (availableWidth / maxCrossAxisExtent).floor().clamp(3, 6);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final playlists = ref.watch(baseProvider);
    final size = MediaQuery.of(context).size;
    final maxCrossAxisExtent = 180 * size.multiplier;
    final scrollController = useScrollController();
    final isLoadingMore = useState(false);
    final l10n = ref.watch(l10nProvider);

    useEffect(() {
      isLoadingMore.value = false;
      return null;
    }, [baseProvider]);

    useEffect(() {
      if (visibleRows != -1) return null;

      void onScroll() {
        if (!scrollController.hasClients) return;
        if (isLoadingMore.value) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        if (currentScroll >= maxScroll * 0.8) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!scrollController.hasClients) return;
            if (isLoadingMore.value) return;

            final currentData = ref.read(baseProvider).value;
            final currentPlaylists = currentData?.playlists ?? [];
            final currentTotal = currentData?.total ?? 0;

            if (currentPlaylists.length < currentTotal) {
              isLoadingMore.value = true;
              ref
                  .read(baseProvider.notifier)
                  .loadMore()
                  .then((_) {
                    isLoadingMore.value = false;
                  })
                  .catchError((_) {
                    isLoadingMore.value = false;
                  });
            }
          });
        }
      }

      scrollController.addListener(onScroll);
      return () {
        if (visibleRows == -1 && scrollController.hasClients) {
          scrollController.removeListener(onScroll);
        }
      };
    }, [scrollController, visibleRows, baseProvider]);

    return playlists.when(
      data: (data) => _buildGrid(
        context,
        data,
        colorScheme,
        maxCrossAxisExtent,
        size.multiplier2,
        scrollController,
        isLoadingMore.value,
        l10n,
      ),
      loading: () => _buildShimmerLoading(
        context,
        colorScheme,
        maxCrossAxisExtent,
        visibleRows,
      ),
      error: (error, stackTrace) => const SizedBox.shrink(),
    );
  }

  Widget _buildGrid(
    BuildContext context,
    CloudMusicPlaylistDataList playlistsList,
    ColorScheme colorScheme,
    double maxCrossAxisExtent,
    double multiplier,
    ScrollController scrollController,
    bool isLoadingMore,
    AppLocalizations l10n,
  ) {
    final playlists = playlistsList.playlists;
    final total = playlistsList.total;

    final hasMore = visibleRows == -1 && playlists.length < total;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = _calculateCrossAxisCount(
            constraints.maxWidth,
            maxCrossAxisExtent,
          );

          final hasHeightConstraint = !constraints.maxHeight.isInfinite;
          final shouldEnableScroll = visibleRows == -1 && hasHeightConstraint;

          List<CloudMusicPlaylistData> displayItems;
          if (visibleRows != -1) {
            final maxItems = crossAxisCount * visibleRows;
            displayItems = playlists.length > maxItems
                ? playlists.sublist(0, maxItems)
                : playlists;
          } else {
            displayItems = playlists;
          }

          final grid = GridView.builder(
            controller: shouldEnableScroll ? scrollController : null,
            physics: shouldEnableScroll
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            shrinkWrap: !shouldEnableScroll,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: mainAxisSpacing,
              crossAxisSpacing: crossAxisSpacing,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: displayItems.length + (hasMore && isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == displayItems.length) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: SizedBox(
                      width: mainAxisSpacing,
                      height: mainAxisSpacing,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              }
              final playlist = displayItems[index];
              return _PlaylistItem(
                playlist: playlist,
                colorScheme: colorScheme,
                onTap: () =>
                    context.pushWrapper("/cloud-detail", extra: playlist),
                multiplier: multiplier,
              );
            },
          );
          final showEndText = visibleRows == -1 && !hasMore;
          if (!showEndText) {
            return grid;
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: grid),
              SizedBox(height: 10),
              Text(
                l10n.reach_end,
                style: TextStyle(
                  fontSize: 14 * multiplier,
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }

  Widget _buildShimmerLoading(
    BuildContext context,
    ColorScheme colorScheme,
    double maxCrossAxisExtent,
    int visibleRows,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = _calculateCrossAxisCount(
            constraints.maxWidth,
            maxCrossAxisExtent,
          );
          final itemCount = visibleRows == -1
              ? 50
              : crossAxisCount * visibleRows;

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: mainAxisSpacing,
              crossAxisSpacing: crossAxisSpacing,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return _PlaylistItemShimmer(colorScheme: colorScheme);
            },
          );
        },
      ),
    );
  }
}

class _PlaylistItem extends StatelessWidget {
  const _PlaylistItem({
    required this.playlist,
    required this.colorScheme,
    required this.onTap,
    required this.multiplier,
  });

  final CloudMusicPlaylistData playlist;
  final ColorScheme colorScheme;
  final double multiplier;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final coverSize = constraints.maxWidth;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: CloudMusicCoverImage(
                    imageUrl: playlist.coverUrl(),
                    colorScheme: colorScheme,
                    config: CloudMusicCoverImageConfig(
                      size: coverSize,
                      borderRadius: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: SmartMarquee(
                  text: playlist.name,
                  style: TextStyle(
                    fontSize: 12 * multiplier,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                  pauseOnHover: true,
                  pauseAfterRound: const Duration(seconds: 5),
                  alignment: Alignment.center,
                ),
              ),

              // if (playlist.copywriter != null &&
              //     playlist.copywriter!.isNotEmpty)
              //   Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 2),
              //     child: Text(
              //       playlist.copywriter!,
              //       maxLines: 1,
              //       overflow: TextOverflow.ellipsis,
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 10,
              //         color: colorScheme.onSurfaceVariant,
              //       ),
              //     ),
              //   ),
            ],
          );
        },
      ),
    );
  }
}

class _PlaylistItemShimmer extends StatelessWidget {
  const _PlaylistItemShimmer({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final coverSize = constraints.maxWidth;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: coverSize * 0.8,
                height: 12,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: coverSize * 0.5,
                height: 10,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
