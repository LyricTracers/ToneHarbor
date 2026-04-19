import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/services/cloud_music/playlists.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/components/common_track_list_item.dart';
import 'package:toneharbor/widgets/layouts/playing_detail_layout.dart';

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
                  data: (data) => _buildTrackList(
                    ref,
                    data,
                    colorScheme,
                    size,
                    l10n,
                    isLoadingMore.value,
                    songSelectionState,
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
        if (songSelectionState.selectionType)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _selectionBottom(ref, size, colorScheme, l10n, detail.value),
          ),
      ],
    );
  }

  bool _checkIdsEmpty(Set<String> ids, WidgetRef ref) {
    if (ids.isEmpty) {
      if (ref.context.mounted) {
        showSnackBar(
          ref.read(l10nProvider).no_selected_songs,
          ref.context,
          getColorSchemeWhenReady(ref).secondary,
        );
      }
      return true;
    }
    return false;
  }

  Set<ToneHarborTrackObject> _getSelectedTracks(
    List<CloudMusicSongData> tracks,
    Set<String> ids,
  ) {
    return ids
        .map(
          (id) => tracks
              .firstWhere((element) => element.id.toString() == id)
              .asTrack(),
        )
        .toSet();
  }

  bool _checkIdsLimit(
    Set<String> ids,
    int limit,
    WidgetRef ref,
    String message,
  ) {
    if (ids.length > limit) {
      if (ref.context.mounted) {
        showSnackBar(
          message,
          ref.context,
          getColorSchemeWhenReady(ref).secondary,
        );
      }
      return true;
    }
    return false;
  }

  Widget _selectionBottom(
    WidgetRef ref,
    Size size,
    ColorScheme colorScheme,
    AppLocalizations l10n,
    CloudMusicPlaylistDetailData? detail,
  ) {
    if (detail == null || detail.tracks == null || detail.tracks!.isEmpty) {
      return SizedBox.shrink();
    }
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        height: kToolbarHeight * size.multiplier3,
        color: colorScheme.surfaceContainerHighest,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * size.multiplier2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      final ids = ref.read(songSelectionProvider).ids;
                      if (_checkIdsEmpty(ids, ref)) return;
                      ref.invalidate(songSelectionProvider);
                      ref
                          .read(downloadManagerProvider.notifier)
                          .addAllToQueue(
                            _getSelectedTracks(detail.tracks!, ids),
                          );
                    },
                    icon: Icon(Icons.download_rounded, size: 18),
                    tooltip: l10n.download,
                  ),
                  IconButton(
                    onPressed: () async {
                      final ids = ref.read(songSelectionProvider).ids;
                      if (_checkIdsEmpty(ids, ref)) return;
                      if (_checkIdsLimit(
                        ids,
                        1000,
                        ref,
                        l10n.queue_limit_exceeded,
                      )) {
                        return;
                      }

                      final selectedTracks = _getSelectedTracks(
                        detail.tracks!,
                        ids,
                      );
                      await ref
                          .read(audioPlayerStateProvider.notifier)
                          .addTracksAtFirst(
                            selectedTracks,
                            allowDuplicates: true,
                          );
                      if (!audioPlayer.isPlaying) {
                        var index =
                            audioPlayer.currentIndex < 0 ||
                                audioPlayer.currentIndex >=
                                    audioPlayer.sources.length
                            ? 0
                            : audioPlayer.currentIndex;
                        await audioPlayer.jumpTo(index);
                      }
                      ref.invalidate(songSelectionProvider);
                    },
                    icon: Icon(Icons.queue_play_next_rounded, size: 18),
                    tooltip: l10n.next_song,
                  ),
                  IconButton(
                    onPressed: () async {
                      final ids = ref.read(songSelectionProvider).ids;
                      if (_checkIdsEmpty(ids, ref)) return;
                      if (_checkIdsLimit(
                        ids,
                        1000,
                        ref,
                        l10n.queue_limit_exceeded,
                      )) {
                        return;
                      }

                      final selectedTracks = _getSelectedTracks(
                        detail.tracks!,
                        ids,
                      );
                      await ref
                          .read(audioPlayerStateProvider.notifier)
                          .addTracks(selectedTracks);
                      if (!audioPlayer.isPlaying) {
                        var index =
                            audioPlayer.currentIndex < 0 ||
                                audioPlayer.currentIndex >=
                                    audioPlayer.sources.length
                            ? 0
                            : audioPlayer.currentIndex;
                        await audioPlayer.jumpTo(index);
                      }
                      ref.invalidate(songSelectionProvider);
                    },
                    icon: Icon(Icons.queue_music_rounded, size: 18),
                    tooltip: l10n.play_queue,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    l10n.select_all,
                    style: TextStyle(
                      fontSize: 14 * size.multiplier2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final selection = ref.watch(songSelectionProvider);
                      final isLoggedIn = ref.read(cloudMusicAuthStateProvider);
                      final user = ref.read(cloudUserInfoProvider);

                      final selectableSongs = detail.tracks!.where((song) {
                        final isPlayable = isCloudTrackPlayable(
                          song,
                          l10n,
                          isLoggedIn: isLoggedIn,
                          userVipType: user.value?.vipType ?? 0,
                        );
                        return isPlayable.playable;
                      }).toList();
                      return Checkbox(
                        shape: const CircleBorder(),
                        value: selection.ids.length == selectableSongs.length,
                        onChanged: (b) {
                          if (b == true) {
                            ref
                                .read(songSelectionProvider.notifier)
                                .selectAll(
                                  selectableSongs.map((song) {
                                    return song.id.toString();
                                  }).toSet(),
                                );
                          } else {
                            ref
                                .read(songSelectionProvider.notifier)
                                .deSelectAll();
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackList(
    WidgetRef ref,
    CloudMusicPlaylistDetailData? data,
    ColorScheme colorScheme,
    Size size,
    AppLocalizations l10n,
    bool isLoadingMore,
    SongSelectionState songSelectionState,
  ) {
    final tracks = data?.tracks ?? [];
    final creator = data?.creator;

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
            pid: data!.id,
            creator: creator,
            track: track,
            index: index + 1,
            colorScheme: colorScheme,
            size: size,
            songSelectionState: songSelectionState,
            onTap: (ci) async {
              var targetTracks = <ToneHarborTrackObject>[];
              var initIndex = ci - 1;
              final isLoggedIn = ref.read(cloudMusicAuthStateProvider);
              final user = await ref.read(cloudUserInfoProvider.future);
              final userVipType = user?.vipType ?? 0;

              for (var i = 0; i < tracks.length; i++) {
                var currentTrack = tracks[i];
                final isPlayable = isCloudTrackPlayable(
                  currentTrack,
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
  final SongSelectionState songSelectionState;
  final Function(int) onTap;
  final CloudMusicUserData? creator;
  final int pid;

  const _TrackListItem({
    required this.pid,
    this.creator,
    required this.track,
    required this.index,
    required this.colorScheme,
    required this.size,
    required this.songSelectionState,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final multiplier = size.multiplier2;
    final itemHeight = 66.0 * multiplier;
    var localSelected = useState(false);
    var useInfo = ref.watch(cloudUserInfoProvider);

    useEffect(() {
      localSelected.value = ref
          .read(songSelectionProvider.notifier)
          .isSelected(track.id.toString());
      return null;
    }, [songSelectionState.selectionType]);

    useEffect(() {
      localSelected.value = ref
          .read(songSelectionProvider.notifier)
          .isSelected(track.id.toString());
      return null;
    }, [songSelectionState.boxState]);

    void updateState() {
      localSelected.value = !ref
          .read(songSelectionProvider.notifier)
          .isSelected(track.id.toString());
      var flag = localSelected.value;
      Future.microtask(() {
        if (flag) {
          ref.read(songSelectionProvider.notifier).select(track.id.toString());
        } else {
          ref
              .read(songSelectionProvider.notifier)
              .deSelect(track.id.toString());
        }
      });
    }

    return CommonTrackListItem(
      track: track,
      index: index,
      colorScheme: colorScheme,
      size: size,
      onTap: (idx) {
        if (songSelectionState.selectionType) {
          updateState();
        } else {
          onTap(idx);
        }
      },
      contextMenuEntries: <ContextMenuEntry>[
        if (track.al != null && track.al!.name.isNotEmpty) ...[
          MenuItem(
            label: Text(track.al!.name),
            icon: const Icon(Icons.album_rounded, size: 18),
            onSelected: (value) {
              context.pushWrapper("/cloud-album-detail", extra: track.al);
            },
          ),
        ],
        if (creator != null && creator!.userId == useInfo.value?.userId) ...[
          MenuItem(
            label: Text(ref.read(l10nProvider).delete_from_playlist),
            icon: const Icon(Icons.delete_rounded, size: 18),
            onSelected: (value) async {
              ref.read(requestFlagProvider.notifier).setRequestFlag(true);
              try {
                var result = await updateTrackSongs(ref, pid, track.id, false);
                if (result) {
                  await audioStationRequestCache.delete(
                    'cloud_playlistDetail:$pid',
                  );
                  ref.invalidate(cloudMusicPlaylistDetailProvider(pid));
                  ref.invalidate(songSelectionProvider);
                }
              } catch (e) {
                if (context.mounted) {
                  showSnackBarError(e, context, colorScheme.secondary);
                }
              } finally {
                ref.read(requestFlagProvider.notifier).setRequestFlag(false);
              }
            },
          ),
        ],
      ],
      enableSelection: songSelectionState.selectionType,
      showAlbumName: true,
      leading: CloudMusicCoverImage(
        imageUrl: track.coverUrl(),
        colorScheme: colorScheme,
        config: CloudMusicCoverImageConfig(
          size: itemHeight * 0.8,
          borderRadius: 8,
        ),
      ),
      trailing: songSelectionState.selectionType
          ? Checkbox(
              shape: const CircleBorder(),
              value: localSelected.value,
              onChanged: (_) {
                updateState();
              },
            )
          : null,
    );
  }
}
