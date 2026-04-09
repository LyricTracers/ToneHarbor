import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';

class CloudDetailPlaylistHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String? updateTime;
  final String? description;
  final Size size;
  final ColorScheme colorScheme;
  final BuildContext context;
  final Widget coverImage;

  CloudDetailPlaylistHeaderDelegate({
    required this.title,
    this.updateTime,
    this.description,
    required this.size,
    required this.colorScheme,
    required this.context,
    required this.coverImage,
  });

  @override
  double get minExtent => kToolbarHeight * size.multiplier3;

  @override
  double get maxExtent => kToolbarHeight * 4 * size.multiplier3;
  double get multiplier3 => size.multiplier3;
  double get multiplier => size.multiplier2;

  @override
  bool shouldRebuild(covariant CloudDetailPlaylistHeaderDelegate oldDelegate) =>
      title != oldDelegate.title ||
      updateTime != oldDelegate.updateTime ||
      description != oldDelegate.description;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    final bool isScrolledUnder =
        overlapsContent || shrinkOffset > maxExtent - minExtent;

    final Color fromColor = Colors.transparent;
    final Color toColor = colorScheme.surfaceBright;

    final effectiveProgress = isScrolledUnder ? 1.0 : progress;
    final Color effectiveBackgroundColor = Color.lerp(
      fromColor,
      toColor,
      effectiveProgress,
    )!;

    return Material(
      color: effectiveBackgroundColor,
      elevation: 0,
      child: Stack(children: [_buildBackButton(), _buildContent(progress)]),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 0,
      left: 0,
      height: minExtent,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          width: 56 * multiplier,
          height: kToolbarHeight * multiplier3,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: colorScheme.onSurface,
              size: 24 * multiplier,
            ),
            onPressed: () => context.pop(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(double progress) {
    final showExtra = progress < 0.7;
    final coverOpacity = 1.0 - progress;
    final titleFontSize = _lerpDouble(24, 16, progress) * multiplier;

    return Positioned.fill(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: 40 * multiplier,
            right: 16 * multiplier,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final coverSize = _calculateCoverSize(
                constraints.maxHeight,
                progress,
              );

              return _buildContentLayout(
                constraints,
                coverSize,
                coverOpacity,
                titleFontSize,
                showExtra,
                progress,
              );
            },
          ),
        ),
      ),
    );
  }

  double _calculateCoverSize(double availableHeight, double progress) {
    final maxCoverSize = availableHeight * 0.65;
    final minCoverSize = 0.0;
    return _lerpDouble(maxCoverSize, minCoverSize, progress);
  }

  Widget _buildContentLayout(
    BoxConstraints constraints,
    double coverSize,
    double coverOpacity,
    double titleFontSize,
    bool showExtra,
    double progress,
  ) {
    final availableHeight = constraints.maxHeight;
    final titleHeight = titleFontSize * 1.2;

    final maxCoverSize = availableHeight * 0.65;
    final coverScale = (coverSize / maxCoverSize).clamp(0.0, 1.0);

    final expandedTopPosition = (availableHeight - maxCoverSize) / 2;
    final collapsedTopPosition = (availableHeight - titleHeight) / 2;
    final titleTopPosition = _lerpDouble(
      expandedTopPosition,
      collapsedTopPosition,
      progress,
    );

    final expandedLeftPosition = maxCoverSize + 32 * multiplier;
    final collapsedLeftPosition = 16 * multiplier;
    final titleLeftPosition = _lerpDouble(
      expandedLeftPosition,
      collapsedLeftPosition,
      progress,
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: expandedTopPosition,
          left: 16 * multiplier,
          child: Opacity(
            opacity: coverOpacity.clamp(0.0, 1.0),
            child: Transform.scale(
              scale: coverScale,
              alignment: Alignment.center,
              child: _buildCoverImage(maxCoverSize),
            ),
          ),
        ),
        Positioned(
          top: titleTopPosition,
          left: titleLeftPosition,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
                maxLines: showExtra ? 2 : 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (showExtra && updateTime != null) ...[
                SizedBox(height: 8 * multiplier),
                Text(
                  updateTime!,
                  style: TextStyle(
                    fontSize: 12 * multiplier,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
              if (showExtra &&
                  description != null &&
                  description!.isNotEmpty) ...[
                SizedBox(height: 8 * multiplier),
                Text(
                  description!,
                  style: TextStyle(
                    fontSize: 13 * multiplier,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }

  Widget _buildCoverImage(double size) {
    return SizedBox(width: size, height: size, child: coverImage);
  }
}

class CloudDetailPlaylistPage extends HookConsumerWidget {
  final CloudMusicPlaylistData playlist;

  const CloudDetailPlaylistPage({super.key, required this.playlist});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(cloudMusicPlaylistDetailProvider(playlist.id));
    final size = MediaQuery.of(context).size;
    final colorScheme = getColorSchemeWhenReady(ref);
    final multiplier = size.multiplier;

    final createTime = playlist.createTime != null
        ? DateTime.fromMillisecondsSinceEpoch(playlist.createTime!)
        : null;

    final maxCoverSize = kToolbarHeight * 4 * multiplier * 0.65;

    final coverImage = useMemoized(
      () => CloudMusicCoverImage(
        imageUrl: playlist.coverUrl,
        colorScheme: colorScheme,
        config: CloudMusicCoverImageConfig(
          size: maxCoverSize,
          borderRadius: 8 * multiplier,
        ),
      ),
      [playlist.coverUrl, colorScheme, maxCoverSize, multiplier],
    );

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: CloudDetailPlaylistHeaderDelegate(
            title: playlist.name,
            updateTime: createTime != null
                ? '创建于 ${_formatDate(createTime)}'
                : null,
            description: playlist.description,
            size: size,
            colorScheme: colorScheme,
            context: context,
            coverImage: coverImage,
          ),
        ),
        detail.when(
          data: (data) => _buildTrackList(data, colorScheme, multiplier),
          loading: () => SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              ),
            ),
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
    );
  }

  Widget _buildTrackList(
    CloudMusicPlaylistDetailData? data,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    if (data == null) {
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(padding: EdgeInsets.all(32), child: Text('暂无数据')),
        ),
      );
    }

    final tracks = data.tracks ?? [];
    if (tracks.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(padding: EdgeInsets.all(32), child: Text('暂无歌曲')),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final track = tracks[index];
        return _TrackListItem(
          track: track,
          index: index + 1,
          colorScheme: colorScheme,
          multiplier: multiplier,
        );
      }, childCount: tracks.length),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

class _TrackListItem extends StatelessWidget {
  final CloudMusicSongData track;
  final int index;
  final ColorScheme colorScheme;
  final double multiplier;

  const _TrackListItem({
    required this.track,
    required this.index,
    required this.colorScheme,
    required this.multiplier,
  });

  @override
  Widget build(BuildContext context) {
    final artists = track.ar?.map((a) => a.name).join(', ') ?? '';
    final duration = track.dt != null ? _formatDuration(track.dt!) : null;

    return ListTile(
      leading: SizedBox(
        width: 32 * multiplier,
        child: Text(
          '$index',
          style: TextStyle(
            fontSize: 14 * multiplier,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      title: Text(
        track.name,
        style: TextStyle(
          fontSize: 15 * multiplier,
          color: colorScheme.onSurface,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        artists,
        style: TextStyle(
          fontSize: 13 * multiplier,
          color: colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: duration != null
          ? Text(
              duration,
              style: TextStyle(
                fontSize: 12 * multiplier,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            )
          : null,
    );
  }

  String _formatDuration(int milliseconds) {
    final seconds = milliseconds ~/ 1000;
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
