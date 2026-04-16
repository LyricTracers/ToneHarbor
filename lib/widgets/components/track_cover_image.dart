import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'cloud_music_cover_image.dart';
import 'song_cover_image.dart';
import '../../models/audio_player/tone_harbor_track.dart';

class TrackCoverImage extends HookConsumerWidget {
  final ToneHarborTrackObject track;
  final ColorScheme colorScheme;
  final TrackCoverImageConfig config;

  const TrackCoverImage({
    super.key,
    required this.track,
    required this.colorScheme,
    required this.config,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (track is ToneHarborTrackObjectCloudMusic) {
      final cloudTrack = track as ToneHarborTrackObjectCloudMusic;
      return CloudMusicCoverImage(
        imageUrl: cloudTrack.coverUrl ?? '',
        colorScheme: colorScheme,
        config: CloudMusicCoverImageConfig(
          size: config.size,
          borderRadius: config.borderRadius,
          isCircular: config.isCircular,
          borderWidth: config.borderWidth,
          borderColor: config.borderColor,
          rotating: config.rotating,
          rotationDuration: config.rotationDuration,
        ),
      );
    }
    if (track is ToneHarborTrackObjectMultLocal) {
      final localTrack = track as ToneHarborTrackObjectMultLocal;
      if (localTrack.externalUri.isNotEmpty) {
        return CloudMusicCoverImage(
          imageUrl: localTrack.externalUri,
          colorScheme: colorScheme,
          config: CloudMusicCoverImageConfig(
            size: config.size,
            borderRadius: config.borderRadius,
            isCircular: config.isCircular,
            borderWidth: config.borderWidth,
            borderColor: config.borderColor,
            rotating: config.rotating,
            rotationDuration: config.rotationDuration,
          ),
        );
      }
      final pictureFuture = useMemoized(() => localTrack.getPicture(), [
        localTrack.id,
      ]);
      return SongCoverImage(
        pictureFuture: pictureFuture,
        songId: localTrack.id,
        albumName: localTrack.album,
        artistName: localTrack.artist,
        colorScheme: colorScheme,
        config: SongCoverImageConfig(
          size: config.size,
          borderRadius: config.borderRadius,
          isCircular: config.isCircular,
          borderWidth: config.borderWidth,
          borderColor: config.borderColor,
          rotating: config.rotating,
          rotationDuration: config.rotationDuration,
        ),
      );
    }
    return SongCoverImage(
      songId: track.id,
      albumName: track.album,
      artistName: track.artist,
      colorScheme: colorScheme,
      config: SongCoverImageConfig(
        size: config.size,
        borderRadius: config.borderRadius,
        isCircular: config.isCircular,
        borderWidth: config.borderWidth,
        borderColor: config.borderColor,
        rotating: config.rotating,
        rotationDuration: config.rotationDuration,
      ),
    );
  }
}

class TrackCoverImageConfig {
  final double size;
  final double borderRadius;
  final bool isCircular;
  final double? borderWidth;
  final Color? borderColor;
  final bool rotating;
  final Duration rotationDuration;

  const TrackCoverImageConfig({
    required this.size,
    this.borderRadius = 8,
    this.isCircular = false,
    this.borderWidth,
    this.borderColor,
    this.rotating = false,
    this.rotationDuration = const Duration(seconds: 20),
  });
}
