import 'package:flutter/material.dart';
import 'package:toneharbor/models/audio_station/artist.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_common_artists.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';

import 'package:toneharbor/widgets/widgets.dart';

class ArtistItem extends StatelessWidget {
  const ArtistItem({
    super.key,
    this.artist,
    this.cloudArtist,
    required this.colorScheme,
    required this.aritstLayoutConfig,
  });

  final Artist? artist;
  final CloudMusicArtistData? cloudArtist;
  final ColorScheme colorScheme;
  final ArtistLayoutConfig aritstLayoutConfig;

  @override
  Widget build(BuildContext context) {
    if (artist == null && cloudArtist == null) {
      return Container();
    }
    String artistName;
    if (artist != null) {
      artistName = artist!.name == null ? 'Unknown Artist' : artist!.name!;
      if (artistName.isEmpty) {
        artistName = "Unknown Artist";
      }
    } else {
      artistName = cloudArtist!.name;
    }

    return InkWell(
      onTap: () {
        if (artist != null) {
          context.pushWrapper(
            '/albums/${Uri.encodeComponent(artistName)}',
            extra: albumsProvider(
              artist: artistName == 'Unknown Artist' ? '' : artistName,
            ),
          );
        } else {
          context.pushWrapper("/cloud-artist-detail", extra: cloudArtist!);
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: aritstLayoutConfig.itemWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: artist != null
                  ? SongCoverImage(
                      songId: "",
                      albumName: "",
                      artistName: artistName,
                      colorScheme: colorScheme,
                      config: SongCoverImageConfig(
                        size: aritstLayoutConfig.itemWidth,
                        isCircular: true,
                      ),
                    )
                  : CloudMusicCoverImage(
                      imageUrl: cloudArtist!.coverUrl(),
                      colorScheme: colorScheme,
                      config: CloudMusicCoverImageConfig(
                        size: aritstLayoutConfig.itemWidth,
                        isCircular: true,
                      ),
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
                  fontSize: aritstLayoutConfig.fontSize,
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

class ArtistHorizontalList extends StatelessWidget {
  const ArtistHorizontalList({super.key, this.artists, this.cloudArtists});

  final List<Artist>? artists;
  final List<CloudMusicArtistData>? cloudArtists;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final config = ArtistLayoutConfig.defaultConfig.withMultiplier(
      size.multiplier2,
    );
    var artistLength = artists?.length ?? 0;
    var cloudLength = cloudArtists?.length ?? 0;

    return SizedBox(
      height: config.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: config.horizontalPadding),
        itemCount: artistLength + cloudLength,
        itemBuilder: (context, index) {
          Artist? artist;
          CloudMusicArtistData? cloudArtist;
          if (index < cloudLength) {
            cloudArtist = cloudArtists![index];
          } else {
            artist = artists![index - cloudLength];
          }
          return Padding(
            padding: EdgeInsets.only(right: config.itemSpacing),
            child: ArtistItem(
              artist: artist,
              cloudArtist: cloudArtist,
              colorScheme: colorScheme,
              aritstLayoutConfig: config,
            ),
          );
        },
      ),
    );
  }
}
