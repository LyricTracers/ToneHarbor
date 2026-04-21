import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_common_songs.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/components/common_shimmer_loader.dart';

class CloudDetailPlaylistHeaderDelegate extends SliverPersistentHeaderDelegate {
  final WidgetRef ref;
  final AppLocalizations l10n;
  final String title;
  final String? updateTime;
  final String? description;
  final String? creator;
  final Size size;
  final ColorScheme colorScheme;
  final BuildContext context;
  final Widget coverImage;
  final Color headerBackgroundColor;
  final CloudMusicPlaylistDetailData? detail;
  final SongSelectionState songSelectionState;
  final ValueNotifier<bool> isFavoriteState;

  CloudDetailPlaylistHeaderDelegate({
    required this.ref,
    required this.l10n,
    required this.title,
    this.updateTime,
    this.description,
    this.creator,
    required this.size,
    required this.colorScheme,
    required this.context,
    required this.coverImage,
    required this.headerBackgroundColor,
    required this.detail,
    required this.songSelectionState,
    required this.isFavoriteState,
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
      headerBackgroundColor != oldDelegate.headerBackgroundColor ||
      detail != oldDelegate.detail;

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
      child: Stack(
        children: [
          _buildBackButton(),
          if (detail?.tracks != null &&
              detail?.tracks!.isNotEmpty == true &&
              !songSelectionState.selectionType) ...[
            _buildFavoriteButton(context, colorScheme),
            _buildSelectedButton(),
          ],
          _buildContent(progress),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton(BuildContext context, ColorScheme colorScheme) {
    final h = minExtent;
    final w = 56 * multiplier;

    return Positioned(
      top: 0,
      right: w,
      height: h,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          width: w,
          height: h,
          child: ValueListenableBuilder<bool>(
            valueListenable: isFavoriteState,
            builder: (context, isFavorite, child) {
              return IconButton(
                onPressed: () async {
                  if (isFavorite) {
                    await ref
                        .read(favoritePlaylistStateProvider.notifier)
                        .removeFavoritePlaylist(detail!.id.toString());
                  } else {
                    await ref
                        .read(favoritePlaylistStateProvider.notifier)
                        .addFavoritePlaylist(
                          detail!.id.toString(),
                          title,
                          cloudData: detail!,
                        );
                  }

                  isFavoriteState.value = !isFavorite;
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  size: 24 * multiplier,
                ),
                tooltip: l10n.favorite,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedButton() {
    final h = minExtent;
    return Positioned(
      top: 0,
      right: 0,
      height: h,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          width: 56 * multiplier,
          height: h,
          child: IconButton(
            onPressed: () {
              ref.read(songSelectionProvider.notifier).toggle();
            },
            icon: Icon(
              Icons.fact_check_rounded,
              color: colorScheme.onSurface,
              size: 24 * multiplier,
            ),
            tooltip: l10n.select_all,
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    final h = minExtent;
    return Positioned(
      top: 0,
      left: 0,
      height: h,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          width: 56 * multiplier,
          height: h,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: colorScheme.onSurface,
              size: 24 * multiplier,
            ),
            onPressed: () {
              if (ref.read(songSelectionProvider).selectionType) {
                ref.invalidate(songSelectionProvider);
              } else {
                context.popWrap();
              }
            },
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
            right: _lerpDouble(16, 80, progress) * multiplier,
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
    final updateTime = playlist.updateTime != null
        ? DateTime.fromMillisecondsSinceEpoch(playlist.updateTime!)
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

    final songSelectionState = ref.watch(
      songSelectionProvider.select(
        (state) => SongSelectionState(
          selectionType: state.selectionType,
          ids: {},
          boxState: state.boxState,
        ),
      ),
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
    final isFavoriteState = useState(
      ref
          .read(favoritePlaylistStateProvider.notifier)
          .isFavoritePlaylist(playlist.id.toString()),
    );
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
                    ref: ref,
                    l10n: l10n,
                    title: playlist.name,
                    updateTime: updateTime != null
                        ? "Updated ${formatDate(updateTime)}"
                        : createTime != null
                        ? "Created ${formatDate(createTime)}"
                        : null,
                    description:
                        detail.value?.description ?? playlist.description,
                    creator: playlist.creator?.nickname,
                    size: size,
                    colorScheme: colorScheme,
                    context: context,
                    coverImage: coverImage,
                    headerBackgroundColor: statusBarColor,
                    detail: detail.value,
                    songSelectionState: songSelectionState,
                    isFavoriteState: isFavoriteState,
                  ),
                ),
                detail.when(
                  data: (data) => buildTrackList(
                    ref,
                    data?.tracks,
                    colorScheme,
                    size,
                    l10n,
                    isLoadingMore.value,
                    playlist.id,
                    data?.creator,
                  ),
                  loading: () => TrackListShimmerLoading(
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
        if (songSelectionState.selectionType)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: selectionBottom(
              ref,
              size,
              colorScheme,
              l10n,
              detail.value?.tracks,
            ),
          ),
      ],
    );
  }
}
