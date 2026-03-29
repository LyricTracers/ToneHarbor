import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';

typedef ImageWidgetBuilder =
    Widget Function(BuildContext context, ImageProvider imageProvider);

typedef PlaceholderWidgetBuilder =
    Widget Function(BuildContext context, String url);

typedef LoadingErrorWidgetBuilder =
    Widget Function(BuildContext context, String url, Object error);

class CachedNetworkImage extends ConsumerWidget {
  final String imageUrl;
  final String? cacheKey;
  final ImageWidgetBuilder? imageBuilder;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final Duration fadeInDuration;
  final Curve fadeInCurve;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment alignment;
  final ImageRepeat repeat;
  final bool matchTextDirection;
  final bool gaplessPlayback;
  final Color? color;
  final BlendMode? colorBlendMode;
  final FilterQuality filterQuality;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final ValueChanged<Object>? errorListener;
  final Duration? keepLiveDuration;
  final Widget Function(Widget child)? packageChild;

  const CachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.cacheKey,
    this.imageBuilder,
    this.placeholder,
    this.errorWidget,
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.fadeInCurve = Curves.easeIn,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.gaplessPlayback = true,
    this.color,
    this.filterQuality = FilterQuality.low,
    this.colorBlendMode,
    this.memCacheWidth,
    this.memCacheHeight,
    this.errorListener,
    this.keepLiveDuration,
    this.packageChild,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(
      fetchCoverBytesProvider(
        url: imageUrl,
        key: cacheKey ?? imageUrl,
        liveKeepDuration: keepLiveDuration,
      ),
    );

    return asyncValue.when(
      data: (bytes) {
        if (bytes == null) {
          return _buildError(context, Exception('No data'));
        }

        return packageChild?.call(_buildImage(context, bytes)) ??
            _buildImage(context, bytes);
      },
      loading: () => _buildPlaceholder(context),
      error: (error, stack) => _buildError(context, error),
    );
  }

  Widget _buildImage(BuildContext context, Uint8List bytes) {
    ImageProvider imageProvider = MemoryImage(bytes);

    final cacheWidth = memCacheWidth ?? (width != null ? (width! * 2).toInt() : null);
    final cacheHeight = memCacheHeight ?? (height != null ? (height! * 2).toInt() : null);

    if (cacheWidth != null || cacheHeight != null) {
      imageProvider = ResizeImage(
        imageProvider,
        width: cacheWidth,
        height: cacheHeight,
      );
    }

    if (imageBuilder != null) {
      return imageBuilder!(context, imageProvider);
    }

    return Image(
      image: imageProvider,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      color: color,
      colorBlendMode: colorBlendMode,
      filterQuality: filterQuality,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: fadeInDuration,
          curve: fadeInCurve,
          child: child,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        errorListener?.call(error);
        return _buildError(context, error);
      },
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    if (placeholder != null) {
      return placeholder!(context, imageUrl);
    }

    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildError(BuildContext context, Object error) {
    if (errorWidget != null) {
      return errorWidget!(context, imageUrl, error);
    }

    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: const Icon(Icons.error),
    );
  }
}
