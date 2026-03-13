import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
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
    height: 160,
    itemWidth: 100,
    itemSpacing: 16,
    horizontalPadding: 16,
    coverSize: 100,
    coverBorderRadius: 12,
    textSpacing: 4,
    titleFontSize: 13,
    titleFontWeight: FontWeight.w500,
    subtitleFontSize: 11,
  );
}

class CommonSongs extends ConsumerWidget {
  const CommonSongs({
    super.key,
    required this.songs,
    required this.onErrorTap,
    required this.limit,
  });

  final AsyncValue<SongListResponse> songs;
  final Function() onErrorTap;
  final int limit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);

    return songs.when(
      data: (data) =>
          _buildHorizontalList(context, data.data?.songs ?? [], colorScheme),
      loading: () => _buildShimmerLoading(context, colorScheme),
      error: (error, stackTrace) {
        return buildErrorView(context, ref, colorScheme, onErrorTap);
      },
    );
  }

  Widget _buildHorizontalList(
    BuildContext context,
    List<Song> songs,
    ColorScheme colorScheme,
  ) {
    final config = _LayoutConfig.defaultConfig;
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
                    .load(
                      songs.asTrackList(),
                      initialIndex: index,
                      autoPlay: true,
                    );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerLoading(BuildContext context, ColorScheme colorScheme) {
    final config = _LayoutConfig.defaultConfig;
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: SizedBox(
        height: config.height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: config.horizontalPadding),
          itemCount: 5,
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

  final Song song;
  final ColorScheme colorScheme;
  final _LayoutConfig config;
  final Function(WidgetRef ref) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songTitle = song.title.isNotEmpty ? song.title : 'Unknown Song';
    final artistName = song.additional?.songTag?.artist?.isNotEmpty == true
        ? song.additional!.songTag!.artist!
        : (song.additional?.songTag?.albumArtist?.isNotEmpty == true)
        ? song.additional!.songTag!.albumArtist!
        : 'Unknown Artist';
    final albumName = song.additional?.songTag?.album?.isNotEmpty == true
        ? song.additional!.songTag!.album!
        : 'Unknown Album';

    return InkWell(
      onTap: () => onTap(ref),
      borderRadius: BorderRadius.circular(config.coverBorderRadius),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SongCoverImage(
            songId: song.id,
            albumName: albumName,
            artistName: artistName,
            colorScheme: colorScheme,
            config: SongCoverImageConfig(
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
