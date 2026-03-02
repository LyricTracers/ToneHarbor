import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
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
    sidebarWidth: 230.0,
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

class DailyRecommend extends ConsumerWidget {
  const DailyRecommend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final randomSongs = ref.watch(randomSongsProvider(limit: 9, offset: 0));

    return randomSongs.when(
      data: (data) => _buildSongList(context, ref, data, colorScheme),
      loading: () => _buildShimmerLoading(context, colorScheme),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildSongList(
    BuildContext context,
    WidgetRef ref,
    SongListResponse response,
    ColorScheme colorScheme,
  ) {
    final songs = response.data?.songs ?? [];
    if (songs.isEmpty) {
      return const Center(child: Text('No songs'));
    }

    final config = _LayoutConfig.defaultConfig;
    final columns = _calculateColumns(context, config);
    final displaySongs = songs.take(_getDisplayCount(columns)).toList();
    final authHeaders = getValueWhenReadyWithWidgetRef(
      ref,
      authHeadersProvider,
      null,
    );

    return _buildSongGrid(
      context,
      ref,
      displaySongs,
      colorScheme,
      authHeaders ?? <String, String>{},
      config,
      columns,
    );
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

  int _getDisplayCount(int columns) => columns == 3 ? 9 : 6;

  Widget _buildSongGrid(
    BuildContext context,
    WidgetRef ref,
    List<Song> songs,
    ColorScheme colorScheme,
    Map<String, String> authHeaders,
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
          child: _buildSongItem(context, ref, song, colorScheme, authHeaders),
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
    Song song,
    ColorScheme colorScheme,
    Map<String, String> authHeaders,
  ) {
    final albumName = song.additional?.songTag?.album ?? '';
    final artistName = song.additional?.songTag?.artist ?? '';
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
        onTap: () {},
        child: Container(
          height: config.height,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(config.borderRadius),
                child: _SongCoverImage(
                  songId: song.id,
                  albumName: albumName,
                  artistName: artistName,
                  authHeaders: authHeaders,
                  colorScheme: colorScheme,
                  config: config,
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
                        text: albumName.isNotEmpty
                            ? albumName
                            : 'Unknown Album',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: config.marqueeSpacing),
                      SmartMarquee(
                        text: '$artistName - $songTitle',
                        style: TextStyle(
                          fontSize: config.subtitleFontSize,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(Icons.play_circle_outline, size: config.iconSize),
            ],
          ),
        ),
      ),
    );
  }
}

class _SongCoverImage extends ConsumerWidget {
  const _SongCoverImage({
    required this.songId,
    required this.albumName,
    required this.artistName,
    required this.authHeaders,
    required this.colorScheme,
    required this.config,
  });

  final String songId;
  final String albumName;
  final String artistName;
  final Map<String, String> authHeaders;
  final ColorScheme colorScheme;
  final _SongItemConfig config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverUrl = ref.watch(
      coverUrlProvider(albumName: albumName, albumArtistName: artistName),
    );

    return coverUrl.when(
      data: (url) {
        if (url.isEmpty) {
          return _CoverPlaceholder(
            colorScheme: colorScheme,
            size: config.coverSize,
          );
        }
        return ExtendedImage.network(
          url,
          width: config.coverSize,
          height: config.coverSize,
          fit: BoxFit.cover,
          headers: authHeaders,
          cache: true,
          cacheKey: songId,
          clearMemoryCacheIfFailed: true,
          loadStateChanged: (state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                return _CoverPlaceholder(
                  colorScheme: colorScheme,
                  size: config.coverSize,
                  isLoading: true,
                );
              case LoadState.completed:
                return ExtendedRawImage(
                  image: state.extendedImageInfo?.image,
                  width: config.coverSize,
                  height: config.coverSize,
                  fit: BoxFit.cover,
                );
              case LoadState.failed:
                return _CoverPlaceholder(
                  colorScheme: colorScheme,
                  size: config.coverSize,
                );
            }
          },
        );
      },
      loading: () => _CoverPlaceholder(
        colorScheme: colorScheme,
        size: config.coverSize,
        isLoading: true,
      ),
      error: (_, __) =>
          _CoverPlaceholder(colorScheme: colorScheme, size: config.coverSize),
    );
  }
}

class _CoverPlaceholder extends StatelessWidget {
  const _CoverPlaceholder({
    required this.colorScheme,
    required this.size,
    this.isLoading = false,
  });

  final ColorScheme colorScheme;
  final double size;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.onSurface.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isLoading
          ? Center(
              child: SizedBox(
                width: size * 0.4,
                height: size * 0.4,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colorScheme.onSurface,
                ),
              ),
            )
          : Icon(
              Icons.music_note,
              size: size * 0.4,
              color: colorScheme.onSurface,
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
      baseColor: colorScheme.surfaceContainerHighest,
      highlightColor: colorScheme.surface,
      child: Container(
        height: config.height,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            Container(
              width: config.coverSize,
              height: config.coverSize,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
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
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(height: config.marqueeSpacing),
                    Container(
                      height: config.subtitleFontSize,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
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
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
