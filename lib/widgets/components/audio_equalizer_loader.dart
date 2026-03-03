import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/utils/base_funs.dart';

class AudioEqualizerLoader extends HookConsumerWidget {
  const AudioEqualizerLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = AppLocalizations.of(context)!;
    final color = colorScheme.primary.withValues(alpha: .7);

    final controller1 = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    final controller2 = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    final controller3 = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    final controller4 = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    final controller5 = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );

    final animation1 = useMemoized(
      () => Tween<double>(
        begin: 0.2,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller1, curve: Curves.easeInOut)),
      [controller1],
    );
    final animation2 = useMemoized(
      () => Tween<double>(
        begin: 0.2,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller2, curve: Curves.easeInOut)),
      [controller2],
    );
    final animation3 = useMemoized(
      () => Tween<double>(
        begin: 0.2,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller3, curve: Curves.easeInOut)),
      [controller3],
    );
    final animation4 = useMemoized(
      () => Tween<double>(
        begin: 0.2,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller4, curve: Curves.easeInOut)),
      [controller4],
    );
    final animation5 = useMemoized(
      () => Tween<double>(
        begin: 0.2,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller5, curve: Curves.easeInOut)),
      [controller5],
    );

    useEffect(() {
      final timers = <Timer>[];

      timers.add(
        Timer(const Duration(milliseconds: 0), () {
          if (controller1.isAnimating) return;
          controller1.repeat(reverse: true);
        }),
      );
      timers.add(
        Timer(const Duration(milliseconds: 80), () {
          if (controller2.isAnimating) return;
          controller2.repeat(reverse: true);
        }),
      );
      timers.add(
        Timer(const Duration(milliseconds: 160), () {
          if (controller3.isAnimating) return;
          controller3.repeat(reverse: true);
        }),
      );
      timers.add(
        Timer(const Duration(milliseconds: 240), () {
          if (controller4.isAnimating) return;
          controller4.repeat(reverse: true);
        }),
      );
      timers.add(
        Timer(const Duration(milliseconds: 320), () {
          if (controller5.isAnimating) return;
          controller5.repeat(reverse: true);
        }),
      );

      return () {
        for (final timer in timers) {
          timer.cancel();
        }
        if (controller1.isAnimating) controller1.stop();
        if (controller2.isAnimating) controller2.stop();
        if (controller3.isAnimating) controller3.stop();
        if (controller4.isAnimating) controller4.stop();
        if (controller5.isAnimating) controller5.stop();
      };
    }, []);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 88.0,
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RepaintBoundary(
                child: _Bar(animation: animation1, color: color),
              ),
              RepaintBoundary(
                child: _Bar(animation: animation2, color: color),
              ),
              RepaintBoundary(
                child: _Bar(animation: animation3, color: color),
              ),
              RepaintBoundary(
                child: _Bar(animation: animation4, color: color),
              ),
              RepaintBoundary(
                child: _Bar(animation: animation5, color: color),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.0),
        Text(l10n.loading, style: TextStyle(fontSize: 14.0, color: color)),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.animation, required this.color});

  final Animation<double> animation;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()
            ..scaleByDouble(1.0, animation.value, 1.0, 1.0),
          child: child,
        );
      },
      child: Container(
        width: 8.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
