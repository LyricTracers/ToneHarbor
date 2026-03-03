import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';

class SongCoverImage extends ConsumerWidget {
  const SongCoverImage({
    super.key,
    required this.songId,
    required this.albumName,
    required this.artistName,
    required this.authHeaders,
    required this.colorScheme,
    required this.config,
  });

  final String songId;
  final String albumName;
  final String artistName;
  final Map<String, String> authHeaders;
  final ColorScheme colorScheme;
  final SongCoverImageConfig config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverUrl = ref.watch(
      coverUrlProvider(albumName: albumName, albumArtistName: artistName),
    );

    return coverUrl.when(
      data: (url) {
        if (url.isEmpty) {
          return CoverPlaceholder(colorScheme: colorScheme, size: config.size);
        }
        return ExtendedImage.network(
          url,
          width: config.size,
          height: config.size,
          fit: BoxFit.cover,
          headers: authHeaders,
          cache: true,
          cacheKey: songId,
          clearMemoryCacheIfFailed: true,
          loadStateChanged: (state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                return CoverPlaceholder(
                  colorScheme: colorScheme,
                  size: config.size,
                  isLoading: true,
                );
              case LoadState.completed:
                return ExtendedRawImage(
                  image: state.extendedImageInfo?.image,
                  width: config.size,
                  height: config.size,
                  fit: BoxFit.cover,
                );
              case LoadState.failed:
                return CoverPlaceholder(
                  colorScheme: colorScheme,
                  size: config.size,
                );
            }
          },
        );
      },
      loading: () => CoverPlaceholder(
        colorScheme: colorScheme,
        size: config.size,
        isLoading: true,
      ),
      error: (_, __) =>
          CoverPlaceholder(colorScheme: colorScheme, size: config.size),
    );
  }
}

class SongCoverImageConfig {
  const SongCoverImageConfig({required this.size, this.borderRadius = 8});

  final double size;
  final double borderRadius;

  static const SongCoverImageConfig defaultConfig = SongCoverImageConfig(
    size: 48,
    borderRadius: 8,
  );
}

class CoverPlaceholder extends StatelessWidget {
  const CoverPlaceholder({
    super.key,
    required this.colorScheme,
    required this.size,
    this.isLoading = false,
  });

  final ColorScheme colorScheme;
  final double size;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.onSurface.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isLoading
          ? Center(
              child: SizedBox(
                width: size * 0.4,
                height: size * 0.4,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colorScheme.onSurface,
                ),
              ),
            )
          : Icon(
              Icons.music_note,
              size: size * 0.4,
              color: colorScheme.onSurface,
            ),
    );
  }
}
