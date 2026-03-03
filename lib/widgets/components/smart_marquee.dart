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

/// SmartMarquee 控制器
class SmartMarqueeController {
  _SmartMarqueeState? _state;

  void _attachState(_SmartMarqueeState state) {
    _state = state;
  }

  void _detachState() {
    _state = null;
  }

  /// 暂停滚动
  void pause() => _state?._pause();

  /// 恢复滚动
  void resume() => _state?._resume();

  /// 重置滚动
  void reset() => _state?._reset();

  /// 是否已手动暂停
  bool get isPaused => _state?.isManuallyPaused ?? false;

  /// 是否正在悬停
  bool get isHovering => _state?.isHovering ?? false;

  /// 是否完全暂停（手动暂停或悬停暂停）
  bool get isFullyPaused => _state?.isPaused ?? false;
}

class SmartMarquee extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration pauseAfterRound;
  final double velocity;
  final double blankSpace;
  final Duration startAfter;
  final bool pauseOnHover;
  final SmartMarqueeController? controller;
  final AlignmentGeometry alignment;

  const SmartMarquee({
    super.key,
    required this.text,
    required this.style,
    this.pauseAfterRound = const Duration(seconds: 1),
    this.velocity = 50.0,
    this.blankSpace = 20.0,
    this.startAfter = const Duration(seconds: 1),
    this.pauseOnHover = false,
    this.controller,
    this.alignment = Alignment.center,
  });

  @override
  State<SmartMarquee> createState() => _SmartMarqueeState();
}

class _SmartMarqueeState extends State<SmartMarquee>
    with SingleTickerProviderStateMixin {
  bool _isManuallyPaused = false;
  bool _isHovering = false;
  bool _isDragging = false;
  bool _isInertiaRunning = false;
  bool _mouseExitedWhileDragging = false;
  double _manualScrollOffset = 0.0;
  double _lastDragX = 0.0;
  double _lastDragTime = 0.0;
  double _dragVelocity = 0.0;

  late final AnimationController _inertiaController;
  Animation<double>? _inertiaAnimation;

  bool get isManuallyPaused => _isManuallyPaused;
  bool get isHovering => _isHovering;
  bool get isPaused =>
      _isManuallyPaused || _isHovering || _isDragging || _isInertiaRunning;

  @override
  void initState() {
    super.initState();
    widget.controller?._attachState(this);
    _inertiaController = AnimationController(vsync: this);
    _inertiaController.addListener(_onInertiaUpdate);
  }

  @override
  void didUpdateWidget(SmartMarquee oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?._detachState();
      widget.controller?._attachState(this);
    }

    if (oldWidget.text != widget.text) {
      _manualScrollOffset = 0.0;
      _stopInertia();
    }
  }

  @override
  void dispose() {
    _inertiaController.removeListener(_onInertiaUpdate);
    _inertiaController.dispose();
    widget.controller?._detachState();
    super.dispose();
  }

  void _pause() {
    setState(() {
      _isManuallyPaused = true;
    });
  }

  void _resume() {
    setState(() {
      _isManuallyPaused = false;
      _manualScrollOffset = 0.0;
    });
  }

  void _reset() {
    setState(() {
      _isManuallyPaused = false;
      _isHovering = false;
      _isDragging = false;
      _isInertiaRunning = false;
      _mouseExitedWhileDragging = false;
      _manualScrollOffset = 0.0;
    });
    _stopInertia();
  }

  void _stopInertia() {
    _inertiaController.stop();
    _inertiaAnimation = null;
    if (_isInertiaRunning) {
      setState(() {
        _isInertiaRunning = false;
      });
    }
  }

  void _onInertiaUpdate() {
    if (_inertiaAnimation != null) {
      setState(() {
        _manualScrollOffset = _inertiaAnimation!.value;
      });
    }
  }

  void _startInertia(double velocity, double maxScrollDistance) {
    if (velocity.abs() < 100) return;

    _stopInertia();

    final startOffset = _manualScrollOffset;
    final deceleration = velocity > 0 ? -2000.0 : 2000.0;
    final duration = (velocity.abs() / deceleration.abs() * 1000).round();
    final distance = velocity * duration / 1000.0;
    final endOffset = (startOffset + distance).clamp(-maxScrollDistance, 0.0);

    if ((endOffset - startOffset).abs() < 1) return;

    setState(() {
      _isInertiaRunning = true;
    });

    _inertiaAnimation = Tween<double>(begin: startOffset, end: endOffset)
        .animate(
          CurvedAnimation(parent: _inertiaController, curve: Curves.decelerate),
        );

    _inertiaController.duration = Duration(
      milliseconds: duration.clamp(100, 1000),
    );
    _inertiaController.forward(from: 0.0).then((_) {
      if (mounted && !_isDragging) {
        setState(() {
          _isInertiaRunning = false;
          _manualScrollOffset = 0.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final metrics = _TextMetricsCache.get(widget.text, widget.style);

    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth;
          const padding = 8.0;

          final shouldScroll = metrics.width > availableWidth - padding;

          final horizontalAlignment = widget.alignment == Alignment.center
              ? 0.0
              : -1.0;

          if (!shouldScroll) {
            return SizedBox(
              height: metrics.height + 4,
              child: Align(
                alignment: Alignment(horizontalAlignment, 0.0),
                child: Text(
                  widget.text,
                  style: widget.style,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: widget.alignment == Alignment.center
                      ? TextAlign.center
                      : TextAlign.left,
                ),
              ),
            );
          }

          Widget child = ClipRect(
            child: SizedBox(
              height: metrics.height + 4,
              child: Align(
                alignment: Alignment(horizontalAlignment, 0.0),
                child: isPaused
                    ? Listener(
                        onPointerDown: (event) {
                          _stopInertia();
                          setState(() {
                            _isDragging = true;
                            _lastDragX = event.position.dx;
                            _lastDragTime = DateTime.now()
                                .millisecondsSinceEpoch
                                .toDouble();
                            _dragVelocity = 0.0;
                          });
                        },
                        onPointerMove: (event) {
                          if (!_isDragging) return;

                          final currentTime = DateTime.now()
                              .millisecondsSinceEpoch
                              .toDouble();
                          final deltaTime = currentTime - _lastDragTime;
                          final deltaX = event.position.dx - _lastDragX;
                          final maxScrollDistance =
                              metrics.width - availableWidth + padding;
                          setState(() {
                            _manualScrollOffset -= deltaX;
                            if (maxScrollDistance > 0) {
                              _manualScrollOffset = _manualScrollOffset.clamp(
                                -maxScrollDistance,
                                0.0,
                              );
                            } else {
                              _manualScrollOffset = 0.0;
                            }
                            if (deltaTime > 0) {
                              _dragVelocity = -deltaX / deltaTime * 1000.0;
                            }
                            _lastDragX = event.position.dx;
                            _lastDragTime = currentTime;
                          });
                        },
                        onPointerUp: (event) {
                          if (!_isDragging) return;

                          final maxScrollDistance =
                              metrics.width - availableWidth + padding;
                          setState(() {
                            _isDragging = false;
                            if (_mouseExitedWhileDragging) {
                              _isHovering = false;
                              _mouseExitedWhileDragging = false;
                            }
                          });
                          if (maxScrollDistance > 0 &&
                              _dragVelocity.abs() >= 100) {
                            _startInertia(_dragVelocity, maxScrollDistance);
                          } else {
                            setState(() {
                              _manualScrollOffset = 0.0;
                            });
                          }
                        },
                        child: Transform.translate(
                          offset: Offset(_manualScrollOffset, 0),
                          child: Text(
                            widget.text,
                            style: widget.style,
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                            softWrap: false,
                            textAlign: widget.alignment == Alignment.center
                                ? TextAlign.center
                                : TextAlign.left,
                          ),
                        ),
                      )
                    : Marquee(
                        text: widget.text,
                        style: widget.style,
                        scrollAxis: Axis.horizontal,
                        pauseAfterRound: widget.pauseAfterRound,
                        velocity: widget.velocity,
                        blankSpace: widget.blankSpace,
                        startAfter: widget.startAfter,
                        startPadding: 0.0,
                        accelerationDuration: Duration.zero,
                        decelerationDuration: Duration.zero,
                      ),
              ),
            ),
          );

          if (widget.pauseOnHover) {
            child = MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isHovering = true;
                });
              },
              onExit: (_) {
                if (!_isDragging) {
                  setState(() {
                    _isHovering = false;
                  });
                } else {
                  _mouseExitedWhileDragging = true;
                }
              },
              child: child,
            );
          }

          return child;
        },
      ),
    );
  }
}
