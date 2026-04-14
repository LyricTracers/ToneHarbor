import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/cloud_music/cloud_music_provider.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';

class CloudMusicArtistLayoutConfig {
  const CloudMusicArtistLayoutConfig({
    required this.height,
    required this.itemWidth,
    required this.itemSpacing,
    required this.horizontalPadding,
    required this.fontSize,
  });

  final double height;
  final double itemWidth;
  final double itemSpacing;
  final double horizontalPadding;
  final double fontSize;

  static const CloudMusicArtistLayoutConfig defaultConfig =
      CloudMusicArtistLayoutConfig(
        height: 160,
        itemWidth: 100,
        itemSpacing: 16,
        horizontalPadding: 16,
        fontSize: 13,
      );

  CloudMusicArtistLayoutConfig withMultiplier(double multiplier) {
    return CloudMusicArtistLayoutConfig(
      height: height * multiplier,
      itemWidth: itemWidth * multiplier,
      itemSpacing: itemSpacing * multiplier,
      horizontalPadding: horizontalPadding * multiplier,
      fontSize: fontSize * multiplier,
    );
  }

  CloudMusicArtistLayoutConfig copyWith({
    double? height,
    double? itemWidth,
    double? itemSpacing,
    double? horizontalPadding,
    double? fontSize,
  }) {
    return CloudMusicArtistLayoutConfig(
      height: height ?? this.height,
      itemWidth: itemWidth ?? this.itemWidth,
      itemSpacing: itemSpacing ?? this.itemSpacing,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

class CloudMusicArtistItem extends StatelessWidget {
  const CloudMusicArtistItem({
    super.key,
    required this.artist,
    required this.colorScheme,
    required this.cloudLayoutConfig,
  });

  final CloudMusicArtistData artist;
  final ColorScheme colorScheme;
  final CloudMusicArtistLayoutConfig cloudLayoutConfig;

  @override
  Widget build(BuildContext context) {
    var artistName = artist.name;
    if (artistName.isEmpty) {
      artistName = "Unknown Artist";
    }

    return InkWell(
      onTap: () {
        context.pushWrapper("/cloud-artist-detail", extra: artist);
      },
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: cloudLayoutConfig.itemWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: CloudMusicCoverImage(
                imageUrl: artist.coverUrl(),
                colorScheme: colorScheme,
                config: CloudMusicCoverImageConfig(
                  size: cloudLayoutConfig.itemWidth,
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
                  fontSize: cloudLayoutConfig.fontSize,
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
    this.limit = 10,
    this.onArtistTap,
    this.cloudLayoutConfig = CloudMusicArtistLayoutConfig.defaultConfig,
  });

  final int limit;
  final void Function(CloudMusicArtistData artist)? onArtistTap;
  final CloudMusicArtistLayoutConfig cloudLayoutConfig;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final config = cloudLayoutConfig.withMultiplier(size.multiplier);
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
                cloudLayoutConfig: config,
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
              child: CloudMusicArtistItemShimmer(
                colorScheme: colorScheme,
                cloudLayoutConfig: config,
              ),
            );
          },
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class CloudMusicArtistItemShimmer extends StatelessWidget {
  const CloudMusicArtistItemShimmer({
    super.key,
    required this.colorScheme,
    required this.cloudLayoutConfig,
  });

  final ColorScheme colorScheme;
  final CloudMusicArtistLayoutConfig cloudLayoutConfig;

  @override
  Widget build(BuildContext context) {
    final colorScheme = this.colorScheme;
    return SizedBox(
      width: cloudLayoutConfig.itemWidth,
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
            width: cloudLayoutConfig.itemWidth * 0.7,
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
