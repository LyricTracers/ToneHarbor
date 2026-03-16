import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/folder.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';

class _FolderItemWidget extends HookConsumerWidget {
  final List<FolderItem> folderItems;
  final ColorScheme colorScheme;
  final int index;
  final List<FolderItem> lastFoldItems;
  const _FolderItemWidget({
    required this.index,
    required this.folderItems,
    required this.colorScheme,
    required this.lastFoldItems,
  });
  static const double itemHeightFolder = 44.0;
  static const double itemHeightSong = 66.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isHovered = useState(false);
    var folderItem = folderItems[index];
    var isFolder = folderItem.type == "folder";
    var bitrate = 0;
    String container = "";
    String artist = "";
    String album = "";
    var isFavorite = false;
    if (!isFolder) {
      isFavorite = folderItem.additional?.songRating?.rating == 5;
      bitrate = ((folderItem.additional?.songAudio?.bitrate ?? 0) / 1000)
          .round();
      container = folderItem.additional?.songAudio?.container ?? '';
      if (container.isEmpty) {
        container = 'mp3';
      }
      artist = folderItem.additional?.songTag?.artist ?? '';
      if (artist.isEmpty) {
        artist = folderItem.additional?.songTag?.albumArtist ?? '';
      }
      if (artist.isEmpty) {
        artist = 'Unknown Artist';
      }
      album = folderItem.additional?.songTag?.album ?? '';
      if (album.isEmpty) {
        album = 'Unknown Album';
      }
    }
    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Container(
        height: isFolder ? itemHeightFolder : itemHeightSong,
        color: isHovered.value
            ? colorScheme.outline.withValues(alpha: .1)
            : Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            logger.i("folderItem: $folderItem");
            if (isFolder) {
              context.push(
                "/folders/${folderItem.id}",
                extra: (
                  foldersProvider(limit: 100, id: folderItem.id),
                  [...lastFoldItems, folderItem],
                ),
              );
            } else {
              var (tracks, targetIndex) = folderItems.asTrackList(index);
              await ref
                  .read(audioPlayerStateProvider.notifier)
                  .load(tracks, initialIndex: targetIndex, autoPlay: true);
              if (context.mounted) context.push("/playing_detail");
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${index + 1}',
                  style: TextStyle(fontSize: 14, color: colorScheme.primary),
                ),
                const SizedBox(width: 15),
                if (isFolder) ...[
                  Icon(Icons.folder_rounded, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Text(
                      folderItem.title,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
                if (!isFolder) ...[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          folderItem.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '$container ${bitrate}k',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              '$artist-$album',
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    onPressed: () {
                      logger.i('isFavorite: $isFavorite');
                    },

                    icon: Icon(
                      isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      size: 18,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoldersPage<T extends ExtraProvider<FolderResponse>>
    extends HookConsumerWidget {
  final String currentId;
  final List<FolderItem> lastFoldItems;
  final $AsyncNotifierProvider<T, FolderResponse> baseProvider;
  const FoldersPage({
    super.key,
    required this.currentId,
    required this.baseProvider,
    required this.lastFoldItems,
  });

  PreferredSizeWidget _buildAppBar(
    WidgetRef ref,
    ColorScheme colorScheme,
    int total,
  ) {
    final l10n = ref.watch(l10nProvider);
    return AppBar(
      title: Row(
        children: [
          Text(
            l10n.folder,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorScheme = getColorSchemeWhenReady(ref);
    final scrollController = useScrollController();
    final l10n = ref.watch(l10nProvider);
    var folderResponse = ref.watch(baseProvider);
    var total = folderResponse.value?.data?.total ?? 0;
    final folderItems = folderResponse.value?.data?.items ?? [];
    final hasMore = folderItems.length < total;
    final isLoadingMore = useState(false);
    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        final state = ref.read(baseProvider);
        final currentFolderItems = state.value?.data?.items ?? [];
        var currentTotal = state.value?.data?.total ?? 0;

        final currentHasMore = currentFolderItems.length < currentTotal;

        if (currentScroll >= maxScroll * 0.8 &&
            currentHasMore &&
            !isLoadingMore.value) {
          loadMore(
            ref: ref,
            isLoadingMore: isLoadingMore,
            baseProvider: baseProvider,
          );
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);
    return Column(
      children: [
        _buildAppBar(ref, colorScheme, total),
        Expanded(
          child: folderResponse.when(
            data: (data) {
              if (folderItems.isEmpty) {
                return const Center(child: Text('No folders'));
              }
              return ListView.builder(
                controller: scrollController,
                itemCount: folderItems.length + (hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == folderItems.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    );
                  }
                  return _FolderItemWidget(
                    index: index,
                    folderItems: folderItems,
                    colorScheme: colorScheme,
                    lastFoldItems: lastFoldItems,
                  );
                },
              );
            },
            loading: () => const Center(child: AudioEqualizerLoader()),
            error: (error, stackTrace) {
              return buildErrorView(context, ref, colorScheme, () {});
            },
          ),
        ),
      ],
    );
  }
}
