import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/audio_station/auth_provider.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/player/player_track_details.dart';
import 'package:toneharbor/widgets/player/player_controls.dart';
import 'package:toneharbor/widgets/player/player_actions.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';
import 'package:toneharbor/widgets/widgets.dart';

class BottomPlayer extends HookConsumerWidget {
  const BottomPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    final isPlaying = ref.watch(playingStreamProvider).value ?? false;
    final bufferingPercentage =
        ref.watch(bufferingPercentageStreamProvider).value ?? 0.0;
    final playingPosition =
        ref.watch(positionStreamProvider).value ?? Duration.zero;
    final durationStream =
        ref.watch(durationStreamProvider).value ?? Duration.zero;
    final duration = durationStream;
    final progress = duration.inMilliseconds > 0
        ? (playingPosition.inMilliseconds / duration.inMilliseconds).clamp(
            0.0,
            1.0,
          )
        : 0.0;
    final draggingProgress = useState<double?>(null);
    final displayProgress = draggingProgress.value ?? progress;

    final isBuffering = bufferingPercentage < displayProgress && isPlaying;

    return Container(
      color: colorScheme.surface.withValues(alpha: 0.2),
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 10,
            ),
            child: Row(
              children: [
                SongCoverImage(
                  songId: activeTrack.id,
                  albumName: activeTrack.additional?.songTag?.album ?? "",
                  artistName: activeTrack.additional?.songTag?.artist ?? "",
                  colorScheme: colorScheme,
                  config: const SongCoverImageConfig(size: 50, borderRadius: 5),
                  authHeaders: authHeaders ?? <String, String>{},
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
                      ref.read(playlistProvider.notifier).seek(newPosition);
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
}
