import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/components/common_track_list_item.dart';
import 'package:toneharbor/widgets/layouts/playing_detail_layout.dart';

class CloudAlbumDetailHeaderDelegate extends SliverPersistentHeaderDelegate {
  final WidgetRef ref;
  final AppLocalizations l10n;
  final String title;
  final String? artistName;
  final String? description;
  final String? company;
  final String? type;
  final String publishYear;
  final int? trackCount;
  final Size size;
  final ColorScheme colorScheme;
  final BuildContext context;
  final Widget coverImage;
  final Color headerBackgroundColor;

  CloudAlbumDetailHeaderDelegate({
    required this.ref,
    required this.l10n,
    required this.title,
    required this.publishYear,
    this.artistName,
    this.description,
    this.company,
    this.type,
    this.trackCount,
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
  bool shouldRebuild(covariant CloudAlbumDetailHeaderDelegate oldDelegate) =>
      title != oldDelegate.title ||
      artistName != oldDelegate.artistName ||
      description != oldDelegate.description ||
      company != oldDelegate.company ||
      type != oldDelegate.type ||
      publishYear != oldDelegate.publishYear ||
      trackCount != oldDelegate.trackCount ||
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
    String publishInfo = '';
    if (publishYear.isNotEmpty) {
      publishInfo = '$publishYear.';
    }
    if (trackCount != null) {
      publishInfo += ' $trackCount${l10n.track_count}.';
    }
    if (type != null && type!.isNotEmpty) {
      publishInfo += ' $type.';
    }
    if (company != null && company!.isNotEmpty) {
      publishInfo += ' $company';
    }

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
                    if (artistName != null && artistName!.isNotEmpty) ...[
                      SizedBox(height: 8 * multiplier),
                      Text(
                        "Album by $artistName",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16 * multiplier,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                    if (publishInfo.isNotEmpty) ...[
                      SizedBox(height: 8 * multiplier),
                      Text(
                        publishInfo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14 * multiplier,
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

class CloudAlbumDetailPage extends HookConsumerWidget {
  final CloudMusicAlbumData albumData;

  const CloudAlbumDetailPage({super.key, required this.albumData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier;
    final l10n = ref.watch(l10nProvider);
    final albumDetail = ref.watch(
      getCloudAlbumDetailProvider(albumId: albumData.id),
    );

    final scrollPixels = useState(0.0);
    final scrollController = useScrollController();

    final headerMaxExtent = kToolbarHeight * 5 * size.multiplier3;
    final headerMinExtent = kToolbarHeight * size.multiplier3;
    final maxScroll = headerMaxExtent - headerMinExtent;
    final maxCoverSize = kToolbarHeight * 4 * multiplier * 0.65;

    final coverImage = useMemoized(
      () => CloudMusicCoverImage(
        imageUrl:
            albumDetail.value?.album.coverUrl(size: 300) ??
            albumData.coverUrl(size: 300),
        colorScheme: colorScheme,
        config: CloudMusicCoverImageConfig(
          size: maxCoverSize,
          borderRadius: 8 * multiplier,
        ),
      ),
      [
        albumData.coverUrl(size: 300),
        albumDetail.value?.album.coverUrl(size: 300),
        colorScheme,
        maxCoverSize,
        multiplier,
      ],
    );

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
                  delegate: CloudAlbumDetailHeaderDelegate(
                    ref: ref,
                    l10n: l10n,
                    title: albumDetail.value?.album.name ?? albumData.name,
                    artistName:
                        albumDetail.value?.album.artistName ??
                        albumData.artistName,
                    description:
                        albumDetail.value?.album.description ??
                        albumData.description,
                    type: albumDetail.value?.album.type ?? albumData.type,
                    publishYear: formatYear(
                      albumDetail.value?.album.publishTime ??
                          albumData.publishTime,
                    ),
                    trackCount: albumDetail.value?.album.size ?? albumData.size,
                    size: size,
                    colorScheme: colorScheme,
                    context: context,
                    coverImage: coverImage,
                    headerBackgroundColor: statusBarColor,
                  ),
                ),
                albumDetail.when(
                  data: (data) =>
                      _buildTrackList(ref, data, colorScheme, size, l10n),
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
    CloudMusicAlbumDetailData? data,
    ColorScheme colorScheme,
    Size size,
    AppLocalizations l10n,
  ) {
    final tracks = data?.songs ?? [];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == tracks.length) {
          return SizedBox(
            height: 60,
            child: Center(
              child: Text(
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
          child: _AlbumTrackListItem(
            track: track,
            album: data?.album,
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
                  currentTrack,
                  l10n,
                  isLoggedIn: isLoggedIn,
                  userVipType: userVipType,
                );
                if (isPlayable.playable) {
                  targetTracks.add(currentTrack.asTrack(album: data?.album));
                  if (currentTrack.id == track.id) {
                    initIndex = targetTracks.length - 1;
                  }
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

class _AlbumTrackListItem extends HookConsumerWidget {
  final CloudMusicSongData track;
  final int index;
  final ColorScheme colorScheme;
  final CloudMusicAlbumData? album;
  final Size size;
  final Function(int) onTap;

  const _AlbumTrackListItem({
    required this.track,
    this.album,
    required this.index,
    required this.colorScheme,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonTrackListItem(
      track: track,
      index: index,
      colorScheme: colorScheme,
      size: size,
      onTap: onTap,
      album: album,
      showAlbumName: false,
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
