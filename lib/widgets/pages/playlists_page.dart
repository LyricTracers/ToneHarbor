import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/playlist_list.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';
import 'package:toneharbor/widgets/components/common_search_field.dart';

class _PlaylistItemWidget extends HookConsumerWidget {
  final List<PlaylistInfo> playlists;
  final ColorScheme colorScheme;
  final int index;
  final bool isFavorite;
  final AppLocalizations l10n;
  final double multiplier;

  const _PlaylistItemWidget({
    required this.index,
    required this.playlists,
    required this.colorScheme,
    required this.isFavorite,
    required this.l10n,
    required this.multiplier,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isHovered = useState(false);
    double itemHeight = 44.0 * multiplier;
    var playlistItem = playlists[index];
    var personalState = playlistItem.library == "personal";
    var isPressed = useState(false);
    useEffect(() {
      return () {
        isPressed.value = false;
      };
    }, []);
    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Stack(
        children: [
          if (isFavorite)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6 * multiplier,
                  vertical: 2 * multiplier,
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
                    fontSize: 8 * multiplier,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Container(
            height: itemHeight,
            color: isHovered.value || isPressed.value
                ? colorScheme.outline.withValues(alpha: .1)
                : Colors.transparent,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: (details) => isPressed.value = true,
              onTapUp: (details) => isPressed.value = false,
              onTapCancel: () => isPressed.value = false,
              onTap: () async {
                context.pushWrapper(
                  "/playlist_song/${Uri.encodeComponent(playlistItem.name)}",
                  extra: playlistItem.id,
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20 * multiplier,
                  vertical: 4 * multiplier,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 14 * multiplier,
                        color: colorScheme.primary,
                      ),
                    ),
                    SizedBox(width: 15 * multiplier),
                    ...[
                      Icon(
                        personalState
                            ? Icons.folder_open_rounded
                            : Icons.folder_shared_rounded,
                        size: 20 * multiplier,
                      ),
                      SizedBox(width: 10 * multiplier),
                      Expanded(
                        flex: 1,
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          playlistItem.name,
                          style: TextStyle(fontSize: 16 * multiplier),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
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
    TextEditingController searchController,
    Size size,
  ) {
    final l10n = ref.watch(l10nProvider);
    final showSearch = useState(false);
    useEffect(() {
      showSearch.value = false;
      searchController.clear();
      return null;
    }, [size.lgAndUp]);
    final toolbarHeight = kToolbarHeight * size.multiplier3;
    return showSearch.value
        ? AppBar(
            leading: IconButton(
              onPressed: () {
                showSearch.value = false;
                searchController.clear();
              },
              icon: Icon(Icons.arrow_back_ios_sharp),
            ),
            toolbarHeight: toolbarHeight,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            actions: [
              CommonSearchField(
                searchController: searchController,
                autofocus: true,
              ),
              SizedBox(width: 16),
            ],
          )
        : AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            toolbarHeight: toolbarHeight,
            title: Row(
              children: [
                Text(
                  l10n.playlists,
                  style: TextStyle(
                    fontSize: 16 * size.multiplier2,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                if (total > 0)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      " ${l10n.total_albums.replaceFirst("%s", total.toString())}",
                      style: TextStyle(
                        fontSize: 12 * size.multiplier2,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            actions: [
              size.lgAndUp
                  ? CommonSearchField(searchController: searchController)
                  : IconButton(
                      onPressed: () {
                        showSearch.value = true;
                        searchController.clear();
                      },
                      icon: const Icon(Icons.search, size: 18),
                    ),
              if (size.lgAndUp)
                IconButton(
                  onPressed: () {
                    context.pushWrapper("/setting");
                  },
                  icon: const Icon(Icons.settings_rounded, size: 18),
                  tooltip: l10n.settings,
                ),
            ],
            centerTitle: false,
          );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorScheme = getColorSchemeWhenReady(ref);
    final scrollController = useScrollController();
    final searchController = useTextEditingController();
    final searchQuery = useSearchQuery(searchController);
    final l10n = ref.watch(l10nProvider);
    var playlistsState = ref.watch(baseProvider);
    final playlists = playlistsState.value?.data?.playlists ?? [];
    final total = playlistsState.value?.data?.total ?? 0;
    final favoritePlaylistsState = ref.watch(favoritePlaylistStateProvider);

    final isLoadingMore = useState(false);
    final nameController = useTextEditingController();

    final filteredItems = useMemoized(() {
      if (searchQuery.isEmpty) {
        return playlists;
      }
      final query = searchQuery.toLowerCase();
      return playlists.where((playlist) {
        final name = playlist.name.toLowerCase();
        return name.contains(query);
      }).toList();
    }, [playlists, searchQuery]);

    final displayHasMore = searchQuery.isEmpty && playlists.length < total;

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        final state = ref.read(baseProvider);
        final currentPlaylists = state.value?.data?.playlists ?? [];
        final currentTotal = state.value?.data?.total ?? 0;
        final currentHasMore = currentPlaylists.length < currentTotal;

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

    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        _buildAppBar(context, ref, colorScheme, total, searchController, size),
        Expanded(
          child: playlistsState.when(
            data: (data) {
              if (filteredItems.isEmpty) {
                return const Center(child: Text('No playlists'));
              }
              return ListView.builder(
                controller: scrollController,
                itemCount: filteredItems.length + (displayHasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == filteredItems.length) {
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
                  final isFavorite = favoritePlaylistsState.containsPlaylistId(
                    filteredItems[index].id,
                  );

                  return ContextMenuRegion(
                    contextMenu: ContextMenu(
                      entriesBuilder: () {
                        var playlistId = filteredItems[index].id;
                        var title = filteredItems[index].name;
                        var personalState =
                            filteredItems[index].library == "personal";
                        var favoritePlaylistNotifier = ref.read(
                          favoritePlaylistStateProvider.notifier,
                        );
                        final isFavorite = favoritePlaylistNotifier
                            .isFavoritePlaylist(playlistId);
                        return <ContextMenuEntry>[
                          MenuHeader(text: filteredItems[index].name),
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
                                context,
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
                                  context,
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
                      playlists: filteredItems,
                      colorScheme: colorScheme,
                      isFavorite: isFavorite,
                      l10n: l10n,
                      multiplier: size.multiplier3,
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: AudioEqualizerLoader()),
            error: (error, s) => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
