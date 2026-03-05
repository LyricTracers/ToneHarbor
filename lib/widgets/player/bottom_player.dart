import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/audio_player/lyrics_cache_provider.dart';
import 'package:toneharbor/providers/audio_station/auth_provider.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
import 'package:toneharbor/widgets/widgets.dart';

class BottomPlayer extends HookConsumerWidget {
  const BottomPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = useState(false);
    final activeTrack = ref.watch(activeTrackProvider);
    final colorScheme = getColorSchemeWhenReady(ref);

    if (activeTrack == null) {
      return const SizedBox.shrink();
    }

    final authHeaders = getValueWhenReadyWithWidgetRef(
      ref,
      authHeadersProvider,
      null,
    );
    final isPlaying = useStream(audioPlayer.playingStream).data ?? false;
    final playingPosition =
        useStream(audioPlayer.positionStream).data ?? Duration.zero;
    final bufferingPosition =
        useStream(audioPlayer.bufferedPositionStream).data ?? Duration.zero;
    final isBuffering = useStream(audioPlayer.bufferingStream).data ?? false;

    final durationStream = Duration(
      seconds: activeTrack.additional?.songAudio?.duration ?? 0,
    );
    final duration = durationStream;
    final progress = duration.inMilliseconds > 0
        ? (playingPosition.inMilliseconds / duration.inMilliseconds).clamp(
            0.0,
            1.0,
          )
        : 0.0;
    final draggingProgress = useState<double?>(null);
    final displayProgress = draggingProgress.value ?? progress;
    final bufferingPercentage = duration.inMilliseconds > 0
        ? (bufferingPosition.inMilliseconds / duration.inMilliseconds).clamp(
            0.0,
            1.0,
          )
        : 0.0;
    final currentLyrics = ref.watch(currentLyricsProvider).value;
    var currentLineLyrics = useState<String>("");

    LyricsLine? currentLine;
    if (currentLyrics != null) {
      final lineIndex = currentLyrics.lineIndexAt(
        playingPosition.inSeconds.toDouble(),
      );
      if (lineIndex != null &&
          lineIndex >= 0 &&
          lineIndex < currentLyrics.lines.length) {
        currentLine = currentLyrics.lines[lineIndex];
      }
    }
    if (currentLine != null && currentLine.content.isNotEmpty) {
      currentLineLyrics.value = currentLine.content;
    }
    if (currentLineLyrics.value.isEmpty) {
      currentLineLyrics.value = activeTrack.title;
    }

    final artist = activeTrack.additional?.songTag?.artist ?? "Unknown Artist";
    final album = activeTrack.additional?.songTag?.album ?? "Unknown Album";
    final textStyle11 = TextStyle(
      color: colorScheme.onSurface.withValues(alpha: 0.7),
      fontSize: 11,
    );
    return Container(
      color: colorScheme.surface.withValues(alpha: 0.2),
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 5,
              left: 10,
              right: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SongCoverImage(
                  songId: activeTrack.id,
                  albumName: activeTrack.additional?.songTag?.album ?? "",
                  artistName: activeTrack.additional?.songTag?.artist ?? "",
                  colorScheme: colorScheme,
                  config: const SongCoverImageConfig(size: 50, borderRadius: 5),
                  authHeaders: authHeaders ?? <String, String>{},
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  child: MouseRegion(
                    onEnter: (_) => isHovered.value = true,
                    onExit: (_) => isHovered.value = false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              isHovered.value
                                  ? activeTrack.title
                                  : currentLineLyrics.value,
                              style: TextStyle(
                                color: colorScheme.onSurface,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              isHovered.value
                                  ? "$artist - $album"
                                  : (currentLine != null
                                        ? "$artist - $album"
                                        : ""),
                              style: textStyle11,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              _formatDuration(duration, playingPosition),
                              style: textStyle11,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: () {
                        audioPlayer.skipToPrevious();
                      },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        if (isPlaying) {
                          audioPlayer.pause();
                        } else {
                          audioPlayer.resume();
                        }
                      },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed: () => audioPlayer.skipToNext(),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            left: -10,
            right: -10,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 20,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: LinearProgressIndicator(
                          value: bufferingPercentage,
                          minHeight: 2,
                          backgroundColor: Colors.transparent,
                          valueColor: AlwaysStoppedAnimation(
                            colorScheme.onSurface.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 5,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 20,
                    ),
                    activeTrackColor: colorScheme.primary,
                    inactiveTrackColor: Colors.transparent,
                    trackShape: const RectangularSliderTrackShape(),
                  ),
                  child: Slider(
                    value: displayProgress,
                    onChanged: isBuffering
                        ? null
                        : (value) {
                            draggingProgress.value = value;
                          },
                    onChangeEnd: (value) {
                      final newPosition = Duration(
                        milliseconds: (value * duration.inMilliseconds).toInt(),
                      );
                      audioPlayer.seek(newPosition);
                      draggingProgress.value = null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  String _formatDuration(Duration duration, Duration playingDuration) {
    final minutesDuration = _twoDigits(duration.inMinutes.remainder(60));
    final secondsDuration = _twoDigits(duration.inSeconds.remainder(60));
    final minutesPlayingDuration = _twoDigits(
      playingDuration.inMinutes.remainder(60),
    );
    final secondsPlayingDuration = _twoDigits(
      playingDuration.inSeconds.remainder(60),
    );
    return '$minutesPlayingDuration:$secondsPlayingDuration/$minutesDuration:$secondsDuration';
  }
}
