import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';

class SongCoverImage extends ConsumerWidget {
  const SongCoverImage({
    super.key,
    required this.songId,
    required this.albumName,
    required this.artistName,
    required this.authHeaders,
    required this.colorScheme,
    required this.config,
    this.onLongPress,
  });

  final String songId;
  final String albumName;
  final String artistName;
  final Map<String, String> authHeaders;
  final ColorScheme colorScheme;
  final SongCoverImageConfig config;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverUrl = ToneHarborMedia.getCoverUrl(albumName, artistName);

    Widget child = ClipRRect(
      borderRadius: BorderRadius.circular(config.borderRadius),
      child: ExtendedImage.network(
        coverUrl,
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
                borderRadius: config.borderRadius,
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
                borderRadius: config.borderRadius,
              );
          }
        },
      ),
    );

    return Builder(
      builder: (context) {
        return GestureDetector(
          onLongPress: () async {
            if (onLongPress != null) {
              onLongPress?.call();
            } else {
              final syncSongIcon = ref.read(syncSongIconProvider);
              if (syncSongIcon == false && context.mounted) {
                _showSetBackgroundDialog(context, ref, albumName, artistName);
              }
            }
          },
          child: child,
        );
      },
    );
  }

  static void _showSetBackgroundDialog(
    BuildContext context,
    WidgetRef ref,
    String albumName,
    String artistName,
  ) async {
    final l10n = ref.read(l10nProvider);
    if (context.mounted == false) {
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          l10n.setThemeBackground,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(
          l10n.setThemeBackgroundConfirm,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                final bytes = await downloadCover(
                  ref: ref,
                  albumName: albumName,
                  albumArtistName: artistName,
                );
                if (bytes.isEmpty) {
                  return;
                }
                logger.i('Downloaded image: ${bytes.length} bytes');
                saveDefaultThemeIcon(ref, bytes.toList());
              } catch (e) {
                logger.e('Failed to save theme icon: $e');
              }
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
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
    this.borderRadius = 8,
    this.isLoading = false,
  });

  final ColorScheme colorScheme;
  final double size;
  final double borderRadius;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.onSurface.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: isLoading
          ? RepaintBoundary(
              child: Center(
                child: SizedBox(
                  width: size * 0.4,
                  height: size * 0.4,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          : RepaintBoundary(
              child: Icon(
                Icons.music_note,
                size: size * 0.4,
                color: colorScheme.onSurface,
              ),
            ),
    );
  }
}
