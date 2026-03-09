import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/components/cached_network_image.dart';

class SongCoverImage extends ConsumerWidget {
  const SongCoverImage({
    super.key,
    required this.songId,
    required this.albumName,
    required this.artistName,
    required this.colorScheme,
    required this.config,
    this.onLongPress,
  });

  final String songId;
  final String albumName;
  final String artistName;
  final ColorScheme colorScheme;
  final SongCoverImageConfig config;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverUrl = ToneHarborMedia.getCoverUrl(songId, albumName, artistName);
    String cacheKey = songId;
    if (cacheKey.isEmpty) {
      cacheKey = sanitizeCacheKey("$artistName-$albumName");
    }

    final borderRadius = config.isCircular
        ? config.size / 2
        : config.borderRadius;

    Widget imageChild = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        keepLiveDuration: const Duration(minutes: 10),
        imageUrl: coverUrl,
        cacheKey: cacheKey,
        width: config.size,
        height: config.size,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return CoverPlaceholder(
            colorScheme: colorScheme,
            size: config.size,
            borderRadius: borderRadius,
            isLoading: true,
          );
        },
        errorWidget: (context, url, error) {
          return CoverPlaceholder(
            colorScheme: colorScheme,
            size: config.size,
            borderRadius: borderRadius,
          );
        },
      ),
    );

    if (config.borderWidth != null && config.borderWidth! > 0) {
      imageChild = Container(
        decoration: BoxDecoration(
          shape: config.isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: config.isCircular
              ? null
              : BorderRadius.circular(borderRadius),
          border: Border.all(
            color: config.borderColor ?? colorScheme.primary,
            width: config.borderWidth!,
          ),
        ),
        child: imageChild,
      );
    }

    return Builder(
      builder: (context) {
        return GestureDetector(
          onLongPress: () async {
            if (onLongPress != null) {
              onLongPress?.call();
            } else {
              final syncSongIcon = ref.read(syncSongIconProvider);
              if (syncSongIcon == false && context.mounted) {
                _showSetBackgroundDialog(context, ref, coverUrl, cacheKey);
              }
            }
          },
          child: imageChild,
        );
      },
    );
  }

  static void _showSetBackgroundDialog(
    BuildContext context,
    WidgetRef ref,
    String coverUrl,
    String cacheKey,
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
                final bytes = await ref.watch(
                  fetchCoverBytesProvider(
                    url: coverUrl,
                    key: cacheKey,
                    liveKeepDuration: const Duration(minutes: 10),
                  ).future,
                );
                if (bytes == null) {
                  return;
                }
                logger.i(
                  'Setting theme icon from image: ${bytes.length} bytes',
                );
                saveDefaultThemeIcon(ref, bytes);
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
  const SongCoverImageConfig({
    required this.size,
    this.borderRadius = 8,
    this.isCircular = false,
    this.borderWidth,
    this.borderColor,
  });

  final double size;
  final double borderRadius;
  final bool isCircular;
  final double? borderWidth;
  final Color? borderColor;

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
