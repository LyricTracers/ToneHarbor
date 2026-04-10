import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class _PlaylistItem extends HookConsumerWidget {
  const _PlaylistItem({
    required this.index,
    required this.track,
    required this.isDefault,
    required this.colorScheme,
    required this.i10n,
    required this.onTap,
    required this.onDeleteTap,
  });

  final int index;
  final ToneHarborTrackObject track;
  final bool isDefault;
  final ColorScheme colorScheme;
  final AppLocalizations i10n;
  final VoidCallback onTap;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isPressed = useState(false);
    var isHovered = useState(false);
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: colorScheme.primaryContainer,
            onPressed: (contex) => onDeleteTap(),
          ),
          SlidableAction(
            onPressed: (ctx) => copyToClipboard(
              '${track.title}-${track.artist}',
              ctx,
              colorScheme.secondary,
            ),
            backgroundColor: colorScheme.tertiaryContainer,
            icon: Icons.copy_rounded,
          ),
        ],
      ),
      child: MouseRegion(
        onEnter: (event) => isHovered.value = true,
        onExit: (event) => isHovered.value = false,
        child: Container(
          height: 35,
          color: isPressed.value || isHovered.value
              ? colorScheme.outline.withValues(alpha: .1)
              : Colors.transparent,
          child: Stack(
            children: [
              if (isDefault)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      i10n.playing,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTapDown: (details) => isPressed.value = true,
                      onTapUp: (details) => isPressed.value = false,
                      onTapCancel: () => isPressed.value = false,
                      onTap: () {
                        isPressed.value = false;
                        onTap();
                      },
                      onDoubleTap: () {
                        isPressed.value = false;
                        onTap();
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 25),
                          Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: SmartMarquee(
                              text: track.title,
                              style: TextStyle(
                                fontSize: 14,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              manualScrollOnTap: true,
                              alignment: AlignmentGeometry.centerLeft,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 80,
                            child: Text(
                              track.artist,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.onSurfaceVariant.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),

                  ReorderableDragStartListener(
                    index: index,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.drag_handle, size: 16),
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaylistPage extends HookConsumerWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final i10n = ref.watch(l10nProvider);
    final playlist = ref.watch(audioPlayerStateProvider);
    final shuffled =
        useStream(audioPlayer.shuffledStream).data ?? audioPlayer.isShuffled;
    final scrollController = useScrollController();
    final lastScrollIndex = useState<int?>(null);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!scrollController.hasClients ||
            !scrollController.position.hasViewportDimension) {
          return;
        }

        final selectedIndex = playlist.currentIndex;

        if (lastScrollIndex.value == selectedIndex) {
          return;
        }

        final selectedPosition = selectedIndex * 44;
        final currentPosition = scrollController.offset;
        final viewportHeight = scrollController.position.viewportDimension;
        final visibleEnd = currentPosition + viewportHeight;

        if (selectedPosition < currentPosition ||
            selectedPosition > visibleEnd - 44) {
          scrollController.jumpTo(selectedPosition.toDouble());
          lastScrollIndex.value = selectedIndex;
        }
      });
      return null;
    }, [playlist.currentIndex]);
    final size = MediaQuery.of(context).size;
    var width = size.width;
    var targetWidth = 0.0;
    if (size.xlAndUp) {
      targetWidth = width * 0.35;
    } else if (size.isLg) {
      targetWidth = width * 0.45;
    } else if (size.isMd) {
      targetWidth = width * 0.55;
    } else {
      targetWidth = double.infinity;
    }
    final loopMode =
        useStream(audioPlayer.loopModeStream).data ?? audioPlayer.loopMode;
    return SafeArea(
      child: Container(
        width: targetWidth,
        color: colorScheme.surface.withValues(alpha: 0.8),
        height: double.infinity,
        child: Column(
          children: [
            AppBar(
              toolbarHeight: kToolbarHeight * size.multiplier3,
              title: Text(
                i10n.playlist_text.replaceFirst(
                  '%s',
                  '${playlist.tracks.length}',
                ),
                style: TextStyle(
                  fontSize: 16 * size.multiplier2,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    audioPlayer.clearPlaylist();
                  },
                  icon: Icon(Icons.delete_sweep_rounded, size: 18),
                  tooltip: i10n.clear_all,
                ),
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
                IconButton(
                  icon: Icon(
                    _getLoopIcon(loopMode),
                    size: 18,
                    color: loopMode != PlaylistMode.none
                        ? colorScheme.primary
                        : null,
                  ),
                  onPressed: () => _toggleLoopMode(loopMode),
                ),
              ],
              centerTitle: false,
              backgroundColor: colorScheme.tertiary.withValues(alpha: 0.1),
            ),
            Expanded(
              child: SlidableAutoCloseBehavior(
                child: ReorderableListView.builder(
                  scrollController: scrollController,
                  itemCount: playlist.tracks.length,
                  itemExtent: 44,
                  cacheExtent: 50,
                  buildDefaultDragHandles: false,
                  onReorder: (oldIndex, newIndex) {
                    ref
                        .read(audioPlayerStateProvider.notifier)
                        .moveTrack(oldIndex, newIndex);
                  },
                  itemBuilder: (context, index) {
                    var isDefault = playlist.currentIndex == index;
                    var track = playlist.tracks[index];
                    return RepaintBoundary(
                      key: ValueKey(index),
                      child: _PlaylistItem(
                        index: index,
                        track: track,
                        isDefault: isDefault,
                        colorScheme: colorScheme,
                        i10n: i10n,
                        onTap: () {
                          logger.i("track: $track");
                          audioPlayer.jumpTo(index);
                        },
                        onDeleteTap: () {
                          ref
                              .read(audioPlayerStateProvider.notifier)
                              .removeTrack(track.id, index: index);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
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
}
