import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/widgets.dart';

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
    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          if (isDefault)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 10, right: 10),
            horizontalTitleGap: 10,
            leading: Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            trailing: ReorderableDragStartListener(
              index: index,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: const Icon(Icons.drag_handle, size: 16),
              ),
            ),
            title: ContextMenuRegion<String>(
              contextMenu: ContextMenu(
                entriesBuilder: () => [
                  MenuHeader(text: track.title),
                  MenuDivider(),
                  MenuItem<String>(
                    label: Text(
                      i10n.delete,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    icon: const Icon(Icons.delete_forever),
                    onSelected: (value) {
                      ref
                          .read(audioPlayerStateProvider.notifier)
                          .removeTrack(track.id, index: index);
                    },
                  ),

                  MenuItem<String>(
                    label: Text(i10n.copy),
                    icon: const Icon(Icons.copy),
                    onSelected: (value) {
                      copyToClipboard(
                        '${track.title}-${track.artist}',
                        context,
                        colorScheme.secondary,
                      );
                    },
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
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
            selected: isDefault,
            onTap: onTap,
          ),
        ],
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
    return Container(
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
            ],
            centerTitle: false,
            backgroundColor: colorScheme.tertiary.withValues(alpha: 0.1),
          ),
          Expanded(
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
                    onTap: () => audioPlayer.jumpTo(index),
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
        ],
      ),
    );
  }
}
