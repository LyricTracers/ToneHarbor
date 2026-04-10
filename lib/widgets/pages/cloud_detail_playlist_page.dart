import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/layouts/playing_detail_layout.dart';

class CloudDetailPlaylistHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String? updateTime;
  final String? description;
  final String? creator;
  final Size size;
  final ColorScheme colorScheme;
  final BuildContext context;
  final Widget coverImage;
  final Color headerBackgroundColor;

  CloudDetailPlaylistHeaderDelegate({
    required this.title,
    this.updateTime,
    this.description,
    this.creator,
    required this.size,
    required this.colorScheme,
    required this.context,
    required this.coverImage,
    required this.headerBackgroundColor,
  });

  @override
  double get minExtent => kToolbarHeight * size.multiplier3;

  @override
  double get maxExtent => kToolbarHeight * 5 * size.multiplier3;
  double get multiplier3 => size.multiplier3;
  double get multiplier => size.multiplier2;

  @override
  bool shouldRebuild(covariant CloudDetailPlaylistHeaderDelegate oldDelegate) =>
      title != oldDelegate.title ||
      updateTime != oldDelegate.updateTime ||
      description != oldDelegate.description ||
      creator != oldDelegate.creator ||
      headerBackgroundColor != oldDelegate.headerBackgroundColor;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Material(
      color: headerBackgroundColor,
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
    final coverOpacity = 1.0 - progress;
    final titleFontSize = _lerpDouble(24, 16, progress) * multiplier;
    final extraOpacity = (1.0 - progress / 0.7).clamp(0.0, 1.0);

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
                extraOpacity,
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
    double extraOpacity,
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
                maxLines: coverOpacity > 0.2 ? 2 : 1,
                overflow: TextOverflow.ellipsis,
              ),
              Opacity(
                opacity: extraOpacity.clamp(0.0, 1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (creator != null) ...[
                      SizedBox(height: 8 * multiplier),
                      Text(
                        'Playlist by $creator',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15 * multiplier,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                    if (updateTime != null) ...[
                      SizedBox(height: 8 * multiplier),
                      Text(
                        updateTime!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13 * multiplier,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                    if (description != null && description!.isNotEmpty) ...[
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
    final l10n = ref.watch(l10nProvider);

    final scrollPixels = useState(0.0);
    final scrollController = useScrollController();
    final isLoadingMore = useState(false);

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;
        if (currentScroll >= maxScroll * 0.8 && !isLoadingMore.value) {
          final detailData = ref
              .read(cloudMusicPlaylistDetailProvider(playlist.id))
              .value;
          final hasMore =
              detailData?.trackIds != null &&
              (detailData?.tracks?.length ?? 0) <
                  (detailData?.trackIds?.length ?? 0);
          if (hasMore) {
            ref
                .read(cloudMusicPlaylistDetailProvider(playlist.id).notifier)
                .loadMore();
            isLoadingMore.value = true;
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController, isLoadingMore.value]);

    useEffect(() {
      if (detail.hasValue && !detail.isLoading) {
        isLoadingMore.value = false;
      }
      return null;
    }, [detail]);

    final createTime = playlist.createTime != null
        ? DateTime.fromMillisecondsSinceEpoch(playlist.createTime!)
        : null;

    final maxCoverSize = kToolbarHeight * 4 * multiplier * 0.65;

    final coverImage = useMemoized(
      () => CloudMusicCoverImage(
        imageUrl: playlist.coverUrl(),
        colorScheme: colorScheme,
        config: CloudMusicCoverImageConfig(
          size: maxCoverSize,
          borderRadius: 8 * multiplier,
        ),
      ),
      [playlist.coverUrl(), colorScheme, maxCoverSize, multiplier],
    );

    final headerMaxExtent = kToolbarHeight * 5 * size.multiplier3;
    final headerMinExtent = kToolbarHeight * size.multiplier3;
    final maxScroll = headerMaxExtent - headerMinExtent;

    final fromColor = Colors.transparent;
    final toColor = colorScheme.surfaceContainerHighest.withValues(alpha: 0.1);
    final statusBarProgress = maxScroll > 0
        ? (scrollPixels.value / maxScroll).clamp(0.0, 1.0)
        : 0.0;
    final statusBarColor = statusBarProgress >= 1.0
        ? colorScheme.surfaceContainerHighest
        : Color.lerp(fromColor, toColor, statusBarProgress)!;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: MediaQuery.of(context).padding.top,
          child: Container(color: statusBarColor),
        ),
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              scrollPixels.value = notification.metrics.pixels;
            }
            return false;
          },
          child: SafeArea(
            top: true,
            bottom: false,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: CloudDetailPlaylistHeaderDelegate(
                    title: playlist.name,
                    updateTime: createTime != null
                        ? "Created ${_formatDate(createTime)}"
                        : null,
                    description: detail.value?.description,
                    creator: playlist.creator?.nickname,
                    size: size,
                    colorScheme: colorScheme,
                    context: context,
                    coverImage: coverImage,
                    headerBackgroundColor: statusBarColor,
                  ),
                ),
                detail.when(
                  data: (data) => _buildTrackList(
                    ref,
                    data,
                    colorScheme,
                    size,
                    l10n,
                    isLoadingMore.value,
                  ),
                  loading: () => _TrackListShimmerLoading(
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
        ),
      ],
    );
  }

  Widget _buildTrackList(
    WidgetRef ref,
    CloudMusicPlaylistDetailData? data,
    ColorScheme colorScheme,
    Size size,
    AppLocalizations l10n,
    bool isLoadingMore,
  ) {
    final tracks = data?.tracks ?? [];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == tracks.length) {
          return SizedBox(
            height: 60,
            child: Center(
              child: isLoadingMore
                  ? const CircularProgressIndicator(strokeWidth: 2)
                  : Text(
                      l10n.reach_end,
                      style: TextStyle(
                        fontSize: 12 * size.multiplier,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
            ),
          );
        }
        final track = tracks[index];
        return RepaintBoundary(
          child: _TrackListItem(
            track: track,
            index: index + 1,
            colorScheme: colorScheme,
            size: size,
            onTap: (ci) async {
              var targetTracks = <ToneHarborTrackObject>[];
              var initIndex = ci - 1;
              final isLoggedIn = ref.read(cloudMusicAuthStateProvider);
              final user = await ref.read(cloudUserInfoProvider.future);
              final userVipType = user?.vipType ?? 0;

              for (var i = 0; i < tracks.length; i++) {
                var currentTrack = tracks[i];
                final isPlayable = isCloudTrackPlayable(
                  track,
                  l10n,
                  isLoggedIn: isLoggedIn,
                  userVipType: userVipType,
                );
                if (isPlayable.playable) {
                  if (initIndex == i) {
                    initIndex = targetTracks.length;
                  }
                  targetTracks.add(currentTrack.asTrack());
                }
              }
              if (targetTracks.isEmpty) return;
              await ref
                  .read(audioPlayerStateProvider.notifier)
                  .load(
                    targetTracks,
                    initialIndex: initIndex < targetTracks.length
                        ? initIndex
                        : 0,
                    autoPlay: true,
                  );
              if (context.mounted) {
                if (size.isXs) {
                  showModalBottomSheetWidget(
                    ref.context,
                    colorScheme,
                    isScrollControlled: true,
                    (context) => const PlayingDetailLayout(),
                  );
                } else {
                  context.pushWrapper("/playing_detail");
                }
              }
            },
          ),
        );
      }, childCount: tracks.length + 1),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

class _TrackListShimmerLoading extends StatelessWidget {
  const _TrackListShimmerLoading({
    required this.colorScheme,
    required this.size,
  });

  final ColorScheme colorScheme;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final multiplier = size.multiplier;
    final itemHeight = 66.0 * multiplier;

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Shimmer.fromColors(
          baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          highlightColor: colorScheme.surface.withValues(alpha: 1.0),
          child: Padding(
            padding: EdgeInsets.only(
              left: 15 * multiplier,
              right: 20 * multiplier,
              top: 4 * multiplier,
              bottom: 4 * multiplier,
            ),
            child: SizedBox(
              height: itemHeight,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: 20 * multiplier),
                  Container(
                    width: itemHeight * 0.8,
                    height: itemHeight * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 15 * multiplier),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 16 * multiplier,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(height: 6 * multiplier),
                        Container(
                          width: 100 * multiplier,
                          height: 12 * multiplier,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }, childCount: 20),
    );
  }
}

class _TrackListItem extends HookConsumerWidget {
  final CloudMusicSongData track;
  final int index;
  final ColorScheme colorScheme;
  final Size size;
  final Function(int) onTap;

  const _TrackListItem({
    required this.track,
    required this.index,
    required this.colorScheme,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = track.ar?.map((a) => a.name).join(', ') ?? '';
    final duration = track.dt != null ? _formatDuration(track.dt!) : null;
    final multiplier = size.multiplier;
    double itemHeight = 66.0 * multiplier;
    var isHovered = useState(false);
    var isPressed = useState(false);
    final l10n = ref.watch(l10nProvider);
    final isLoggedIn = ref.watch(cloudMusicAuthStateProvider);
    final userVipType = ref.watch(
      cloudUserInfoProvider.select((value) => value.value?.vipType ?? 0),
    );
    final isPlayable = isCloudTrackPlayable(
      track,
      l10n,
      isLoggedIn: isLoggedIn,
      userVipType: userVipType,
    );

    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: ContextMenuRegion(
        enableDefaultGestures: isPlayable.playable,
        contextMenu: ContextMenu(
          entriesBuilder: () {
            return <ContextMenuEntry>[
              MenuHeader(text: track.name),
              MenuDivider(),
              MenuItem.submenu(
                label: Text(l10n.add_to),
                icon: const Icon(Icons.add_box_rounded),
                items: [
                  MenuItem(
                    label: Text(l10n.next_song),
                    onSelected: (value) async {
                      ref
                          .read(requestFlagProvider.notifier)
                          .setRequestFlag(true);
                      await ref
                          .read(audioPlayerStateProvider.notifier)
                          .addTrackAtFirst(
                            track.asTrack(),
                            allowDuplicates: true,
                          );
                      ref
                          .read(requestFlagProvider.notifier)
                          .setRequestFlag(false);
                    },
                  ),
                  MenuItem(
                    label: Text(l10n.play_queue),
                    onSelected: (value) async {
                      ref
                          .read(requestFlagProvider.notifier)
                          .setRequestFlag(true);
                      await ref
                          .read(audioPlayerStateProvider.notifier)
                          .addTrack(track.asTrack());
                      ref
                          .read(requestFlagProvider.notifier)
                          .setRequestFlag(false);
                    },
                  ),
                ],
              ),
            ];
          },
          padding: const EdgeInsets.all(8.0),
        ),
        child: Stack(
          children: [
            if (!isPlayable.playable)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6 * multiplier,
                    vertical: 2 * multiplier,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8 * multiplier),
                    ),
                  ),
                  child: Text(
                    isPlayable.reason ?? l10n.paid_album,
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 8 * multiplier,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Container(
              height: itemHeight,
              color: isHovered.value || isPressed.value
                  ? colorScheme.outline.withValues(alpha: .1)
                  : Colors.transparent,
              child: InkWell(
                onDoubleTap: () {
                  isPressed.value = false;
                  if (isPlayable.playable) {
                    onTap(index);
                  }
                },
                onTapDown: (details) => isPressed.value = true,
                onTapUp: (details) => isPressed.value = false,
                onTapCancel: () => isPressed.value = false,
                onTap: () {
                  isPressed.value = false;
                  if (isPlayable.playable) {
                    onTap(index);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15 * multiplier,
                    right: 20 * multiplier,
                    top: 4 * multiplier,
                    bottom: 4 * multiplier,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$index',
                        style: TextStyle(
                          fontSize: 14 * multiplier,
                          color: isPlayable.playable
                              ? colorScheme.primary
                              : Colors.grey,
                        ),
                      ),
                      SizedBox(width: 20 * multiplier),
                      CloudMusicCoverImage(
                        imageUrl: track.coverUrl(),
                        colorScheme: colorScheme,
                        config: CloudMusicCoverImageConfig(
                          size: itemHeight * 0.8,
                          borderRadius: 8,
                        ),
                      ),
                      SizedBox(width: 15 * multiplier),

                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              track.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16 * multiplier,
                                fontWeight: FontWeight.bold,
                                color: isPlayable.playable
                                    ? colorScheme.onSurface
                                    : Colors.grey,
                              ),
                            ),
                            SizedBox(height: 4 * multiplier),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    artists,
                                    style: TextStyle(
                                      fontSize: 12 * multiplier,
                                      color: isPlayable.playable
                                          ? colorScheme.onSurfaceVariant
                                          : Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),

                                if (track.al != null &&
                                    track.al!.name.isNotEmpty &&
                                    size.mdAndDown) ...[
                                  SizedBox(width: 10 * multiplier),
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      '- ${track.al!.name}',
                                      style: TextStyle(
                                        fontSize: 12 * multiplier,
                                        color: isPlayable.playable
                                            ? colorScheme.onSurfaceVariant
                                            : Colors.grey,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (track.al != null &&
                          track.al!.name.isNotEmpty &&
                          size.lgAndUp) ...[
                        SizedBox(width: 15 * multiplier),
                        Expanded(
                          child: Text(
                            track.al!.name,
                            style: TextStyle(
                              fontSize: 14 * multiplier,
                              color: isPlayable.playable
                                  ? colorScheme.onSurfaceVariant
                                  : Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                      if (duration != null) ...[
                        SizedBox(width: 15 * multiplier),
                        Text(
                          duration,
                          style: TextStyle(
                            fontSize: 12 * multiplier,
                            color: isPlayable.playable
                                ? colorScheme.onSurface.withValues(alpha: 0.5)
                                : Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 10 * multiplier),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(int milliseconds) {
    final seconds = milliseconds ~/ 1000;
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
