import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/hooks/use_progress.dart';
import 'package:toneharbor/providers/audio_player/lyrics_cache_provider.dart';
import 'package:toneharbor/providers/audio_station/auth_provider.dart';
import 'package:toneharbor/providers/audio_station/songs_provider.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
import 'package:toneharbor/widgets/widgets.dart';

class BottomPlayer extends HookConsumerWidget {
  const BottomPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlist = ref.watch(audioPlayerStateProvider);
    final activeTrack = playlist.activeTrack;

    if (activeTrack == null) {
      return const SizedBox.shrink();
    }

    final isHovered = useState(false);
    final colorScheme = getColorSchemeWhenReady(ref);

    final authHeaders = getValueWhenReadyWithWidgetRef(
      ref,
      authHeadersProvider,
      null,
    );
    final isPlaying =
        useStream(audioPlayer.playingStream).data ?? audioPlayer.isPlaying;
    final progressData = useProgress(ref);
    final progress = progressData.progressStatic;
    final position = progressData.position;
    final duration = progressData.duration;
    final draggingProgress = useState<double?>(null);
    final displayProgress = draggingProgress.value ?? progress;
    final bufferingPercentage = progressData.bufferProgress;
    final isBuffering = useStream(audioPlayer.bufferingStream).data ?? false;
    final currentLyrics = ref.watch(currentLyricsProvider).value;
    var currentLineLyrics = useState<String>("");

    LyricsLine? currentLine;
    if (currentLyrics != null) {
      final lineIndex = currentLyrics.lineIndexAt(
        position.inSeconds.toDouble(),
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

    final rating = activeTrack.rating;

    final artist = activeTrack.artist;
    final album = activeTrack.album;
    final textStyle11 = TextStyle(
      color: colorScheme.onSurface.withValues(alpha: 0.7),
      fontSize: 11,
    );
    final loopMode =
        useStream(audioPlayer.loopModeStream).data ?? audioPlayer.loopMode;

    final shuffled =
        useStream(audioPlayer.shuffledStream).data ?? audioPlayer.isShuffled;

    final volume = ref.watch(volumeProvider);

    final width = MediaQuery.of(context).size.width;
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
                  albumName: activeTrack.album,
                  artistName: activeTrack.artist,
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous_rounded),
                      onPressed: isBuffering
                          ? null
                          : () {
                              audioPlayer.skipToPrevious();
                            },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                      ),
                      onPressed: isBuffering
                          ? null
                          : () {
                              if (isPlaying) {
                                audioPlayer.pause();
                              } else {
                                audioPlayer.resume();
                              }
                            },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.skip_next_rounded),
                      onPressed: isBuffering
                          ? null
                          : () {
                              audioPlayer.skipToNext();
                            },
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _formatDuration(duration, position),
                        style: textStyle11,
                      ),

                      const SizedBox(width: 2),
                      IconButton(
                        icon: Icon(
                          volume > 0.5
                              ? Icons.volume_up_rounded
                              : volume > 0
                              ? Icons.volume_down_rounded
                              : Icons.volume_off_rounded,
                          size: 18,
                        ),
                        onPressed: () {
                          if (volume > 0.5) {
                            ref.read(volumeProvider.notifier).setVolume(0.5);
                          } else if (volume > 0) {
                            ref.read(volumeProvider.notifier).setVolume(0);
                          } else {
                            ref.read(volumeProvider.notifier).setVolume(1);
                          }
                        },
                      ),
                      if (width > 1250)
                        SizedBox(
                          width: 80,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 2,
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 5,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 10,
                              ),
                              trackShape: const RectangularSliderTrackShape(),
                            ),
                            child: Slider(
                              value: volume,
                              min: 0,
                              max: 1,
                              onChanged: (value) {
                                ref
                                    .read(volumeProvider.notifier)
                                    .setVolume(value);
                              },
                            ),
                          ),
                        ),
                      const SizedBox(width: 2),
                      IconButton(
                        icon: Icon(
                          rating >= 5
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          size: 18,
                        ),
                        onPressed: () async {
                          // ref.read(
                          //   setRatingProvider(
                          //     id: activeTrack.id,
                          //     rating: rating >= 5 ? 0 : 5,
                          //   ).future,
                          // );
                        },
                      ),
                      const SizedBox(width: 2),
                      IconButton(
                        icon: Icon(
                          _getLoopIcon(loopMode),
                          size: 18,
                          color: loopMode != PlaylistMode.none
                              ? colorScheme.primary
                              : null,
                        ),
                        onPressed: () {
                          _toggleLoopMode(loopMode);
                        },
                      ),
                      const SizedBox(width: 2),
                      IconButton(
                        onPressed: () {
                          if (shuffled) {
                            audioPlayer.setShuffle(false);
                          } else {
                            audioPlayer.setShuffle(true);
                          }
                        },
                        icon: Icon(
                          Icons.shuffle_rounded,
                          color: shuffled ? colorScheme.primary : null,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 2),
                      IconButton(
                        icon: const Icon(Icons.playlist_play_rounded, size: 18),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 2),
                      IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          size: 18,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
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

  void _toggleLoopMode(PlaylistMode currentMode) {
    PlaylistMode newMode;
    switch (currentMode) {
      case PlaylistMode.none:
        newMode = PlaylistMode.loop;
        break;
      case PlaylistMode.loop:
        newMode = PlaylistMode.single;
        break;
      case PlaylistMode.single:
        newMode = PlaylistMode.none;
        break;
    }
    audioPlayer.setLoopMode(newMode);
  }

  IconData _getLoopIcon(PlaylistMode mode) {
    switch (mode) {
      case PlaylistMode.single:
        return Icons.repeat_one;
      case PlaylistMode.loop:
        return Icons.repeat;
      case PlaylistMode.none:
        return Icons.repeat;
    }
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
