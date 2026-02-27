import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/providers/theme_data_provider.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'dart:ui' as ui;

import 'package:toneharbor/widgets/audio_equalizer_loader.dart';

abstract class BaseBgLayout extends HookConsumerWidget {
  const BaseBgLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    var syncSongIcon = getValueWhenReadyWithWidgetRef(
      ref,
      syncSongIconProvider,
      true,
    );
    final songIcon = getValueWhenReadyWithWidgetRef(
      ref,
      songIconProvider,
      defaultSongIconProvider,
    );
    final defaultIcon = getValueWhenReadyWithWidgetRef(
      ref,
      loadDefaultThemeIconProvider,
      defaultSongIconProvider,
    );
    var requestFlag = ref.watch(requestFlagProvider);
    var targetIcon = syncSongIcon ? songIcon : defaultIcon ?? songIcon;
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
                          image: targetIcon,
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
          buildContent(context, ref, requestFlag),
          requestFlag
              ? const Center(child: AudioEqualizerLoader())
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag);
}
