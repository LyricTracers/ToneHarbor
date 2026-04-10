import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/components/cached_network_image.dart';

class SongCoverImage extends HookConsumerWidget {
  const SongCoverImage({
    super.key,
    required this.songId,
    required this.albumName,
    required this.artistName,
    required this.colorScheme,
    required this.config,
    this.onLongPress,
    this.pictureFuture,
  });

  final String songId;
  final String albumName;
  final String artistName;
  final ColorScheme colorScheme;
  final SongCoverImageConfig config;
  final VoidCallback? onLongPress;
  final Future<Picture?>? pictureFuture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String cacheKey = songId;
    if (cacheKey.isEmpty) {
      cacheKey = sanitizeCacheKey("$artistName-$albumName");
    }

    final borderRadius = config.isCircular
        ? config.size / 2
        : config.borderRadius;

    final rotationController = useAnimationController(
      duration: config.rotationDuration,
    );

    Picture? resolvedPicture;
    if (pictureFuture != null) {
      final cachedFuture = useMemoized(() => pictureFuture!);
      final snapshot = useFuture(cachedFuture);
      resolvedPicture = snapshot.data;
    }

    useEffect(() {
      if (config.rotating) {
        rotationController.repeat();
      } else {
        rotationController.stop();
      }
      return null;
    }, [config.rotating]);

    Widget imageChild;
    if (resolvedPicture != null) {
      final pic = resolvedPicture;
      imageChild = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: GestureDetector(
          onLongPress: () async {
            if (onLongPress != null) {
              onLongPress?.call();
            } else {
              final syncSongIcon = ref.read(syncSongIconProvider);
              if (syncSongIcon == false && context.mounted) {
                showSetBackgroundDialog(context, colorScheme, ref, () async {
                  logger.i(
                    'Setting theme icon from picture: ${pic.data.length} bytes',
                  );
                  saveDefaultThemeIcon(ref, pic.data);
                });
              }
            }
          },
          child: Image.memory(
            pic.data,
            width: config.size,
            height: config.size,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return CoverPlaceholder(
                colorScheme: colorScheme,
                size: config.size,
                borderRadius: borderRadius,
              );
            },
          ),
        ),
      );
    } else {
      imageChild = CachedNetworkImage(
        keepLiveDuration: const Duration(minutes: 1),
        songId: songId,
        albumName: albumName,
        artistName: artistName,
        cacheKey: cacheKey,
        width: config.size,
        height: config.size,
        fit: BoxFit.cover,
        placeholder: (context) {
          return CoverPlaceholder(
            colorScheme: colorScheme,
            size: config.size,
            borderRadius: borderRadius,
            isLoading: true,
          );
        },
        errorWidget: (context, error) {
          return CoverPlaceholder(
            colorScheme: colorScheme,
            size: config.size,
            borderRadius: borderRadius,
          );
        },
        packageChild: (child) => GestureDetector(
          onLongPress: () async {
            if (onLongPress != null) {
              onLongPress?.call();
            } else {
              final syncSongIcon = ref.read(syncSongIconProvider);
              if (syncSongIcon == false && context.mounted) {
                showSetBackgroundDialog(context, colorScheme, ref, () async {
                  try {
                    final bytes = await ref.watch(
                      fetchCoverBytesProvider(
                        songId: songId,
                        albumName: albumName,
                        artistName: artistName,
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
                });
              }
            }
          },
          child: child,
        ),
      );
    }

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

    if (config.rotating) {
      imageChild = RotationTransition(
        turns: rotationController,
        child: imageChild,
      );
    }

    return Builder(
      builder: (context) {
        return imageChild;
      },
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
    this.rotating = false,
    this.rotationDuration = const Duration(seconds: 20),
  });

  final double size;
  final double borderRadius;
  final bool isCircular;
  final double? borderWidth;
  final Color? borderColor;
  final bool rotating;
  final Duration rotationDuration;

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
              child: SvgPicture.string(
                placeholderErrorIconString,
                width: size * 0.4,
                height: size * 0.4,
                fit: BoxFit.fitWidth,
                colorFilter: const ColorFilter.mode(
                  Colors.white54,
                  BlendMode.srcIn,
                ),
              ),
            ),
    );
  }
}
