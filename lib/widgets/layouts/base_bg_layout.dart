import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'dart:ui' as ui;

import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';

abstract class BaseBgLayout extends HookConsumerWidget {
  const BaseBgLayout({super.key, this.showLoading = true});
  final bool showLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    var requestFlag = ref.watch(requestFlagProvider);
    var targetIcon = ref.watch(getImageProviderProvider);
    final useBlur = useState<double>(50);
    final route = ModalRoute.of(context);
    useEffect(() {
      if (route == null) return null;

      void listener() {
        final value = route.animation?.value ?? 1.0;
        useBlur.value = 50 * Curves.easeInOutQuad.transform(value);
      }

      route.animation?.addListener(listener);
      return () {
        route.animation?.removeListener(listener);
      };
    }, [route]);
    final gradientDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(-0.8, -0.8),
        end: Alignment(0.8, 0.8),
        stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
        colors: [
          colorScheme.surface,
          colorScheme.surfaceContainerHighest,
          colorScheme.surface,
          colorScheme.surfaceContainerHighest,
          colorScheme.surface,
        ],
      ),
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 2000),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOutSine,
                  ),
                  child: child,
                );
              },
              child: Stack(
                key: ValueKey(targetIcon),
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: targetIcon.value ?? defaultSongIconProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: useBlur.value,
                        sigmaY: useBlur.value,
                      ),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.easeInOutSine,
              decoration: gradientDecoration,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height:
                  MediaQuery.of(context).padding.top +
                  kToolbarHeight * size.multiplier3,
              color: colorScheme.tertiary.withValues(alpha: 0.1),
            ),
          ),
          SafeArea(
            top: true,
            bottom: false,
            child: buildContent(context, ref, requestFlag),
          ),
          showLoading
              ? requestFlag
                    ? const Center(child: AudioEqualizerLoader())
                    : const SizedBox.shrink()
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag);
}
