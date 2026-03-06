import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:toneharbor/utils/base_funs.dart';

class FrostedColorSchemeGenerator {
  static Future<ColorScheme> generate({
    required ImageProvider imageProvider,
    DynamicSchemeVariant? schemeVariant,
    double? contrastLevel,
  }) async {
    final (sourceColorArgb, luminance) = await _processImage(imageProvider);
    final blackOpacity = _calculateBlackOverlayOpacity(luminance);
    final blendedLuminance = luminance * (1 - blackOpacity);
    final isDarkBackground = blendedLuminance < 0.5;
    final brightness = isDarkBackground ? Brightness.dark : Brightness.light;
    final finalContrastLevel =
        contrastLevel ?? SharedPreferencesUtils.getContrastLevel();
    final finalSchemeVariant =
        schemeVariant ?? SharedPreferencesUtils.getDynamicSchemeVariant();
    return _createColorScheme(
      sourceColorArgb: sourceColorArgb,
      brightness: brightness,
      blackOpacity: blackOpacity,
      schemeVariant: finalSchemeVariant,
      contrastLevel: finalContrastLevel,
    );
  }

  static ColorScheme _createColorScheme({
    required int sourceColorArgb,
    required Brightness brightness,
    required double blackOpacity,
    DynamicSchemeVariant schemeVariant = DynamicSchemeVariant.tonalSpot,
    double contrastLevel = 0.0,
  }) {
    final sourceColor = Hct.fromInt(sourceColorArgb);
    final isDark = brightness == Brightness.dark;
    final scheme = switch (schemeVariant) {
      DynamicSchemeVariant.tonalSpot => SchemeTonalSpot(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.fidelity => SchemeFidelity(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.content => SchemeContent(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.monochrome => SchemeMonochrome(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.neutral => SchemeNeutral(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.vibrant => SchemeVibrant(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.expressive => SchemeExpressive(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.rainbow => SchemeRainbow(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.fruitSalad => SchemeFruitSalad(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
    };

    final adjustedBlackOpacity = blackOpacity.clamp(0.0, 1.0);
    final surfaceContainerHighestOpacity = (blackOpacity - 0.15).clamp(
      0.0,
      1.0,
    );

    return ColorScheme(
      brightness: brightness,

      primary: Color(scheme.primary),
      onPrimary: Color(scheme.onPrimary),
      primaryContainer: Color(scheme.primaryContainer),
      onPrimaryContainer: Color(scheme.onPrimaryContainer),

      secondary: Color(scheme.secondary),
      onSecondary: Color(scheme.onSecondary),
      secondaryContainer: Color(scheme.secondaryContainer),
      onSecondaryContainer: Color(scheme.onSecondaryContainer),

      tertiary: Color(scheme.tertiary),
      onTertiary: Color(scheme.onTertiary),
      tertiaryContainer: Color(scheme.tertiaryContainer),
      onTertiaryContainer: Color(scheme.onTertiaryContainer),
      error: Color(scheme.error),
      onError: Color(scheme.onError),
      errorContainer: Color(scheme.errorContainer),
      onErrorContainer: Color(scheme.onErrorContainer),
      surface:
          Color.lerp(
            Color(scheme.surface),
            Colors.black.withValues(alpha: adjustedBlackOpacity),
            0.3,
          ) ??
          Color(scheme.surface),
      surfaceDim:
          Color.lerp(
            Color(scheme.surfaceDim),
            Colors.black.withValues(alpha: adjustedBlackOpacity),
            0.3,
          ) ??
          Color(scheme.surfaceDim),
      surfaceBright:
          Color.lerp(
            Color(scheme.surfaceBright),
            Colors.black.withValues(alpha: adjustedBlackOpacity),
            0.3,
          ) ??
          Color(scheme.surfaceBright),
      surfaceContainerLowest:
          Color.lerp(
            Color(scheme.surfaceContainerLowest),
            Colors.black.withValues(alpha: adjustedBlackOpacity),
            0.3,
          ) ??
          Color(scheme.surfaceContainerLowest),
      surfaceContainerLow:
          Color.lerp(
            Color(scheme.surfaceContainerLow),
            Colors.black.withValues(alpha: adjustedBlackOpacity),
            0.3,
          ) ??
          Color(scheme.surfaceContainerLow),
      surfaceContainer:
          Color.lerp(
            Color(scheme.surfaceContainer),
            Colors.black.withValues(alpha: adjustedBlackOpacity),
            0.3,
          ) ??
          Color(scheme.surfaceContainer),
      surfaceContainerHigh:
          Color.lerp(
            Color(scheme.surfaceContainerHigh),
            Colors.black.withValues(alpha: adjustedBlackOpacity),
            0.3,
          ) ??
          Color(scheme.surfaceContainerHigh),
      surfaceContainerHighest:
          Color.lerp(
            Color(scheme.surfaceContainerHighest),
            Colors.black.withValues(alpha: surfaceContainerHighestOpacity),
            0.3,
          ) ??
          Color(scheme.surfaceContainerHighest),
      onSurface: Color(scheme.onSurface),
      onSurfaceVariant: Color(scheme.onSurfaceVariant),

      outline: Color(scheme.outline),
      outlineVariant: Color(scheme.outlineVariant),

      shadow: Color(scheme.shadow),
      scrim: Color(scheme.scrim),

      inverseSurface: Color(scheme.inverseSurface),
      onInverseSurface: Color(scheme.inverseOnSurface),

      inversePrimary: Color(scheme.inversePrimary),
      surfaceTint: Color(scheme.primary),
    );
  }

  static double _calculateBlackOverlayOpacity(double imageLuminance) {
    final tone = imageLuminance * 100.0;
    final targetTone = Contrast.darkerUnsafe(tone: tone, ratio: 4.5);
    final toneDelta = tone - targetTone;
    return toneDelta / 100.0;
  }

  static Future<(int, double)> _processImage(
    ImageProvider imageProvider,
  ) async {
    final ui.Image scaledImage = await _imageProviderToScaled(imageProvider);
    final ByteData? imageBytes = await scaledImage.toByteData();

    if (imageBytes == null) {
      return (0xFF6366F1, 0.5);
    }

    final quantizerResult = await QuantizerCelebi().quantize(
      imageBytes.buffer.asUint32List(),
      128,
      returnInputPixelToClusterPixel: true,
    );

    final scoredColors = Score.score(quantizerResult.colorToCount, desired: 1);
    final sourceColorArgb = scoredColors.first;

    var totalWeightedLuminance = 0.0;
    var totalPixels = 0;

    quantizerResult.colorToCount.forEach((colorArgb, count) {
      final luminance = ColorUtils.lstarFromArgb(colorArgb) / 100.0;
      totalWeightedLuminance += luminance * count;
      totalPixels += count;
    });

    final luminance = totalPixels > 0
        ? totalWeightedLuminance / totalPixels
        : 0.5;

    return (sourceColorArgb, luminance);
  }

  static Future<ui.Image> _imageProviderToScaled(
    ImageProvider imageProvider,
  ) async {
    const double maxDimension = 112.0;
    final ImageStream stream = imageProvider.resolve(
      const ImageConfiguration(size: Size(maxDimension, maxDimension)),
    );
    final Completer<ui.Image> imageCompleter = Completer<ui.Image>();
    late ImageStreamListener listener;

    listener = ImageStreamListener(
      (ImageInfo info, bool sync) async {
        stream.removeListener(listener);
        final ui.Image image = info.image;
        final int width = image.width;
        final int height = image.height;
        double paintWidth = width.toDouble();
        double paintHeight = height.toDouble();

        final bool rescale = width > maxDimension || height > maxDimension;
        if (rescale) {
          paintWidth = (width > height)
              ? maxDimension
              : (maxDimension / height) * width;
          paintHeight = (height > width)
              ? maxDimension
              : (maxDimension / width) * height;
        }

        final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
        final Canvas canvas = Canvas(pictureRecorder);
        paintImage(
          canvas: canvas,
          rect: Rect.fromLTRB(0, 0, paintWidth, paintHeight),
          image: image,
          filterQuality: FilterQuality.none,
        );

        final ui.Picture picture = pictureRecorder.endRecording();
        final ui.Image scaledImage = await picture.toImage(
          paintWidth.toInt(),
          paintHeight.toInt(),
        );
        imageCompleter.complete(scaledImage);
      },
      onError: (Object exception, StackTrace? stackTrace) {
        stream.removeListener(listener);
        imageCompleter.completeError(
          Exception('Failed to render image: $exception'),
          stackTrace,
        );
      },
    );

    stream.addListener(listener);
    await imageCompleter.future;
    return imageCompleter.future;
  }
}
