import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/track_cover_image.dart';
import 'package:toneharbor/widgets/widgets.dart';

class _LayoutConfig {
  const _LayoutConfig({
    required this.height,
    required this.itemWidth,
    required this.itemSpacing,
    required this.horizontalPadding,
    required this.coverSize,
    required this.coverBorderRadius,
    required this.textSpacing,
    required this.titleFontSize,
    required this.titleFontWeight,
    required this.subtitleFontSize,
  });

  final double height;
  final double itemWidth;
  final double itemSpacing;
  final double horizontalPadding;
  final double coverSize;
  final double coverBorderRadius;
  final double textSpacing;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final double subtitleFontSize;

  static const _LayoutConfig defaultConfig = _LayoutConfig(
    height: 200,
    itemWidth: 140,
    itemSpacing: 20,
    horizontalPadding: 20,
    coverSize: 140,
    coverBorderRadius: 12,
    textSpacing: 4,
    titleFontSize: 15,
    titleFontWeight: FontWeight.bold,
    subtitleFontSize: 13,
  );

  _LayoutConfig multiply({required double multiplier}) => _LayoutConfig(
    height: height * multiplier,
    itemWidth: itemWidth * multiplier,
    itemSpacing: itemSpacing * multiplier,
    horizontalPadding: horizontalPadding * multiplier,
    coverSize: coverSize * multiplier,
    coverBorderRadius: coverBorderRadius * multiplier,
    textSpacing: textSpacing * multiplier,
    titleFontSize: titleFontSize * multiplier,
    titleFontWeight: titleFontWeight,
    subtitleFontSize: subtitleFontSize * multiplier,
  );
}

class CommonSongs extends ConsumerWidget {
  const CommonSongs({
    super.key,
    required this.songs,
    required this.onErrorTap,
    required this.limit,
  });

  final AsyncValue<ToneHarborTrackObjectList> songs;
  final Function() onErrorTap;
  final int limit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    var config = _LayoutConfig.defaultConfig;
    final size = MediaQuery.of(context).size;
    config = config.multiply(multiplier: size.multiplier);
    return songs.when(
      data: (data) =>
          _buildHorizontalList(context, data.songs, colorScheme, config),
      loading: () => _buildShimmerLoading(context, colorScheme, config),
      error: (error, stackTrace) {
        return SizedBox.shrink();
      },
    );
  }

  Widget _buildHorizontalList(
    BuildContext context,
    List<ToneHarborTrackObject> songs,
    ColorScheme colorScheme,
    _LayoutConfig config,
  ) {
    var length = songs.length > limit ? limit : songs.length;
    return SizedBox(
      height: config.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: config.horizontalPadding),
        itemCount: length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return Padding(
            padding: EdgeInsets.only(right: config.itemSpacing),
            child: _SongItem(
              song: song,
              colorScheme: colorScheme,
              config: config,
              onTap: (ref) {
                ref
                    .read(audioPlayerStateProvider.notifier)
                    .load(songs, initialIndex: index, autoPlay: true);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerLoading(
    BuildContext context,
    ColorScheme colorScheme,
    _LayoutConfig config,
  ) {
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: SizedBox(
        height: config.height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: config.horizontalPadding),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: config.itemSpacing),
              child: _SongItemShimmer(colorScheme: colorScheme, config: config),
            );
          },
        ),
      ),
    );
  }
}

class _SongItem extends ConsumerWidget {
  const _SongItem({
    required this.song,
    required this.colorScheme,
    required this.config,
    required this.onTap,
  });

  final ToneHarborTrackObject song;
  final ColorScheme colorScheme;
  final _LayoutConfig config;
  final Function(WidgetRef ref) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songTitle = song.title;
    final artistName = song.artist;
    final albumName = song.album;

    return InkWell(
      onTap: () => onTap(ref),
      borderRadius: BorderRadius.circular(config.coverBorderRadius),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TrackCoverImage(
            track: song,
            colorScheme: colorScheme,
            config: TrackCoverImageConfig(
              size: config.coverSize,
              borderRadius: config.coverBorderRadius,
            ),
          ),
          SizedBox(height: config.textSpacing),
          _SongText(
            text: songTitle,
            width: config.itemWidth,
            style: TextStyle(
              fontSize: config.titleFontSize,
              fontWeight: config.titleFontWeight,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: config.textSpacing),
          _SongText(
            text: '$artistName - $albumName',
            width: config.itemWidth,
            style: TextStyle(
              fontSize: config.subtitleFontSize,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _SongText extends StatelessWidget {
  const _SongText({
    required this.text,
    required this.width,
    required this.style,
  });

  final String text;
  final double width;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: SmartMarquee(
          text: text,
          style: style,
          pauseOnHover: true,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

class _SongItemShimmer extends StatelessWidget {
  const _SongItemShimmer({required this.colorScheme, required this.config});

  final ColorScheme colorScheme;
  final _LayoutConfig config;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: config.coverSize,
          height: config.coverSize,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(config.coverBorderRadius),
          ),
        ),
        SizedBox(height: config.textSpacing),
        Container(
          width: config.itemWidth,
          height: config.titleFontSize,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(height: config.textSpacing),
        Container(
          width: config.itemWidth,
          height: config.subtitleFontSize,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
