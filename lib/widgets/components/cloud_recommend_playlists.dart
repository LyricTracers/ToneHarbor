import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/cloud_music/cloud_music_provider.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/widgets.dart';

class CloudRecommendPlaylists extends ConsumerWidget {
  const CloudRecommendPlaylists({
    super.key,
    this.limit = 12,
    this.onPlaylistTap,
    this.visibleRows = 2,
  });

  final int limit;
  final void Function(CloudMusicPlaylist playlist)? onPlaylistTap;
  final int visibleRows;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final playlists = ref.watch(recommendPlaylistsProvider(limit: limit));
    final size = MediaQuery.of(context).size;
    final maxCrossAxisExtent = 180 * size.multiplier;

    return playlists.when(
      data: (data) => _buildGrid(
        context,
        data,
        colorScheme,
        maxCrossAxisExtent,
        size.multiplier2,
      ),
      loading: () =>
          _buildShimmerLoading(context, colorScheme, maxCrossAxisExtent),
      error: (error, stackTrace) => const SizedBox.shrink(),
    );
  }

  Widget _buildGrid(
    BuildContext context,
    List<CloudMusicPlaylist> playlists,
    ColorScheme colorScheme,
    double maxCrossAxisExtent,
    double multiplier,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth;
          final crossAxisCount = (availableWidth / maxCrossAxisExtent)
              .floor()
              .clamp(3, 6);
          final maxItems = crossAxisCount * visibleRows;
          final displayItems = playlists.length > maxItems
              ? playlists.sublist(0, maxItems)
              : playlists;

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemCount: displayItems.length,
            itemBuilder: (context, index) {
              final playlist = displayItems[index];
              return _PlaylistItem(
                playlist: playlist,
                colorScheme: colorScheme,
                onTap: () => onPlaylistTap?.call(playlist),
                multiplier: multiplier,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildShimmerLoading(
    BuildContext context,
    ColorScheme colorScheme,
    double maxCrossAxisExtent,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth;
          final crossAxisCount = (availableWidth / maxCrossAxisExtent)
              .floor()
              .clamp(3, 6);
          final maxItems = crossAxisCount * visibleRows;

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemCount: maxItems,
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

  final CloudMusicPlaylist playlist;
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
                    imageUrl: playlist.coverUrl,
                    colorScheme: colorScheme,
                    config: CloudMusicCoverImageConfig(
                      size: coverSize,
                      borderRadius: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: SmartMarquee(
                  text: playlist.name,
                  style: TextStyle(
                    fontSize: 12 * multiplier,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                  pauseOnHover: true,
                  pauseAfterRound: Duration(seconds: 5),
                  alignment: Alignment.center,
                ),
              ),
              if (playlist.copywriter != null &&
                  playlist.copywriter!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    playlist.copywriter!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
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
              SizedBox(height: 6),
              Container(
                width: coverSize * 0.8,
                height: 12,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(height: 4),
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
