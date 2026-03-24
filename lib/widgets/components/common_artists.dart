import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toneharbor/models/audio_station/artist.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/widgets/widgets.dart';

class _LayoutConfig {
  const _LayoutConfig({
    required this.height,
    required this.itemWidth,
    required this.itemSpacing,
    required this.horizontalPadding,
  });

  final double height;
  final double itemWidth;
  final double itemSpacing;
  final double horizontalPadding;

  static const _LayoutConfig defaultConfig = _LayoutConfig(
    height: 160,
    itemWidth: 100,
    itemSpacing: 16,
    horizontalPadding: 16,
  );
}

class ArtistItem extends StatelessWidget {
  const ArtistItem({
    super.key,
    required this.artist,
    required this.colorScheme,
  });

  final Artist artist;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    var artistName = artist.name == null ? 'Unknown Artist' : artist.name!;
    if (artistName.isEmpty) {
      artistName = "Unknown Artist";
    }

    return InkWell(
      onTap: () {
        context.push(
          '/albums/${Uri.encodeComponent(artistName)}',
          extra: albumsProvider(
            artist: artistName == 'Unknown Artist' ? '' : artistName,
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: SongCoverImage(
                songId: "",
                albumName: "",
                artistName: artistName,
                colorScheme: colorScheme,
                config: SongCoverImageConfig(size: 100, isCircular: true),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                artistName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AritistHorizontalList extends StatelessWidget {
  const AritistHorizontalList({super.key, required this.artists});

  final List<Artist> artists;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final config = _LayoutConfig.defaultConfig;
    return SizedBox(
      height: config.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: config.horizontalPadding),
        itemCount: artists.length,
        itemBuilder: (context, index) {
          final artist = artists[index];
          return Padding(
            padding: EdgeInsets.only(right: config.itemSpacing),
            child: ArtistItem(artist: artist, colorScheme: colorScheme),
          );
        },
      ),
    );
  }
}
