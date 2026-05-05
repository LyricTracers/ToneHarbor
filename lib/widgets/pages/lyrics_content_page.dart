import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';

class LyricsContentPage extends HookConsumerWidget {
  final Lyrics? currentLyrics;
  final double extraFontSize;
  final bool half;
  const LyricsContentPage({
    super.key,
    this.currentLyrics,
    this.extraFontSize = 0,
    this.half = false,
  });

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final i10n = ref.watch(l10nProvider);
    final controller = useMemoized(() {
      return LyricController();
    }, []);

    final isMounted = useRef(true);

    useEffect(() {
      isMounted.value = true;
      return () {
        isMounted.value = false;
        controller.dispose();
      };
    }, []);

    final fontSizeOffset = useState(0.0);

    final customStyle = useMemoized(
      () => LyricStyle(
        textStyle: TextStyle(
          fontSize: 16 + extraFontSize + fontSizeOffset.value,
          color: colorScheme.onSurface.withValues(alpha: .7),
        ),
        activeStyle: TextStyle(
          fontSize: 18 + extraFontSize + fontSizeOffset.value,
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        translationActiveColor: colorScheme.primary,
        translationStyle: TextStyle(
          fontSize: 15 + extraFontSize + fontSizeOffset.value,
          color: colorScheme.onSurface.withValues(alpha: .7),
        ),
        lineTextAlign: TextAlign.center,
        lineGap: 26 + fontSizeOffset.value * 0.5,
        translationLineGap: 10 + fontSizeOffset.value * 0.3,
        contentAlignment: CrossAxisAlignment.center,
        contentPadding: const EdgeInsets.only(
          top: 100,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        selectionAnchorPosition: 0.48,
        fadeRange: FadeRange(top: 0.2, bottom: 0.2),
        selectedColor: colorScheme.secondary,
        selectedTranslationColor: colorScheme.secondary,
        scrollDuration: const Duration(milliseconds: 240),
        scrollDurations: {
          500: const Duration(milliseconds: 500),
          1000: const Duration(milliseconds: 1000),
        },
        enableSwitchAnimation: true,
        selectionAutoResumeMode: SelectionAutoResumeMode.afterSelecting,
        selectionAutoResumeDuration: const Duration(milliseconds: 320),
        activeAutoResumeDuration: const Duration(milliseconds: 1500),
        activeHighlightColor: colorScheme.primary,
        switchEnterDuration: const Duration(milliseconds: 300),
        switchExitDuration: const Duration(milliseconds: 500),
        switchEnterCurve: Curves.easeOutBack,
        switchExitCurve: Curves.easeOutQuint,
        selectionAlignment: MainAxisAlignment.center,
      ),
      [colorScheme, extraFontSize, fontSizeOffset.value],
    );

    useEffect(() {
      if (currentLyrics != null && isMounted.value) {
        final lyricModel = currentLyrics!.toLyricModel();
        controller.loadLyricModel(lyricModel);
      }
      return null;
    }, [currentLyrics, controller, isMounted]);

    useEffect(() {
      final subscription = audioPlayer.positionStream.listen((position) {
        if (isMounted.value) {
          controller.setProgress(position);
        }
      });
      return subscription.cancel;
    }, [controller, isMounted]);

    final isSelecting = useValueListenable(controller.isSelectingNotifier);
    final anchorPosition = useValueListenable(
      controller.anchorPositionNotifier,
    );
    final selectedIndex = useValueListenable(controller.selectedIndexNotifier);
    final size = MediaQuery.of(context).size;
    Widget buildSelectionProgress() {
      if (!isSelecting) return const SizedBox.shrink();
      final lyricModel = controller.lyricNotifier.value;
      if (lyricModel == null) return const SizedBox.shrink();
      if (selectedIndex < 0 || selectedIndex >= lyricModel.lines.length) {
        return const SizedBox.shrink();
      }
      final duration = lyricModel.lines[selectedIndex].start;
      return Positioned(
        top: anchorPosition,
        right: 12,
        left: 12,
        child: FractionalTranslation(
          translation: const Offset(0, -0.5),
          transformHitTests: true,
          child: SizedBox(
            height: 200,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  left: 12,
                  right: 12,
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.75,
                      child: Container(height: 1, color: Colors.white30),
                    ),
                  ),
                ),

                Positioned(
                  right: 20,
                  child: DecoratedBox(
                    decoration: _SelectionProgressDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2,
                      ).copyWith(left: 2),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (!audioPlayer.isPlaying) {
                                await audioPlayer.resume();
                              }
                              controller.stopSelection();
                              audioPlayer.seek(
                                duration + const Duration(milliseconds: 300),
                              );
                            },
                            child: const Icon(Icons.play_arrow, size: 16),
                          ),
                          Text(
                            formatDuration(duration),
                            style: const TextStyle(fontSize: 12, height: 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildSlideFontSize() {
      return Positioned(
        top: 50,
        right: 16,
        child: SafeArea(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.text_increase,
                    size: 14,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  SizedBox(
                    height: 100,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 2.0,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 6.0,
                          ),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 12.0,
                          ),
                        ),
                        child: Slider(
                          value: fontSizeOffset.value,
                          min: -4,
                          max: 4,
                          divisions: 8,
                          activeColor: colorScheme.primary,
                          inactiveColor: colorScheme.onSurface.withValues(
                            alpha: 0.3,
                          ),
                          thumbColor: colorScheme.primary,
                          onChanged: (value) {
                            fontSizeOffset.value = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.text_decrease,
                    size: 14,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  Text(
                    '${(18 + extraFontSize + fontSizeOffset.value).toStringAsFixed(0)}sp',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return currentLyrics != null
        ? RepaintBoundary(
            child: Stack(
              children: [
                GestureDetector(
                  onDoubleTap: () async {
                    final lyricModel = controller.lyricNotifier.value;
                    final selectedIndex =
                        controller.selectedIndexNotifier.value;
                    if (lyricModel != null &&
                        selectedIndex >= 0 &&
                        selectedIndex < lyricModel.lines.length) {
                      final line = lyricModel.lines[selectedIndex];
                      if (ref.read(lyricDoubleClickProvider) ==
                          LyricsDoubleClickAction.seek) {
                        if (!audioPlayer.isPlaying) {
                          await audioPlayer.resume();
                        }
                        controller.stopSelection();
                        audioPlayer.seek(
                          line.start + const Duration(milliseconds: 300),
                        );
                      } else {
                        copyToClipboard(
                          line.text,
                          ref.context,
                          colorScheme.secondary,
                        );
                      }
                    }
                  },
                  child: LyricView(controller: controller, style: customStyle),
                ),
                buildSelectionProgress(),
                if (size.lgAndUp && !half) buildSlideFontSize(),
              ],
            ),
          )
        : Center(
            child: Text(i10n.no_lyric, style: const TextStyle(fontSize: 18)),
          );
  }
}

class _SelectionProgressDecoration extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _SelectionProgressBoxPainter(onChanged);
  }
}

class _SelectionProgressBoxPainter extends BoxPainter {
  _SelectionProgressBoxPainter(super.onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final radius = 2.0;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          offset.dx,
          offset.dy,
          configuration.size!.width,
          configuration.size!.height,
        ),
        Radius.circular(radius),
      ),
      Paint()..color = const Color(0xFF424242),
    );

    final path = Path();
    final triangleWidth = 8.0;
    path.moveTo(
      offset.dx - triangleWidth,
      offset.dy + configuration.size!.height / 2,
    );
    path.lineTo(offset.dx, offset.dy + radius / 2);
    path.lineTo(offset.dx, offset.dy + configuration.size!.height - radius / 2);
    path.close();
    canvas.drawPath(path, Paint()..color = const Color(0xFF424242));
  }
}
