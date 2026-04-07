import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/cloud_music/cloud_music_provider.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';

class _LayoutConfig {
  const _LayoutConfig({
    required this.height,
    required this.itemWidth,
    required this.itemSpacing,
    required this.horizontalPadding,
  });

  final double height;
  final double itemWidth;
  final double itemSpacing;
  final double horizontalPadding;

  static const _LayoutConfig defaultConfig = _LayoutConfig(
    height: 160,
    itemWidth: 100,
    itemSpacing: 16,
    horizontalPadding: 16,
  );

  _LayoutConfig withMultiplier(double multiplier) {
    return _LayoutConfig(
      height: height * multiplier,
      itemWidth: itemWidth * multiplier,
      itemSpacing: itemSpacing * multiplier,
      horizontalPadding: horizontalPadding * multiplier,
    );
  }
}

class CloudMusicArtistItem extends StatelessWidget {
  const CloudMusicArtistItem({
    super.key,
    required this.artist,
    required this.colorScheme,
  });

  final CloudMusicArtist artist;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    var artistName = artist.name;
    if (artistName.isEmpty) {
      artistName = "Unknown Artist";
    }

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: CloudMusicCoverImage(
                imageUrl: artist.picUrl,
                colorScheme: colorScheme,
                config: CloudMusicCoverImageConfig(
                  size: 100,
                  borderRadius: 12,
                  isCircular: true,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                artistName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CloudMusicArtistHorizontalList extends ConsumerWidget {
  const CloudMusicArtistHorizontalList({
    super.key,
    this.limit = 6,
    this.onArtistTap,
  });

  final int limit;
  final void Function(CloudMusicArtist artist)? onArtistTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final config = _LayoutConfig.defaultConfig.withMultiplier(size.multiplier2);
    final artistsAsync = ref.watch(
      recommendTopArtistProvider(
        limit: limit,
        cacheDuration: const Duration(minutes: 60),
      ),
    );

    return artistsAsync.when(
      data: (artists) => SizedBox(
        height: config.height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: config.horizontalPadding),
          itemCount: artists.length,
          itemBuilder: (context, index) {
            final artist = artists[index];
            return Padding(
              padding: EdgeInsets.only(right: config.itemSpacing),
              child: CloudMusicArtistItem(
                artist: artist,
                colorScheme: colorScheme,
              ),
            );
          },
        ),
      ),
      loading: () => SizedBox(
        height: config.height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: config.horizontalPadding),
          itemCount: limit,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: config.itemSpacing),
              child: CloudMusicArtistItemShimmer(colorScheme: colorScheme),
            );
          },
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class CloudMusicArtistItemShimmer extends StatelessWidget {
  const CloudMusicArtistItemShimmer({super.key, required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = this.colorScheme;
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 12,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
