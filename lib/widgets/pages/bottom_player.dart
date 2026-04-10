import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/utils/use_progress.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/widgets.dart';

enum ShowArrowType { up, down, none }

class _PlayerState {
  final bool isPlaying;
  final bool isBuffering;
  final PlaylistMode loopMode;
  final bool shuffled;

  const _PlayerState({
    required this.isPlaying,
    required this.isBuffering,
    required this.loopMode,
    required this.shuffled,
  });
}

class _ProgressData {
  final Duration duration;
  final Duration position;
  final double displayProgress;
  final ValueNotifier<double?> draggingProgress;
  final double bufferingPercentage;

  const _ProgressData({
    required this.duration,
    required this.position,
    required this.displayProgress,
    required this.draggingProgress,
    required this.bufferingPercentage,
  });
}

class _TrackInfo {
  final ToneHarborTrackObject activeTrack;
  final String artist;
  final String album;
  final bool rating;

  _TrackInfo({
    required this.activeTrack,
    required this.artist,
    required this.album,
    required this.rating,
  });
}

class _UIConfig {
  final ColorScheme colorScheme;
  final AppLocalizations l10n;
  final Size size;
  final bool isXs;
  final TextStyle textStyle11;
  final Color backgroundColor;

  _UIConfig({
    required this.colorScheme,
    required this.l10n,
    required this.size,
    required this.isXs,
    required this.textStyle11,
    required this.backgroundColor,
  });
}

class _VolumeConfig {
  final double volume;
  final AsyncValue<Map<String, String>?> authHeaders;

  _VolumeConfig({required this.volume, required this.authHeaders});
}

class BottomPlayer extends HookConsumerWidget {
  final ShowArrowType showArrowType;
  const BottomPlayer({super.key, this.showArrowType = ShowArrowType.up});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlist = ref.watch(audioPlayerStateProvider);
    final activeTrack = playlist.activeTrack;

    if (activeTrack == null) {
      return const SizedBox.shrink();
    }

    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);
    final size = MediaQuery.of(context).size;
    final isXs = size.isXs;

    final isPlaying =
        useStream(audioPlayer.playingStream).data ?? audioPlayer.isPlaying;
    final isBuffering = useStream(audioPlayer.bufferingStream).data ?? false;
    final loopMode =
        useStream(audioPlayer.loopModeStream).data ?? audioPlayer.loopMode;
    final shuffled =
        useStream(audioPlayer.shuffledStream).data ?? audioPlayer.isShuffled;

    final progressData = useProgress(ref);
    final progress = progressData.progressStatic;
    final position = progressData.position;
    final duration = progressData.duration;
    final bufferingPercentage = progressData.bufferProgress;

    final draggingProgress = useState<double?>(null);
    final isHovered = useState(false);
    final displayProgress = draggingProgress.value ?? progress;

    final currentLyrics = ref.watch(currentLyricsProvider).value;
    var currentLineLyrics = useState<String>(l10n.appTitle);

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

    useEffect(() {
      currentLineLyrics.value = activeTrack.title;
      MostPlayerService.insertMostPlayer(
        ref.read(appDatabaseProvider),
        activeTrack,
      );
      return null;
    }, [activeTrack]);

    if (Platform.isMacOS) {
      final systemBrightness = MediaQuery.platformBrightnessOf(context);
      final statusBarState = ref.watch(statusBarLyricProvider);
      useEffect(() {
        switchIconWithLabel(
          systemBrightness == Brightness.dark,
          statusBarState,
          label: currentLineLyrics.value,
        );
        return null;
      }, [systemBrightness, statusBarState, currentLineLyrics.value]);
    }

    final favoritePlaylist = ref.watch(songRatingProvider);
    final rating = favoritePlaylist.contains(activeTrack.id);
    final volume = ref.watch(volumeProvider);
    final authHeaders = ref.watch(authHeadersProvider);

    final artist = activeTrack.artist;
    final album = activeTrack.album;
    final textStyle11 = TextStyle(
      color: colorScheme.onSurface.withValues(alpha: 0.7),
      fontSize: 11 * size.multiplier3,
    );
    final backgroundColor = colorScheme.tertiary.withValues(alpha: 0.1);

    final playerState = _PlayerState(
      isPlaying: isPlaying,
      isBuffering: isBuffering,
      loopMode: loopMode,
      shuffled: shuffled,
    );

    final progressInfo = _ProgressData(
      duration: duration,
      position: position,
      displayProgress: displayProgress,
      draggingProgress: draggingProgress,
      bufferingPercentage: bufferingPercentage,
    );

    final trackInfo = _TrackInfo(
      activeTrack: activeTrack,
      artist: artist,
      album: album,
      rating: rating,
    );

    final uiConfig = _UIConfig(
      colorScheme: colorScheme,
      l10n: l10n,
      size: size,
      isXs: isXs,
      textStyle11: textStyle11,
      backgroundColor: backgroundColor,
    );

    final volumeConfig = _VolumeConfig(
      volume: volume,
      authHeaders: authHeaders,
    );

    if (isXs && showArrowType == ShowArrowType.down) {
      return _buildXsDownLayout(
        context,
        ref,
        playerState: playerState,
        progressInfo: progressInfo,
        trackInfo: trackInfo,
        uiConfig: uiConfig,
        volumeConfig: volumeConfig,
        currentLineLyrics: currentLineLyrics,
      );
    }

    return _buildDefaultLayout(
      context,
      ref,
      colorScheme,
      playerState: playerState,
      progressInfo: progressInfo,
      trackInfo: trackInfo,
      uiConfig: uiConfig,
      volumeConfig: volumeConfig,
      currentLineLyrics: currentLineLyrics,
      isHovered: isHovered,
    );
  }

  Widget _buildXsDownLayout(
    BuildContext context,
    WidgetRef ref, {
    required _PlayerState playerState,
    required _ProgressData progressInfo,
    required _TrackInfo trackInfo,
    required _UIConfig uiConfig,
    required _VolumeConfig volumeConfig,
    required ValueNotifier<String> currentLineLyrics,
  }) {
    var padding = MediaQuery.paddingOf(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: max(padding.bottom, 10),
      ),
      child: Column(
        children: [
          _buildXsDownHeader(
            ref,
            context,
            trackInfo: trackInfo,
            uiConfig: uiConfig,
            volumeConfig: volumeConfig,
          ),
          _buildXsDownLyricsRow(
            trackInfo: trackInfo,
            currentLineLyrics: currentLineLyrics,
            progressInfo: progressInfo,
            textStyle11: uiConfig.textStyle11,
          ),
          _buildXsDownProgressSlider(
            context,
            playerState: playerState,
            progressInfo: progressInfo,
          ),
          _buildXsDownControlButtons(
            context,
            playerState: playerState,
            uiConfig: uiConfig,
          ),
        ],
      ),
    );
  }

  Widget _buildXsDownHeader(
    WidgetRef ref,
    BuildContext context, {
    required _TrackInfo trackInfo,
    required _UIConfig uiConfig,
    required _VolumeConfig volumeConfig,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(left: 10)),
        Flexible(
          flex: 1,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "${trackInfo.artist} - ${trackInfo.activeTrack.title}",
              style: TextStyle(
                color: uiConfig.colorScheme.onSurface,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
        _buildVolumeButton(volume: volumeConfig.volume, ref: ref),
        if (!trackInfo.activeTrack.isLocal &&
            volumeConfig.authHeaders.value != null)
          _buildRatingButton(
            ref,
            context,
            activeTrack: trackInfo.activeTrack,
            rating: trackInfo.rating,
            colorScheme: uiConfig.colorScheme,
          ),
        _buildPlaylistButton(
          context: context,
          colorScheme: uiConfig.colorScheme,
          l10n: uiConfig.l10n,
          size: uiConfig.size,
        ),
      ],
    );
  }

  Widget _buildXsDownLyricsRow({
    required _TrackInfo trackInfo,
    required ValueNotifier<String> currentLineLyrics,
    required _ProgressData progressInfo,
    required TextStyle textStyle11,
  }) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 10)),
        Flexible(
          flex: 1,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              currentLineLyrics.value == trackInfo.activeTrack.title
                  ? ''
                  : currentLineLyrics.value,
              style: TextStyle(color: textStyle11.color, fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          _formatDuration(progressInfo.duration, progressInfo.position),
          style: textStyle11,
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget _buildXsDownProgressSlider(
    BuildContext context, {
    required _PlayerState playerState,
    required _ProgressData progressInfo,
  }) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: LinearProgressIndicator(
                  value: progressInfo.bufferingPercentage,
                  minHeight: 4,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          ),
          child: Slider(
            value: progressInfo.displayProgress,
            onChanged: playerState.isBuffering
                ? null
                : (value) => progressInfo.draggingProgress.value = value,
            onChangeEnd: (value) {
              final newPosition = Duration(
                milliseconds: (value * progressInfo.duration.inMilliseconds)
                    .toInt(),
              );
              audioPlayer.seek(newPosition);
              progressInfo.draggingProgress.value = null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildXsDownControlButtons(
    BuildContext context, {
    required _PlayerState playerState,
    required _UIConfig uiConfig,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildShuffleButton(
          shuffled: playerState.shuffled,
          colorScheme: uiConfig.colorScheme,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPreviousButton(
                context,
                l10n: uiConfig.l10n,
                colorScheme: uiConfig.colorScheme,
                loopMode: playerState.loopMode,
              ),
              const SizedBox(width: 2),
              _buildPlayPauseButton(
                isPlaying: playerState.isPlaying,
                isBuffering: playerState.isBuffering,
                size: 24,
              ),
              const SizedBox(width: 2),
              _buildNextButton(
                context,
                l10n: uiConfig.l10n,
                colorScheme: uiConfig.colorScheme,
                loopMode: playerState.loopMode,
              ),
            ],
          ),
        ),
        _buildLoopButton(
          loopMode: playerState.loopMode,
          colorScheme: uiConfig.colorScheme,
        ),
      ],
    );
  }

  Widget _buildDefaultLayout(
    BuildContext context,
    WidgetRef ref,
    ColorScheme colorScheme, {
    required _PlayerState playerState,
    required _ProgressData progressInfo,
    required _TrackInfo trackInfo,
    required _UIConfig uiConfig,
    required _VolumeConfig volumeConfig,
    required ValueNotifier<String> currentLineLyrics,
    required ValueNotifier<bool> isHovered,
  }) {
    return Column(
      children: [
        if (!uiConfig.isXs && showArrowType == ShowArrowType.down) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (uiConfig.size.smAndDown)
                _buildVolumeButton(volume: volumeConfig.volume, ref: ref),
              if (uiConfig.size.smAndDown &&
                  !trackInfo.activeTrack.isLocal &&
                  volumeConfig.authHeaders.value != null)
                _buildRatingButton(
                  ref,
                  context,
                  activeTrack: trackInfo.activeTrack,
                  rating: trackInfo.rating,
                  colorScheme: uiConfig.colorScheme,
                ),
              SizedBox(width: 5 * uiConfig.size.multiplier2),
            ],
          ),
          if (uiConfig.size.mdAndDown)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (uiConfig.size.mdAndDown)
                  Text(
                    _formatDuration(
                      progressInfo.duration,
                      progressInfo.position,
                    ),
                    style: uiConfig.textStyle11,
                  ),
                SizedBox(width: 15 * uiConfig.size.multiplier2),
              ],
            ),
          Padding(padding: EdgeInsets.only(bottom: 5)),
        ],
        Padding(
          padding: EdgeInsets.only(
            left: uiConfig.isXs ? 10 : 0,
            right: uiConfig.isXs ? 10 : 0,
            bottom: uiConfig.isXs
                ? max(MediaQuery.paddingOf(context).bottom, 10)
                : 0,
          ),
          child: GestureDetector(
            onTap:
                uiConfig.isXs &&
                    (showArrowType == ShowArrowType.up ||
                        showArrowType == ShowArrowType.none)
                ? () {
                    showModalBottomSheetWidget(
                      ref.context,
                      colorScheme,
                      isScrollControlled: true,
                      (context) => const PlayingDetailLayout(),
                    );
                  }
                : null,
            child: Container(
              color: uiConfig.isXs ? null : uiConfig.backgroundColor,
              height: uiConfig.isXs ? 60 : 70,
              decoration: uiConfig.isXs
                  ? BoxDecoration(
                      color: uiConfig.backgroundColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: uiConfig.backgroundColor),
                    )
                  : null,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _buildDefaultContent(
                    context,
                    ref,
                    playerState: playerState,
                    progressInfo: progressInfo,
                    trackInfo: trackInfo,
                    uiConfig: uiConfig,
                    volumeConfig: volumeConfig,
                    currentLineLyrics: currentLineLyrics,
                    isHovered: isHovered,
                  ),
                  if (!uiConfig.isXs)
                    _buildDefaultProgressBar(
                      context,
                      colorScheme: uiConfig.colorScheme,
                      progressInfo: progressInfo,
                      isBuffering: playerState.isBuffering,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultContent(
    BuildContext context,
    WidgetRef ref, {
    required _PlayerState playerState,
    required _ProgressData progressInfo,
    required _TrackInfo trackInfo,
    required _UIConfig uiConfig,
    required _VolumeConfig volumeConfig,
    required ValueNotifier<String> currentLineLyrics,
    required ValueNotifier<bool> isHovered,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: uiConfig.isXs ? 5 : 10,
        bottom: uiConfig.isXs ? 5 : 5,
        left: 15,
        right: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCoverImage(
            activeTrack: trackInfo.activeTrack,
            colorScheme: uiConfig.colorScheme,
            isXs: uiConfig.isXs,
          ),
          const SizedBox(width: 10),
          _buildTrackInfo(
            activeTrack: trackInfo.activeTrack,
            artist: trackInfo.artist,
            album: trackInfo.album,
            colorScheme: uiConfig.colorScheme,
            size: uiConfig.size,
            isHovered: isHovered,
            currentLineLyrics: currentLineLyrics,
            textStyle11: uiConfig.textStyle11,
          ),
          const SizedBox(width: 10),
          if (!uiConfig.isXs)
            _buildDesktopControlButtons(
              context,
              l10n: uiConfig.l10n,
              colorScheme: uiConfig.colorScheme,
              playerState: playerState,
            ),
          const SizedBox(width: 10),
          _buildRightButtons(
            context,
            ref,
            playerState: playerState,
            progressInfo: progressInfo,
            trackInfo: trackInfo,
            uiConfig: uiConfig,
            volumeConfig: volumeConfig,
          ),
        ],
      ),
    );
  }

  Widget _buildCoverImage({
    required ToneHarborTrackObject activeTrack,
    required ColorScheme colorScheme,
    required bool isXs,
  }) {
    if (activeTrack is ToneHarborTrackObjectCloudMusic) {
      return CloudMusicCoverImage(
        imageUrl: activeTrack.coverUrl ?? '',
        colorScheme: colorScheme,
        config: isXs
            ? const CloudMusicCoverImageConfig(size: 50, isCircular: true)
            : const CloudMusicCoverImageConfig(size: 50, borderRadius: 5),
      );
    }
    return SongCoverImage(
      songId: activeTrack.id,
      albumName: activeTrack.album,
      artistName: activeTrack.artist,
      colorScheme: colorScheme,
      config: isXs
          ? const SongCoverImageConfig(size: 50, isCircular: true)
          : const SongCoverImageConfig(size: 50, borderRadius: 5),
    );
  }

  Widget _buildTrackInfo({
    required ToneHarborTrackObject activeTrack,
    required String artist,
    required String album,
    required ColorScheme colorScheme,
    required Size size,
    required ValueNotifier<bool> isHovered,
    required ValueNotifier<String> currentLineLyrics,
    required TextStyle textStyle11,
  }) {
    return Flexible(
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
                  isHovered.value ? activeTrack.title : currentLineLyrics.value,
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 14 * size.multiplier3,
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
                  "$artist - $album",
                  style: textStyle11,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopControlButtons(
    BuildContext context, {
    required AppLocalizations l10n,
    required ColorScheme colorScheme,
    required _PlayerState playerState,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPreviousButton(
          context,
          l10n: l10n,
          colorScheme: colorScheme,
          loopMode: playerState.loopMode,
        ),
        const SizedBox(width: 10),
        _buildPlayPauseButton(
          isPlaying: playerState.isPlaying,
          isBuffering: playerState.isBuffering,
          size: 18,
        ),
        const SizedBox(width: 10),
        _buildNextButton(
          context,
          l10n: l10n,
          colorScheme: colorScheme,
          loopMode: playerState.loopMode,
        ),
      ],
    );
  }

  Widget _buildRightButtons(
    BuildContext context,
    WidgetRef ref, {
    required _PlayerState playerState,
    required _ProgressData progressInfo,
    required _TrackInfo trackInfo,
    required _UIConfig uiConfig,
    required _VolumeConfig volumeConfig,
  }) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (uiConfig.size.is2Xl && showArrowType == ShowArrowType.up ||
              uiConfig.size.lgAndUp && showArrowType == ShowArrowType.down)
            Text(
              _formatDuration(progressInfo.duration, progressInfo.position),
              style: uiConfig.textStyle11,
            ),

          if (uiConfig.size.mdAndUp)
            _buildVolumeButton(volume: volumeConfig.volume, ref: ref),
          if (uiConfig.size.is2Xl) _buildVolumeSlider(context),

          if (uiConfig.size.mdAndUp &&
              !trackInfo.activeTrack.isLocal &&
              volumeConfig.authHeaders.value != null)
            _buildRatingButton(
              ref,
              context,
              activeTrack: trackInfo.activeTrack,
              rating: trackInfo.rating,
              colorScheme: uiConfig.colorScheme,
            ),
          const SizedBox(width: 2),
          if (uiConfig.size.xlAndUp) ...[
            _buildLoopButton(
              loopMode: playerState.loopMode,
              colorScheme: uiConfig.colorScheme,
            ),
            const SizedBox(width: 2),
            _buildShuffleButton(
              shuffled: playerState.shuffled,
              colorScheme: uiConfig.colorScheme,
            ),
            const SizedBox(width: 2),
          ],
          if (uiConfig.isXs) ...[
            _buildPlayPauseButton(
              isPlaying: playerState.isPlaying,
              isBuffering: playerState.isBuffering,
              size: 18,
            ),
            const SizedBox(width: 10),
          ],
          _buildPlaylistButton(
            context: context,
            colorScheme: uiConfig.colorScheme,
            l10n: uiConfig.l10n,
            size: uiConfig.size,
          ),
          if (uiConfig.size.smAndUp && showArrowType != ShowArrowType.none) ...[
            const SizedBox(width: 2),
            _buildArrowButton(context),
          ],
        ],
      ),
    );
  }

  Widget _buildDefaultProgressBar(
    BuildContext context, {
    required ColorScheme colorScheme,
    required _ProgressData progressInfo,
    required bool isBuffering,
  }) {
    return Positioned(
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
                    value: progressInfo.bufferingPercentage,
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
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
              activeTrackColor: colorScheme.primary,
              inactiveTrackColor: Colors.transparent,
              trackShape: const RectangularSliderTrackShape(),
            ),
            child: Slider(
              value: progressInfo.displayProgress,
              onChanged: isBuffering
                  ? null
                  : (value) => progressInfo.draggingProgress.value = value,
              onChangeEnd: (value) {
                final newPosition = Duration(
                  milliseconds: (value * progressInfo.duration.inMilliseconds)
                      .toInt(),
                );
                audioPlayer.seek(newPosition);
                progressInfo.draggingProgress.value = null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVolumeSlider(BuildContext context) {
    return SizedBox(
      width: 80,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 2,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
          trackShape: const RectangularSliderTrackShape(),
        ),
        child: HookBuilder(
          builder: (context) {
            final volume = useState(audioPlayer.volume);
            useEffect(() {
              final subscription = audioPlayer.volumeStream.listen((v) {
                volume.value = v;
              });
              return subscription.cancel;
            }, []);
            return Slider(
              value: volume.value,
              min: 0,
              max: 1,
              onChanged: (value) {
                audioPlayer.setVolume(value);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildPlayPauseButton({
    required bool isPlaying,
    required bool isBuffering,
    double size = 18,
  }) {
    return IconButton(
      icon: Icon(
        isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
        size: size,
      ),
      onPressed: isBuffering
          ? null
          : () {
              if (isPlaying) {
                audioPlayer.pauseWithFadeOut();
              } else {
                audioPlayer.resumeWithFadeIn();
              }
            },
    );
  }

  Widget _buildPreviousButton(
    BuildContext context, {
    required AppLocalizations l10n,
    required ColorScheme colorScheme,
    required PlaylistMode loopMode,
  }) {
    return IconButton(
      icon: const Icon(Icons.skip_previous_rounded, size: 24),
      onPressed: () {
        if (loopMode == PlaylistMode.none && audioPlayer.currentIndex == 0) {
          showSnackBar(l10n.tip_pre_song, context, colorScheme.secondary);
          return;
        }
        audioPlayer.skipToPrevious();
      },
    );
  }

  Widget _buildNextButton(
    BuildContext context, {
    required AppLocalizations l10n,
    required ColorScheme colorScheme,
    required PlaylistMode loopMode,
  }) {
    return IconButton(
      icon: const Icon(Icons.skip_next_rounded, size: 24),
      onPressed: () {
        if (loopMode == PlaylistMode.none &&
            audioPlayer.currentIndex == audioPlayer.sources.length - 1) {
          showSnackBar(l10n.tip_next_song, context, colorScheme.secondary);
          return;
        }
        audioPlayer.skipToNext();
      },
    );
  }

  Widget _buildLoopButton({
    required PlaylistMode loopMode,
    required ColorScheme colorScheme,
  }) {
    return IconButton(
      icon: Icon(
        _getLoopIcon(loopMode),
        size: 18,
        color: loopMode != PlaylistMode.none ? colorScheme.primary : null,
      ),
      onPressed: () => _toggleLoopMode(loopMode),
    );
  }

  Widget _buildShuffleButton({
    required bool shuffled,
    required ColorScheme colorScheme,
  }) {
    return IconButton(
      onPressed: () => audioPlayer.setShuffle(!shuffled),
      icon: Icon(
        Icons.shuffle_rounded,
        color: shuffled ? colorScheme.primary : null,
        size: 18,
      ),
    );
  }

  Widget _buildVolumeButton({required double volume, required WidgetRef ref}) {
    return IconButton(
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
    );
  }

  Widget _buildRatingButton(
    WidgetRef ref,
    BuildContext context, {
    required ToneHarborTrackObject activeTrack,
    required bool rating,
    required ColorScheme colorScheme,
  }) {
    return IconButton(
      icon: Icon(
        rating ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        size: 18,
      ),
      onPressed: () async {
        try {
          ref.read(requestFlagProvider.notifier).setRequestFlag(true);
          SetRatingResponse response;
          if (rating) {
            response = await ref
                .read(songRatingProvider.notifier)
                .setRating(id: activeTrack.id, rating: 0);
          } else {
            response = await ref
                .read(songRatingProvider.notifier)
                .setRating(id: activeTrack.id, rating: 5);
          }
          if (response.success) {
            ref
                .read(favoriteSongsProvider(limit: 50).notifier)
                .invalidateCache();
            ref.invalidate(favoriteSongsProvider);
          }
        } catch (e) {
          if (context.mounted) {
            showSnackBarError(e, context, colorScheme.secondary);
          }
        } finally {
          ref.read(requestFlagProvider.notifier).setRequestFlag(false);
        }
      },
    );
  }

  Widget _buildPlaylistButton({
    required BuildContext context,
    required ColorScheme colorScheme,
    required AppLocalizations l10n,
    required Size size,
  }) {
    return IconButton(
      tooltip: l10n.play_queue,
      icon: const Icon(Icons.queue_music_rounded, size: 18),
      onPressed: () {
        if (size.mdAndUp) {
          showSlidePanel(
            context: context,
            builder: (context) => const PlaylistPage(),
          );
        } else {
          showModalBottomSheetWidget(
            context,
            colorScheme,
            (context) => const PlaylistPage(),
          );
        }
      },
    );
  }

  Widget _buildArrowButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        showArrowType == ShowArrowType.up
            ? Icons.keyboard_arrow_up_rounded
            : Icons.keyboard_arrow_down_rounded,
        size: 18,
      ),
      onPressed: () {
        if (showArrowType == ShowArrowType.up) {
          context.pushWrapper("/playing_detail");
        } else {
          context.popWrap();
        }
      },
    );
  }

  void _toggleLoopMode(PlaylistMode currentMode) {
    final newMode = switch (currentMode) {
      PlaylistMode.none => PlaylistMode.loop,
      PlaylistMode.loop => PlaylistMode.single,
      PlaylistMode.single => PlaylistMode.none,
    };
    audioPlayer.setLoopMode(newMode);
  }

  IconData _getLoopIcon(PlaylistMode mode) {
    return switch (mode) {
      PlaylistMode.single => Icons.repeat_one,
      PlaylistMode.loop => Icons.repeat,
      PlaylistMode.none => Icons.repeat,
    };
  }

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

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
