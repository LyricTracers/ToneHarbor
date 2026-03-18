import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/playlist_list.dart';
import 'package:toneharbor/models/audio_station/sorted_playlist_state.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';
import 'package:toneharbor/widgets/pages/songs_page.dart';

class _PlaylistItemWidget extends HookConsumerWidget {
  final List<PlaylistInfo> playlists;
  final ColorScheme colorScheme;
  final int index;

  const _PlaylistItemWidget({
    required this.index,
    required this.playlists,
    required this.colorScheme,
  });
  static const double itemHeight = 44.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isHovered = useState(false);
    var playlistItem = playlists[index];
    var personalState = playlistItem.library == "personal";
    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Container(
        height: itemHeight,
        color: isHovered.value
            ? colorScheme.outline.withValues(alpha: .1)
            : Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            context.push(
              "/songs/${Uri.encodeComponent(playlistItem.name)}",
              extra: (
                playlistDetailProvider(id: playlistItem.id),
                -1,
                SongsPageSortAction.all,
              ),
            );
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
                ...[
                  Icon(
                    personalState
                        ? Icons.folder_open_rounded
                        : Icons.folder_shared_rounded,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Text(
                      playlistItem.name,
                      style: TextStyle(fontSize: 16),
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

class PlaylistsPage<T extends ExtraProvider<PlaylistListResponse>>
    extends HookConsumerWidget {
  final $AsyncNotifierProvider<T, PlaylistListResponse> baseProvider;
  const PlaylistsPage({super.key, required this.baseProvider});

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    WidgetRef ref,
    ColorScheme colorScheme,
    int total,
  ) {
    final l10n = ref.watch(l10nProvider);
    return AppBar(
      title: Row(
        children: [
          Text(
            l10n.playlists,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          if (total > 0)
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                " ${l10n.total_albums.replaceFirst("%s", total.toString())}",
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      actions: [
        Container(
          constraints: BoxConstraints(maxWidth: 200, maxHeight: 35),
          child: SearchAnchor.bar(
            suggestionsBuilder: (context, ref) => [],
            barHintStyle: WidgetStateProperty.all(TextStyle(fontSize: 14)),
            barHintText: l10n.searchHint,
            barLeading: Icon(Icons.search, size: 18),
          ),
        ),
        SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_rounded, size: 18),
        ),
      ],
      centerTitle: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorScheme = getColorSchemeWhenReady(ref);
    final scrollController = useScrollController();
    final l10n = ref.watch(l10nProvider);
    var sortedPlayList = ref.watch(
      sortedPlaylistProvider(baseProvider: baseProvider),
    );
    var total = 0;
    if (sortedPlayList is SortedPlaylistStateData) {
      total = sortedPlayList.total;
    }

    final isLoadingMore = useState(false);
    final nameController = useTextEditingController();
    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        final currentSortedPlayList = ref.read(
          sortedPlaylistProvider(baseProvider: baseProvider),
        );

        if (currentSortedPlayList is SortedPlaylistStateData) {
          final currentHasMore =
              currentSortedPlayList.playlists.length <
              currentSortedPlayList.total;
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
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

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

    void callBackDeletePlayLists(String id) async {
      try {
        ref.read(requestFlagProvider.notifier).setRequestFlag(true);
        var result = await ref
            .read(playlistStateProvider.notifier)
            .deletePlaylist(id: id);
        if (result.success) {
          ref
              .read(favoritePlaylistStateProvider.notifier)
              .removeFavoritePlaylist(id);
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

    return Column(
      children: [
        _buildAppBar(context, ref, colorScheme, total),
        Expanded(
          child: sortedPlayList.when(
            data: (data) {
              if (data.playlists.isEmpty) {
                return const Center(child: Text('No playlists'));
              }
              return ListView.builder(
                controller: scrollController,
                itemCount:
                    data.playlists.length +
                    (data.playlists.length < data.total ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == data.playlists.length) {
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
                  return ContextMenuRegion(
                    contextMenu: ContextMenu(
                      entriesBuilder: () {
                        var playlistId = data.playlists[index].id;
                        var title = data.playlists[index].name;
                        var personalState =
                            data.playlists[index].library == "personal";
                        var favoritePlaylistNotifier = ref.read(
                          favoritePlaylistStateProvider.notifier,
                        );
                        final isFavorite = favoritePlaylistNotifier
                            .isFavoritePlaylist(playlistId);
                        return <ContextMenuEntry>[
                          MenuHeader(text: data.playlists[index].name),
                          MenuDivider(),
                          MenuItem(
                            label: Text(
                              isFavorite
                                  ? l10n.no_favorite_playlist
                                  : l10n.favorite_playlist,
                            ),
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite_border_rounded
                                  : Icons.favorite_rounded,
                            ),
                            onSelected: (value) {
                              if (isFavorite) {
                                favoritePlaylistNotifier.removeFavoritePlaylist(
                                  playlistId,
                                );
                              } else {
                                favoritePlaylistNotifier.addFavoritePlaylist(
                                  playlistId,
                                  title,
                                );
                              }
                            },
                          ),
                          MenuItem(
                            label: Text(l10n.create_playlist),
                            icon: Icon(Icons.create_rounded),
                            onSelected: (value) {
                              showCreatePlaylistDialog(
                                ref,
                                nameController,
                                colorScheme,
                                callBackAddPlaylists,
                              );
                            },
                          ),
                          if (personalState)
                            MenuItem(
                              label: Text(l10n.delete_playlist),
                              icon: Icon(Icons.delete_rounded),
                              onSelected: (value) {
                                showDeletePlaylistDialog(
                                  ref,
                                  title,
                                  playlistId,
                                  colorScheme,
                                  callBackDeletePlayLists,
                                );
                              },
                            ),
                        ];
                      },
                      padding: const EdgeInsets.all(8.0),
                    ),
                    child: _PlaylistItemWidget(
                      index: index,
                      playlists: data.playlists,
                      colorScheme: colorScheme,
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: AudioEqualizerLoader()),
            error: () => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
