import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
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
                      filter: ui.ImageFilter.blur(sigmaX: 50, sigmaY: 50),
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
