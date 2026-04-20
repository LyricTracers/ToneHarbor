import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_common_artists.dart';
import 'package:toneharbor/widgets/components/cloud_common_songs.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/components/cloud_albums_cat.dart';

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
  final String id;

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
    required this.id,
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
      child: Stack(
        children: [
          _buildBackButton(),
          _buildAllSongButton(),
          _buildContent(progress),
        ],
      ),
    );
  }

  Widget _buildAllSongButton() {
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
              context.pushWrapper(
                "/cloud-artist-all-songs/${Uri.encodeComponent(title)}",
                extra: id,
              );
            },
            icon: Icon(
              Icons.library_music_rounded,
              color: colorScheme.onSurface,
              size: 24 * multiplier,
            ),
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
        logger.i(
          'artistData.coverUrl(): ${artistData.coverUrl()}, artistDetail.artist.coverUrl(): ${artistDetail.artist.coverUrl()}',
        );
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
                    id: artistDetail.artist.id.toString(),
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
              child: CloudMusicAlbumItem(
                album: album,
                colorScheme: colorScheme,
                multiplier: multiplier,
                onTap: () {
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
          return CloudMusicAlbumItemShimmer(colorScheme: colorScheme);
        }, childCount: itemCount),
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
    return CloudMusicSongsHorizontalListView(
      songs: artistDetail.hotSongs,
      songsFlag: artistDetail.hotSongFlag ?? 0,
      colorScheme: colorScheme,
      size: size,
      l10n: l10n,
      artistId: artistDetail.artist.id,
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
    final config = ArtistLayoutConfig.defaultConfig
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
