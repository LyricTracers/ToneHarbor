import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/widgets.dart';

class _PlaylistItem extends StatelessWidget {
  const _PlaylistItem({
    required this.index,
    required this.track,
    required this.isDefault,
    required this.colorScheme,
    required this.playingText,
    required this.deleteText,
    required this.onTap,
    required this.onDelete,
  });

  final int index;
  final dynamic track;
  final bool isDefault;
  final ColorScheme colorScheme;
  final String playingText;
  final String deleteText;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
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
                  playingText,
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
            title: Row(
              children: [
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
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_rounded, size: 16),
              onPressed: onDelete,
              tooltip: onDelete == null ? null : deleteText,
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
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.35,
      color: colorScheme.surface.withValues(alpha: 0.8),
      height: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  i10n.playlist_text.replaceFirst(
                    '%s',
                    '${playlist.tracks.length}',
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurfaceVariant,
                  ),
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
              ],
            ),
          ),
          Divider(thickness: 2, height: 2, indent: 5, endIndent: 5),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: playlist.tracks.length,
              itemExtent: 44,
              cacheExtent: 50,
              addAutomaticKeepAlives: true,
              itemBuilder: (context, index) {
                var isDefault = playlist.currentIndex == index;
                var track = playlist.tracks[index];
                return RepaintBoundary(
                  child: _PlaylistItem(
                    index: index,
                    track: track,
                    isDefault: isDefault,
                    colorScheme: colorScheme,
                    playingText: i10n.playing,
                    deleteText: i10n.delete,
                    onTap: () => audioPlayer.jumpTo(index),
                    onDelete: () => ref
                        .read(audioPlayerStateProvider.notifier)
                        .removeTrack(track.id, index: index),
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
