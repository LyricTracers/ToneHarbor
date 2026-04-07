import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/components/cached_network_image.dart';

class CloudMusicCoverImage extends HookConsumerWidget {
  const CloudMusicCoverImage({
    super.key,
    required this.imageUrl,
    required this.colorScheme,
    required this.config,
    this.onLongPress,
  });

  final String imageUrl;
  final ColorScheme colorScheme;
  final CloudMusicCoverImageConfig config;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderRadius = config.isCircular
        ? config.size / 2
        : config.borderRadius;

    final rotationController = useAnimationController(
      duration: config.rotationDuration,
    );

    useEffect(() {
      if (config.rotating) {
        rotationController.repeat();
      } else {
        rotationController.stop();
      }
      return null;
    }, [config.rotating]);

    Widget imageChild;
    if (config.isCircular) {
      imageChild = ClipOval(
        child: CachedNetworkImage.fromUrl(
          keepLiveDuration: const Duration(minutes: 1),
          imageUrl: imageUrl,
          cacheKey: 'cloud_cover_${imageUrl.hashCode}',
          width: config.size,
          height: config.size,
          fit: BoxFit.cover,
          placeholder: (context) {
            return CloudCoverPlaceholder(
              colorScheme: colorScheme,
              size: config.size,
              borderRadius: config.size / 2,
              isLoading: true,
            );
          },
          errorWidget: (context, error) {
            return CloudCoverPlaceholder(
              colorScheme: colorScheme,
              size: config.size,
              borderRadius: config.size / 2,
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
                        fetchCloudMusicCoverBytesProvider(
                          imageUrl: imageUrl,
                          key: 'cloud_cover_${imageUrl.hashCode}',
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
        ),
      );
    } else {
      imageChild = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage.fromUrl(
          keepLiveDuration: const Duration(minutes: 1),
          imageUrl: imageUrl,
          cacheKey: 'cloud_cover_${imageUrl.hashCode}',
          width: config.size,
          height: config.size,
          fit: BoxFit.cover,
          placeholder: (context) {
            return CloudCoverPlaceholder(
              colorScheme: colorScheme,
              size: config.size,
              borderRadius: borderRadius,
              isLoading: true,
            );
          },
          errorWidget: (context, error) {
            return CloudCoverPlaceholder(
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
                        fetchCloudMusicCoverBytesProvider(
                          imageUrl: imageUrl,
                          key: 'cloud_cover_${imageUrl.hashCode}',
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

    return imageChild;
  }
}

class CloudMusicCoverImageConfig {
  const CloudMusicCoverImageConfig({
    required this.size,
    this.borderRadius = 12,
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

  static const CloudMusicCoverImageConfig defaultConfig =
      CloudMusicCoverImageConfig(size: 130, borderRadius: 12);
}

class CloudCoverPlaceholder extends StatelessWidget {
  const CloudCoverPlaceholder({
    super.key,
    required this.colorScheme,
    required this.size,
    this.borderRadius = 12,
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
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
    );
  }
}
