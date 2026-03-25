import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/widgets.dart';

class _LayoutConfig {
  const _LayoutConfig({
    required this.sidebarWidth,
    required this.horizontalPadding,
    required this.itemSpacing,
    required this.minItemWidth,
    required this.rows,
  });

  final double sidebarWidth;
  final double horizontalPadding;
  final double itemSpacing;
  final double minItemWidth;
  final int rows;

  static const _LayoutConfig defaultConfig = _LayoutConfig(
    sidebarWidth: 200.0,
    horizontalPadding: 32.0,
    itemSpacing: 12.0,
    minItemWidth: 280.0,
    rows: 3,
  );
}

class _SongItemConfig {
  const _SongItemConfig({
    required this.height,
    required this.coverSize,
    required this.horizontalPadding,
    required this.titleFontSize,
    required this.subtitleFontSize,
    required this.iconSize,
    required this.borderRadius,
    required this.marqueeSpacing,
  });

  final double height;
  final double coverSize;
  final double horizontalPadding;
  final double titleFontSize;
  final double subtitleFontSize;
  final double iconSize;
  final double borderRadius;
  final double marqueeSpacing;

  static const _SongItemConfig defaultConfig = _SongItemConfig(
    height: 56,
    coverSize: 48,
    horizontalPadding: 10,
    titleFontSize: 13,
    subtitleFontSize: 11,
    iconSize: 18,
    borderRadius: 8,
    marqueeSpacing: 2,
  );
}

class RecommendPageDailySongs extends ConsumerWidget {
  const RecommendPageDailySongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final randomSongs = ref.watch(randomSongsProvider(limit: 100));

    return randomSongs.when(
      data: (data) {
        return _buildSongList(context, ref, data, colorScheme);
      },
      loading: () {
        return _buildShimmerLoading(context, colorScheme);
      },
      error: (error, stack) => buildErrorView(context, ref, colorScheme, () {
        ref.invalidate(randomSongsProvider);
      }),
    );
  }

  Widget _buildSongList(
    BuildContext context,
    WidgetRef ref,
    ToneHarborTrackObjectList response,
    ColorScheme colorScheme,
  ) {
    final songs = response.songs;
    if (songs.isEmpty) {
      return const Center(child: Text('No songs'));
    }

    final config = _LayoutConfig.defaultConfig;
    final columns = _calculateColumns(context, config);

    return _buildSongGrid(context, ref, songs, colorScheme, config, columns);
  }

  Widget _buildShimmerLoading(BuildContext context, ColorScheme colorScheme) {
    final config = _LayoutConfig.defaultConfig;
    final columns = _calculateColumns(context, config);

    return _buildShimmerGrid(colorScheme, config, columns);
  }

  int _calculateColumns(BuildContext context, _LayoutConfig config) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final availableScreenWidth = screenWidth - config.sidebarWidth;

    return ((availableScreenWidth - config.horizontalPadding) /
            (config.minItemWidth + config.itemSpacing))
        .floor()
        .clamp(2, 3);
  }

  Widget _buildSongGrid(
    BuildContext context,
    WidgetRef ref,
    List<ToneHarborTrackObject> songs,
    ColorScheme colorScheme,
    _LayoutConfig config,
    int columns,
  ) {
    return _buildGrid(config, columns, (rowIndex, colIndex, index) {
      final song = songs[index];
      return Expanded(
        key: ValueKey(song.id),
        child: Padding(
          padding: EdgeInsets.only(
            right: colIndex == columns - 1 ? 0 : config.itemSpacing,
          ),
          child: _buildSongItem(context, ref, song, colorScheme, (
            WidgetRef ref,
          ) {
            ref
                .read(audioPlayerStateProvider.notifier)
                .load(songs, initialIndex: index, autoPlay: true);
          }),
        ),
      );
    }, songs.length);
  }

  Widget _buildShimmerGrid(
    ColorScheme colorScheme,
    _LayoutConfig config,
    int columns,
  ) {
    return _buildGrid(config, columns, (rowIndex, colIndex, index) {
      return Expanded(
        key: ValueKey('shimmer_$rowIndex$colIndex'),
        child: Padding(
          padding: EdgeInsets.only(
            right: colIndex == columns - 1 ? 0 : config.itemSpacing,
          ),
          child: _SongItemShimmer(colorScheme: colorScheme),
        ),
      );
    }, columns * config.rows);
  }

  Widget _buildGrid(
    _LayoutConfig config,
    int columns,
    Widget Function(int rowIndex, int colIndex, int index) itemBuilder,
    int itemCount,
  ) {
    return Column(
      children: List.generate(config.rows, (rowIndex) {
        return Padding(
          padding: EdgeInsets.only(bottom: rowIndex < config.rows - 1 ? 8 : 0),
          child: Row(
            children: List.generate(columns, (colIndex) {
              final index = rowIndex + colIndex * config.rows;
              if (index >= itemCount) {
                return const Expanded(child: SizedBox());
              }
              return itemBuilder(rowIndex, colIndex, index);
            }),
          ),
        );
      }),
    );
  }

  Widget _buildSongItem(
    BuildContext context,
    WidgetRef ref,
    ToneHarborTrackObject song,
    ColorScheme colorScheme,
    Function(WidgetRef ref) onTap,
  ) {
    var albumName = song.album;
    var artistName = song.artist;
    final songTitle = song.title;
    final config = _SongItemConfig.defaultConfig;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(config.borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(config.borderRadius),
        hoverColor: colorScheme.surface.withValues(alpha: 0.3),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => onTap(ref),
        child: Container(
          height: config.height,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              SongCoverImage(
                songId: song.id,
                albumName: albumName,
                artistName: artistName,
                colorScheme: colorScheme,
                config: SongCoverImageConfig(
                  size: config.coverSize,
                  borderRadius: config.borderRadius,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: config.horizontalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmartMarquee(
                        text: songTitle.isNotEmpty
                            ? songTitle
                            : 'Unknown Title',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        pauseOnHover: true,
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: config.marqueeSpacing),
                      SmartMarquee(
                        text: '$artistName - $albumName',
                        style: TextStyle(
                          fontSize: config.subtitleFontSize,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        pauseOnHover: true,
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.play_circle_outline,
                size: config.iconSize,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SongItemShimmer extends StatelessWidget {
  const _SongItemShimmer({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final config = _SongItemConfig.defaultConfig;
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: Container(
        height: config.height,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            Container(
              width: config.coverSize,
              height: config.coverSize,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(config.borderRadius),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: config.horizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: config.titleFontSize,
                      width: 120,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(height: config.marqueeSpacing),
                    Container(
                      height: config.subtitleFontSize,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: config.iconSize,
              height: config.iconSize,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
