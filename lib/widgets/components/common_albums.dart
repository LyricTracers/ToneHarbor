import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/album.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/base_utils.dart';
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
    required this.albumNameFontSize,
    required this.albumNameFontWeight,
    required this.artistNameFontSize,
  });

  final double height;
  final double itemWidth;
  final double itemSpacing;
  final double horizontalPadding;
  final double coverSize;
  final double coverBorderRadius;
  final double textSpacing;
  final double albumNameFontSize;
  final FontWeight albumNameFontWeight;
  final double artistNameFontSize;

  static const _LayoutConfig defaultConfig = _LayoutConfig(
    height: 160,
    itemWidth: 100,
    itemSpacing: 16,
    horizontalPadding: 16,
    coverSize: 100,
    coverBorderRadius: 12,
    textSpacing: 4,
    albumNameFontSize: 13,
    albumNameFontWeight: FontWeight.w500,
    artistNameFontSize: 11,
  );
}

class CommonAlbums extends ConsumerWidget {
  const CommonAlbums({
    super.key,
    required this.albums,
    required this.onErrorTap,
  });

  final AsyncValue<AlbumResponse> albums;
  final Function() onErrorTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final authHeaders = getValueWhenReadyWithWidgetRef(
      ref,
      authHeadersProvider,
      null,
    );
    return albums.when(
      data: (data) => _buildHorizontalList(
        context,
        data.data?.albums ?? [],
        authHeaders ?? {},
        colorScheme,
      ),
      loading: () => _buildShimmerLoading(context, colorScheme),
      error: (error, stackTrace) {
        final config = _LayoutConfig.defaultConfig;
        return buildErrorView(
          context,
          ref,
          colorScheme,
          config.height,
          onErrorTap,
        );
      },
    );
  }

  Widget _buildHorizontalList(
    BuildContext context,
    List<AlbumItem> albums,
    Map<String, String> authHeaders,
    ColorScheme colorScheme,
  ) {
    final config = _LayoutConfig.defaultConfig;
    return SizedBox(
      height: config.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: config.horizontalPadding),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return Padding(
            padding: EdgeInsets.only(right: config.itemSpacing),
            child: _AlbumItem(
              album: album,
              authHeaders: authHeaders,
              colorScheme: colorScheme,
              config: config,
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
              child: _AlbumItemShimmer(
                colorScheme: colorScheme,
                config: config,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AlbumItem extends StatelessWidget {
  const _AlbumItem({
    required this.album,
    required this.authHeaders,
    required this.colorScheme,
    required this.config,
  });

  final AlbumItem album;
  final Map<String, String> authHeaders;
  final ColorScheme colorScheme;
  final _LayoutConfig config;

  @override
  Widget build(BuildContext context) {
    final albumName = (album.name?.isNotEmpty == true)
        ? album.name!
        : 'Unknown Album';
    final artistName = (album.displayArtist?.isNotEmpty == true)
        ? album.displayArtist!
        : (album.artist?.isNotEmpty == true)
        ? album.artist!
        : 'Unknown Artist';

    return InkWell(
      onTap: () {
        logger.d('点击专辑: $albumName, 艺术家: $artistName');
      },
      borderRadius: BorderRadius.circular(config.coverBorderRadius),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SongCoverImage(
            songId: albumName,
            albumName: albumName,
            artistName: artistName,
            authHeaders: authHeaders,
            colorScheme: colorScheme,
            config: SongCoverImageConfig(
              size: config.coverSize,
              borderRadius: config.coverBorderRadius,
            ),
          ),
          SizedBox(height: config.textSpacing),
          _AlbumText(
            text: albumName,
            width: config.itemWidth,
            style: TextStyle(
              fontSize: config.albumNameFontSize,
              fontWeight: config.albumNameFontWeight,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: config.textSpacing),
          _AlbumText(
            text: artistName,
            width: config.itemWidth,
            style: TextStyle(
              fontSize: config.artistNameFontSize,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _AlbumText extends StatelessWidget {
  const _AlbumText({
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

class _AlbumItemShimmer extends StatelessWidget {
  const _AlbumItemShimmer({required this.colorScheme, required this.config});

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
        SizedBox(
          width: config.itemWidth,
          height: config.albumNameFontSize + 4,
          child: Container(
            height: config.albumNameFontSize,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        SizedBox(height: config.textSpacing),
        SizedBox(
          width: config.itemWidth,
          height: config.artistNameFontSize + 4,
          child: Container(
            height: config.artistNameFontSize,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}
