import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_common_artists.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/components/smart_marquee.dart';

class CloudArtistHeaderDelegate extends SliverPersistentHeaderDelegate {
  final WidgetRef ref;
  final String title;
  final int? musicSize;
  final int? albumSize;
  final String? briefDesc;
  final Size size;
  final ColorScheme colorScheme;
  final BuildContext context;
  final Color headerBackgroundColor;
  final Widget? coverImage;

  CloudArtistHeaderDelegate({
    required this.ref,
    required this.title,
    this.musicSize,
    this.albumSize,
    this.briefDesc,
    required this.size,
    required this.colorScheme,
    required this.context,
    required this.headerBackgroundColor,
    this.coverImage,
  });

  @override
  double get minExtent => kToolbarHeight * size.multiplier3;

  @override
  double get maxExtent => kToolbarHeight * 4 * size.multiplier3;

  double get multiplier3 => size.multiplier3;
  double get multiplier => size.multiplier2;

  @override
  bool shouldRebuild(covariant CloudArtistHeaderDelegate oldDelegate) =>
      title != oldDelegate.title ||
      musicSize != oldDelegate.musicSize ||
      albumSize != oldDelegate.albumSize ||
      briefDesc != oldDelegate.briefDesc ||
      colorScheme != oldDelegate.colorScheme ||
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
              context.popWrap();
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
    final maxCoverSize = availableHeight * 0.55;
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

    final maxCoverSize = availableHeight * 0.55;
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
                    if (musicSize != null || albumSize != null) ...[
                      SizedBox(height: 8 * multiplier),
                      Text(
                        '${musicSize ?? 0} Songs · ${albumSize ?? 0} Albums',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16 * multiplier,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                    if (briefDesc != null && briefDesc!.isNotEmpty) ...[
                      SizedBox(height: 8 * multiplier),
                      Text(
                        briefDesc!.replaceAll(RegExp(r'\n+'), '  '),
                        style: TextStyle(
                          fontSize: 15 * multiplier,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        maxLines: 4,
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

class CloudArtistPage extends HookConsumerWidget {
  final CloudMusicArtistData artistData;
  const CloudArtistPage({super.key, required this.artistData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final scrollController = useScrollController();
    final scrollPixels = useState(0.0);
    final headerMaxExtent = kToolbarHeight * 4 * size.multiplier3;
    final headerMinExtent = kToolbarHeight * size.multiplier3;
    final maxScroll = headerMaxExtent - headerMinExtent;
    final l10n = ref.watch(l10nProvider);

    final fromColor = Colors.transparent;
    final toColor = colorScheme.surfaceContainerHighest.withValues(alpha: 0.1);
    final statusBarProgress = maxScroll > 0
        ? (scrollPixels.value / maxScroll).clamp(0.0, 1.0)
        : 0.0;
    final statusBarColor = statusBarProgress >= 1.0
        ? colorScheme.surfaceContainerHighest
        : Color.lerp(fromColor, toColor, statusBarProgress)!;
    final provider = cloudMusicArtistDetailProvider(artistData);
    useEffect(() {
      ref.invalidate(provider);
      return null;
    }, []);
    final artistDetail = ref.watch(provider);

    final coverImage = useMemoized(
      () {
        var url = artistData.coverUrl();
        if (url.isEmpty) {
          url = artistDetail.artist.coverUrl();
        }
        return CloudMusicCoverImage(
          imageUrl: url,
          colorScheme: colorScheme,
          config: CloudMusicCoverImageConfig(
            size: kToolbarHeight * 4 * size.multiplier3 * 0.55,
            isCircular: true,
          ),
        );
      },
      [
        artistData.coverUrl(),
        colorScheme,
        artistDetail.artist.coverUrl(),
        size.multiplier3,
      ],
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
            if (notification is ScrollUpdateNotification &&
                notification.depth == 0) {
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
                  delegate: CloudArtistHeaderDelegate(
                    ref: ref,
                    title: artistDetail.artist.name,
                    musicSize: artistDetail.artist.musicSize,
                    albumSize: artistDetail.artist.albumSize,
                    briefDesc: artistDetail.artist.briefDesc,
                    size: size,
                    colorScheme: colorScheme,
                    context: context,
                    headerBackgroundColor: statusBarColor,
                    coverImage: coverImage,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 45 * size.multiplier2,
                      right: 16 * size.multiplier2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 5 * size.multiplier),
                        Text(
                          l10n.hot_songs,
                          style: TextStyle(
                            fontSize: 24 * size.multiplier,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 10 * size.multiplier),
                        _buildHotSongs(
                          context,
                          ref,
                          artistDetail,
                          colorScheme,
                          size,
                          l10n,
                        ),
                        SizedBox(height: 10 * size.multiplier),
                        Text(
                          l10n.albums,
                          style: TextStyle(
                            fontSize: 24 * size.multiplier,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 10 * size.multiplier),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: 45 * size.multiplier2,
                    right: 16 * size.multiplier2,
                  ),
                  sliver: _buildAlbums(
                    context,
                    ref,
                    artistDetail,
                    colorScheme,
                    size,
                    l10n,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 45 * size.multiplier2,
                      right: 16 * size.multiplier2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10 * size.multiplier),
                        if (ref.watch(cloudMusicAuthStateProvider)) ...[
                          Text(
                            l10n.sim_artist,
                            style: TextStyle(
                              fontSize: 24 * size.multiplier,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 10 * size.multiplier),
                          _buildSimilarArtists(
                            context,
                            ref,
                            artistDetail,
                            colorScheme,
                            size,
                          ),
                        ],
                        SizedBox(height: 10 * size.multiplier),
                        Center(
                          child: Text(
                            l10n.reach_end,
                            style: TextStyle(
                              fontSize: 12 * size.multiplier,
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10 * size.multiplier),
                      ],
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

  Widget _buildAlbums(
    BuildContext context,
    WidgetRef ref,
    CloudMusicAristDetailData artistDetail,
    ColorScheme colorScheme,
    Size size,
    AppLocalizations l10n,
  ) {
    final albumsFlag = artistDetail.hotAlbumsFlag ?? 0;
    final albums = artistDetail.hotAlbums ?? [];
    final multiplier = size.multiplier;

    if (albumsFlag == 1) {
      return _buildAlbumShimmerLoading(context, colorScheme, size, multiplier);
    }

    if (albumsFlag == -1 || albums.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _calculateAlbumCrossAxisCount(
          MediaQuery.of(context).size.width,
          size.multiplier,
        ),
        mainAxisSpacing: 10 * multiplier,
        crossAxisSpacing: 10 * multiplier,
        childAspectRatio: 0.75,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final album = albums[index];
          return Padding(
            padding: EdgeInsets.only(right: 15 * multiplier),
            child: RepaintBoundary(
              child: _buildAlbumItem(
                context,
                album,
                colorScheme,
                multiplier,
                () {
                  context.pushWrapper("/cloud-album-detail", extra: album);
                },
              ),
            ),
          );
        },
        childCount: albums.length,
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
      ),
    );
  }

  int _calculateAlbumCrossAxisCount(double availableWidth, double multiplier) {
    final maxCrossAxisExtent = 180 * multiplier;
    return (availableWidth / maxCrossAxisExtent).floor().clamp(3, 6);
  }

  Widget _buildAlbumShimmerLoading(
    BuildContext context,
    ColorScheme colorScheme,
    Size size,
    double multiplier,
  ) {
    final crossAxisCount = _calculateAlbumCrossAxisCount(
      MediaQuery.of(context).size.width,
      size.multiplier,
    );
    final itemCount = crossAxisCount * 3;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 10 * multiplier,
          crossAxisSpacing: 10 * multiplier,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return _buildAlbumItemShimmer(context, colorScheme);
        }, childCount: itemCount),
      ),
    );
  }

  Widget _buildAlbumItem(
    BuildContext context,
    CloudMusicAlbumData album,
    ColorScheme colorScheme,
    double multiplier,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final coverSize = constraints.maxWidth;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: CloudMusicCoverImage(
                    imageUrl: album.picUrl ?? '',
                    colorScheme: colorScheme,
                    config: CloudMusicCoverImageConfig(
                      size: coverSize,
                      borderRadius: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SmartMarquee(
                text: album.name,
                style: TextStyle(
                  fontSize: 16 * multiplier,
                  fontWeight: FontWeight.normal,
                ),
                pauseOnHover: true,
                pauseAfterRound: const Duration(seconds: 5),
                alignment: Alignment.center,
              ),

              const SizedBox(height: 2),
              Text(
                formatTime(album.publishTime),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14 * multiplier,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAlbumItemShimmer(BuildContext context, ColorScheme colorScheme) {
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final coverSize = constraints.maxWidth;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: coverSize * 0.8,
                height: 12,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: coverSize * 0.5,
                height: 10,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHotSongs(
    BuildContext context,
    WidgetRef ref,
    CloudMusicAristDetailData artistDetail,
    ColorScheme colorScheme,
    Size size,
    AppLocalizations l10n,
  ) {
    final hotSongFlag = artistDetail.hotSongFlag ?? 0;
    final hotSongs = artistDetail.hotSongs ?? [];

    if (hotSongFlag == 1) {
      final columns = _calculateHotSongColumns(size);
      return _buildHotSongShimmerGrid(colorScheme, size, columns);
    }

    if (hotSongFlag == -1 || hotSongs.isEmpty) {
      return const SizedBox.shrink();
    }

    final expanded = useState(false);
    final defaultRows = 3;
    final maxRows = 6;
    final columns = _calculateHotSongColumns(size);
    final songsToShow = expanded.value
        ? hotSongs.take(maxRows * columns).toList()
        : hotSongs.take(defaultRows * columns).toList();
    final totalRows = (songsToShow.length / columns).ceil();
    final canExpand = hotSongs.length > defaultRows * columns;
    final canCollapse = expanded.value && totalRows > defaultRows;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHotSongGrid(
          context,
          ref,
          songsToShow.length,
          hotSongs,
          colorScheme,
          size,
          columns,
          totalRows,
          l10n,
        ),
        if (canExpand || canCollapse)
          Padding(
            padding: EdgeInsets.only(
              top: 8 * size.multiplier,
              bottom: 8 * size.multiplier,
            ),
            child: InkWell(
              onTap: () => expanded.value = !expanded.value,
              child: Text(
                expanded.value ? l10n.collapse : l10n.more,
                style: TextStyle(
                  fontSize: 14 * size.multiplier,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }

  int _calculateHotSongColumns(Size size) {
    if (size.lgAndUp) {
      return 4;
    } else if (size.isMd) {
      return 3;
    } else {
      return 2;
    }
  }

  Widget _buildHotSongGrid(
    BuildContext context,
    WidgetRef ref,
    int visibleSize,
    List<CloudMusicSongData> songs,
    ColorScheme colorScheme,
    Size size,
    int columns,
    int rows,
    AppLocalizations l10n,
  ) {
    final isLoggedIn = ref.watch(cloudMusicAuthStateProvider);
    final user = ref.watch(cloudUserInfoProvider);
    final userVipType = user.value?.vipType ?? 0;
    return Column(
      children: List.generate(rows, (rowIndex) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: rowIndex < rows - 1 ? 8 * size.multiplier : 0,
          ),
          child: Row(
            children: List.generate(columns, (colIndex) {
              final index = rowIndex + colIndex * rows;
              if (index >= visibleSize) {
                return const Expanded(child: SizedBox());
              }
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: colIndex < columns - 1 ? 12 * size.multiplier : 0,
                  ),
                  child: _buildHotSongItem(
                    context,
                    ref,
                    index,
                    songs[index],
                    colorScheme,
                    size,
                    l10n,
                    isLoggedIn,
                    userVipType,
                    (ci) async {
                      var targetTracks = <ToneHarborTrackObject>[];
                      var initIndex = ci;
                      final isLoggedIn = ref.read(cloudMusicAuthStateProvider);
                      final user = await ref.read(cloudUserInfoProvider.future);
                      final userVipType = user?.vipType ?? 0;

                      for (var i = 0; i < songs.length; i++) {
                        var currentTrack = songs[i];
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
                    },
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Widget _buildHotSongItem(
    BuildContext context,
    WidgetRef ref,
    int index,
    CloudMusicSongData song,
    ColorScheme colorScheme,
    Size size,
    AppLocalizations l10n,
    bool isLoggedIn,
    int? userVipType,
    Function(int ci)? onTap,
  ) {
    final multiplier = size.multiplier;
    final isPlayable = isCloudTrackPlayable(
      song,
      l10n,
      isLoggedIn: isLoggedIn,
      userVipType: userVipType,
    );

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8 * multiplier),
      child: InkWell(
        borderRadius: BorderRadius.circular(8 * multiplier),
        hoverColor: colorScheme.surface.withValues(alpha: 0.3),
        onTap: isPlayable.playable ? () => onTap?.call(index) : null,
        child: ContextMenuRegion(
          enableDefaultGestures: isPlayable.playable,
          contextMenu: ContextMenu(
            entriesBuilder: () {
              return <ContextMenuEntry>[
                MenuHeader(text: song.name),
                MenuDivider(),
                MenuItem(
                  label: Text(l10n.download),
                  icon: Icon(Icons.download_rounded),
                  onSelected: (value) async {
                    ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                    await ref
                        .read(downloadManagerProvider.notifier)
                        .addToQueue(song.asTrack());
                    ref
                        .read(requestFlagProvider.notifier)
                        .setRequestFlag(false);
                  },
                ),
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
                              song.asTrack(),
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
                            .addTrack(song.asTrack());
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
              Container(
                height: 56 * multiplier,
                padding: EdgeInsets.symmetric(horizontal: 8 * multiplier),
                child: Row(
                  children: [
                    CloudMusicCoverImage(
                      imageUrl: song.coverUrl(),
                      colorScheme: colorScheme,
                      config: CloudMusicCoverImageConfig(
                        size: 50 * multiplier,
                        borderRadius: 12 * multiplier,
                      ),
                    ),
                    SizedBox(width: 8 * multiplier),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            song.name,
                            style: TextStyle(
                              fontSize: 16 * multiplier,
                              fontWeight: FontWeight.bold,
                              color: isPlayable.playable
                                  ? colorScheme.onSurface
                                  : Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2 * multiplier),
                          Text(
                            song.artistName,
                            style: TextStyle(
                              fontSize: 13 * multiplier,
                              color: isPlayable.playable
                                  ? colorScheme.onSurfaceVariant
                                  : Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isPlayable.playable)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2 * multiplier,
                      vertical: 2 * multiplier,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      isPlayable.reason ?? l10n.paid_album,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 6 * multiplier,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHotSongShimmerGrid(
    ColorScheme colorScheme,
    Size size,
    int columns,
  ) {
    final defaultRows = 3;
    final itemCount = columns * defaultRows;

    return Column(
      children: List.generate(defaultRows, (rowIndex) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: rowIndex < defaultRows - 1 ? 8 * size.multiplier : 0,
          ),
          child: Row(
            children: List.generate(columns, (colIndex) {
              final index = rowIndex + colIndex * defaultRows;
              if (index >= itemCount) {
                return const Expanded(child: SizedBox());
              }
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: colIndex < columns - 1 ? 12 * size.multiplier : 0,
                  ),
                  child: _HotSongShimmerItem(
                    colorScheme: colorScheme,
                    size: size,
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Widget _buildSimilarArtists(
    BuildContext context,
    WidgetRef ref,
    CloudMusicAristDetailData artistDetail,
    ColorScheme colorScheme,
    Size size,
  ) {
    final similarArtistsFlag = artistDetail.similarArtistsFlag ?? 0;
    final similarArtists = artistDetail.similarArtists ?? [];
    final config = CloudMusicArtistLayoutConfig.defaultConfig
        .copyWith(height: 220, itemWidth: 180, itemSpacing: 20)
        .withMultiplier(size.multiplier);

    return CloudMusicArtistHorizontalListView(
      artists: similarArtists,
      colorScheme: colorScheme,
      config: config,
      isLoading: similarArtistsFlag == 1,
      shimmerCount: 6,
    );
  }
}

class _HotSongShimmerItem extends StatelessWidget {
  const _HotSongShimmerItem({required this.colorScheme, required this.size});

  final ColorScheme colorScheme;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final multiplier = size.multiplier;
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: Container(
        height: 56 * multiplier,
        padding: EdgeInsets.symmetric(horizontal: 8 * multiplier),
        child: Row(
          children: [
            Container(
              width: 50 * multiplier,
              height: 50 * multiplier,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(12 * multiplier),
              ),
            ),
            SizedBox(width: 8 * multiplier),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 16 * multiplier,
                    width: 120 * multiplier,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 2 * multiplier),
                  Container(
                    height: 14 * multiplier,
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
          ],
        ),
      ),
    );
  }
}
