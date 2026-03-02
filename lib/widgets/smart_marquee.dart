import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class _TextMetricsCache {
  static final Map<String, _TextMetrics> _cache = {};
  static const int _maxCacheSize = 20;
  static final List<String> _cacheKeys = [];

  static _TextMetrics get(String text, TextStyle style) {
    final key = _generateKey(text, style);

    if (_cache.containsKey(key)) {
      return _cache[key]!;
    }

    final metrics = _TextMetrics.compute(text, style);
    _cache[key] = metrics;
    _cacheKeys.add(key);

    if (_cacheKeys.length > _maxCacheSize) {
      final oldestKey = _cacheKeys.removeAt(0);
      _cache.remove(oldestKey);
    }

    return metrics;
  }

  static String _generateKey(String text, TextStyle style) {
    return '$text|${style.hashCode}';
  }
}

class _TextMetrics {
  final double width;
  final double height;

  _TextMetrics._internal(this.width, this.height);

  factory _TextMetrics.compute(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    final metrics = _TextMetrics._internal(
      textPainter.width,
      textPainter.height,
    );
    textPainter.dispose();
    return metrics;
  }
}

class SmartMarquee extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Duration pauseAfterRound;
  final double velocity;
  final double blankSpace;
  final Duration startAfter;

  const SmartMarquee({
    super.key,
    required this.text,
    required this.style,
    this.pauseAfterRound = const Duration(seconds: 1),
    this.velocity = 50.0,
    this.blankSpace = 20.0,
    this.startAfter = const Duration(seconds: 1),
  });

  @override
  Widget build(BuildContext context) {
    final metrics = _TextMetricsCache.get(text, style);

    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth;
          final padding = 8.0;

          if (metrics.width <= availableWidth - padding) {
            return Text(
              text,
              style: style,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            );
          }

          return SizedBox(
            height: metrics.height + 4,
            child: Marquee(
              text: text,
              style: style,
              scrollAxis: Axis.horizontal,
              pauseAfterRound: pauseAfterRound,
              velocity: velocity,
              blankSpace: blankSpace,
              startAfter: startAfter,
              startPadding: 0.0,
              accelerationDuration: Duration.zero,
              decelerationDuration: Duration.zero,
            ),
          );
        },
      ),
    );
  }
}
