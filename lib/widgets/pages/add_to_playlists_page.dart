import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/playlist_list.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/excetions.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';

class AddToPlaylistsPage extends HookConsumerWidget {
  const AddToPlaylistsPage(this.songIds, {super.key});

  final List<String> songIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    var width = MediaQuery.of(context).size.width;

    final scrollController = useScrollController();

    final playlistsState = ref.watch(playlistResponseProvider());
    final playlists = playlistsState.value?.data?.playlists ?? [];
    final total = playlistsState.value?.data?.total ?? 0;
    final hasMore = playlists.length < total;
    final isLoadingMore = useState(false);

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        final state = ref.read(playlistResponseProvider());
        final currentPlaylists = state.value?.data?.playlists ?? [];
        final currentTotal = state.value?.data?.total ?? 0;
        final currentHasMore = currentPlaylists.length < currentTotal;

        if (currentScroll >= maxScroll * 0.8 &&
            currentHasMore &&
            !isLoadingMore.value) {
          loadMore(ref: ref, isLoadingMore: isLoadingMore);
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    var skipDuplicate = useState(true);

    return Stack(
      children: [
        Container(
          width: width * 0.35,
          color: colorScheme.surface.withValues(alpha: 0.8),
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Row(
                  children: [
                    Text(
                      i10n.add_to_playlists,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Expanded(child: SizedBox()),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.create_rounded, size: 18),
                      tooltip: i10n.create_playlist,
                    ),
                  ],
                ),
              ),
              Divider(thickness: 2, height: 2, indent: 5, endIndent: 5),
              Expanded(
                child: playlistsState.when(
                  data: (data) {
                    if (playlists.isEmpty) {
                      return Center(child: Text(i10n.no_playlists));
                    }

                    return ListView.builder(
                      controller: scrollController,
                      itemCount: playlists.length + (hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == playlists.length) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          );
                        }

                        final playlist = playlists[index];
                        return RepaintBoundary(
                          child: ListTile(
                            minTileHeight: 44,
                            contentPadding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
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
                                Icon(Icons.folder_rounded, size: 18),
                                SizedBox(width: 10),
                                Text(
                                  playlist.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),

                            onTap: () async {
                              ref
                                  .read(requestFlagProvider.notifier)
                                  .setRequestFlag(true);
                              try {
                                var result = await ref
                                    .read(playlistStateProvider.notifier)
                                    .addSongsToPlaylist(
                                      id: playlist.id,
                                      songIds: songIds,
                                      skipDuplicate: skipDuplicate.value,
                                    );
                                logger.i("result: $result");
                              } catch (e) {
                                logger.e("Error: $e");
                                if (context.mounted) {
                                  if (e is AudioStationException) {
                                    showSnackBar(
                                      e.message,
                                      context,
                                      colorScheme.error,
                                    );
                                  }
                                }
                              } finally {
                                ref
                                    .read(requestFlagProvider.notifier)
                                    .setRequestFlag(false);
                              }
                            },
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) =>
                      Center(child: Text(error.toString())),
                  loading: () => Center(
                    child: Transform.scale(
                      scale: 0.5,
                      child: const AudioEqualizerLoader(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              FilterChip(
                selected: skipDuplicate.value,
                label: Text("Skip Duplicate"),
                onSelected: (v) {
                  skipDuplicate.value = v;
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }

  static Future<void> loadMore({
    required WidgetRef ref,
    required ValueNotifier<bool> isLoadingMore,
  }) async {
    isLoadingMore.value = true;
    try {
      await ref.read(playlistResponseProvider().notifier).fetchMore();
    } finally {
      isLoadingMore.value = false;
    }
  }
}
