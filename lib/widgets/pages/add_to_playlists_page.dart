import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/excetions.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';

class AddToPlaylistsPage extends HookConsumerWidget {
  const AddToPlaylistsPage(this.songIds, {super.key});

  final String songIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    var width = MediaQuery.of(context).size.width;

    final scrollController = useScrollController();
    final nameController = useTextEditingController();

    final playlistsState = ref.watch(playlistResponseProvider());
    final playlists = playlistsState.value?.data?.playlists ?? [];
    final total = playlistsState.value?.data?.total ?? 0;
    final hasMore = playlists.length < total;
    final isLoadingMore = useState(false);
    final l10n = ref.watch(l10nProvider);
    final favoritePlaylistsState = ref.watch(favoritePlaylistStateProvider);
    final size = MediaQuery.of(context).size;
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
    void callBackAddPlaylists(String name) async {
      try {
        ref.read(requestFlagProvider.notifier).setRequestFlag(true);
        var result = await ref
            .read(playlistStateProvider.notifier)
            .createPlaylist(name: name);
        if (result.success) {
          await clearCacheByGroupKey(groupKey: "playlist");
          ref.invalidate(playlistResponseProvider);
        }
      } catch (e) {
        if (context.mounted) {
          if (e is AudioStationException) {
            showSnackBar(e.message, context, colorScheme.secondary);
          } else {
            showSnackBar(e.toString(), context, colorScheme.secondary);
          }
        }
      } finally {
        ref.read(requestFlagProvider.notifier).setRequestFlag(false);
      }
    }

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
    return Stack(
      children: [
        Container(
          width: targetWidth,
          color: colorScheme.surface.withValues(alpha: 0.8),
          height: double.infinity,
          child: Column(
            children: [
              AppBar(
                toolbarHeight: kToolbarHeight * size.multiplier3,
                title: Text(
                  i10n.add_to_playlists,
                  style: TextStyle(
                    fontSize: 16 * size.multiplier2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () async {
                      showCreatePlaylistDialog(
                        context,
                        ref,
                        nameController,
                        colorScheme,
                        callBackAddPlaylists,
                      );
                    },
                    icon: Icon(Icons.create_rounded, size: 18),
                    tooltip: i10n.create_playlist,
                  ),
                ],
                centerTitle: false,
                backgroundColor: colorScheme.tertiary.withValues(alpha: 0.1),
              ),

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
                        final isFavorite = favoritePlaylistsState
                            .containsPlaylistId(playlists[index].id);
                        var personalState =
                            playlists[index].library == "personal";
                        return RepaintBoundary(
                          child: Stack(
                            children: [
                              if (isFavorite)
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
                                      l10n.favorite,
                                      style: TextStyle(
                                        color: colorScheme.onPrimary,
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ListTile(
                                minTileHeight: 36,
                                contentPadding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                horizontalTitleGap: 10,
                                leading: IconButton(
                                  icon: Icon(
                                    personalState
                                        ? Icons.folder_open_rounded
                                        : Icons.folder_shared_rounded,
                                    size: 18,
                                  ),
                                  onPressed: () {},
                                  tooltip: '${index + 1}',
                                ),
                                title: Text(
                                  playlist.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () async {
                                  ref
                                      .read(requestFlagProvider.notifier)
                                      .setRequestFlag(true);
                                  try {
                                    var result = await ref
                                        .read(playlistStateProvider.notifier)
                                        .addSongToPlaylist(
                                          id: playlist.id,
                                          songId: songIds,
                                          skipDuplicate: skipDuplicate.value,
                                        );
                                    if (result.success) {
                                      await clearCacheByGroupKey(
                                        groupKey: "playlist",
                                      );
                                      ref.invalidate(playlistDetailProvider);
                                      ref.invalidate(songSelectionProvider);
                                      if (context.mounted) {
                                        showSnackBar(
                                          i10n.addsong_to_playlist_success
                                              .replaceFirst(
                                                "%s",
                                                playlist.name,
                                              ),
                                          context,
                                          colorScheme.secondary,
                                        );
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      showSnackBarError(
                                        e,
                                        context,
                                        colorScheme.secondary,
                                      );
                                    }
                                  } finally {
                                    ref
                                        .read(requestFlagProvider.notifier)
                                        .setRequestFlag(false);
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) =>
                      Center(child: Text(error.toString())),
                  loading: () => Center(
                    child: Transform.scale(
                      scale: 0.8,
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
      await ref.read(playlistResponseProvider().notifier).loadMore();
    } finally {
      isLoadingMore.value = false;
    }
  }
}
