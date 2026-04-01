import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/folder.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';
import 'package:toneharbor/widgets/components/bread_crumb_clipper.dart';
import 'package:toneharbor/widgets/components/common_search_field.dart';
import 'package:toneharbor/widgets/components/song_context_menu.dart';
import 'package:toneharbor/widgets/components/song_item.dart';
import 'package:toneharbor/widgets/components/sub_song_selection_bottom.dart';
import 'package:toneharbor/widgets/components/sub_song_selection_top.dart';

class _FolderItemWidget extends HookConsumerWidget {
  final List<ToneHarborTrackObject> folderItems;
  final ColorScheme colorScheme;
  final int index;
  final List<ToneHarborTrackObject> lastFoldItems;
  final SongSelectionState songSelectionState;
  const _FolderItemWidget({
    required this.index,
    required this.folderItems,
    required this.colorScheme,
    required this.lastFoldItems,
    required this.songSelectionState,
  });
  static const double itemHeightFolder = 44.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isHovered = useState(false);
    var folderItem = folderItems[index];
    var isPressed = useState(false);
    useEffect(() {
      return () {
        isPressed.value = false;
      };
    }, []);
    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Container(
        height: itemHeightFolder,
        color: isHovered.value || isPressed.value
            ? colorScheme.outline.withValues(alpha: .1)
            : Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (details) => isPressed.value = true,
          onTapUp: (details) => isPressed.value = false,
          onTapCancel: () => isPressed.value = false,
          onTap: () async {
            if (!songSelectionState.selectionType) {
              context.push(
                "/folders/${folderItem.id}",
                extra: (
                  foldersProvider(limit: 100, id: folderItem.id),
                  [...lastFoldItems, folderItem],
                ),
              );
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
                Icon(Icons.folder_rounded, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Text(folderItem.title, style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BreadCrumbItem extends HookConsumerWidget {
  final Function() onTap;
  final BreadcrumbType crumbType;
  final String title;
  final Color titleColor;
  final Color hoverTitleColor;
  final ColorScheme colorScheme;
  final double arrowWidth;
  final double multiplier;
  const _BreadCrumbItem({
    required this.onTap,
    required this.crumbType,
    required this.title,
    required this.titleColor,
    required this.hoverTitleColor,
    required this.colorScheme,
    required this.arrowWidth,
    required this.multiplier,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isHovered = useState(false);
    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: InkWell(
        onTap: onTap,
        child: ClipPath(
          clipper: BreadcrumbClipper(type: crumbType, arrowWidth: arrowWidth),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * multiplier,
              vertical: 5 * multiplier,
            ),
            color: colorScheme.outline.withValues(alpha: 0.3),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14 * multiplier,
                fontWeight: isHovered.value
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: isHovered.value ? hoverTitleColor : titleColor,
              ),
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
  final List<ToneHarborTrackObject> lastFoldItems;
  final $AsyncNotifierProvider<T, FolderResponse> baseProvider;
  const FoldersPage({
    super.key,
    required this.currentId,
    required this.baseProvider,
    required this.lastFoldItems,
  });

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    WidgetRef ref,
    ColorScheme colorScheme,
    int total,
    TextEditingController searchController,
    Size size,
  ) {
    final l10n = ref.watch(l10nProvider);
    double arrowWidth = 12;
    final showSearch = useState(false);
    useEffect(() {
      showSearch.value = false;
      searchController.clear();
      return null;
    }, [size.lgAndUp]);
    final toolbarHeight = 56 * size.multiplier3;
    final color = colorScheme.tertiary.withValues(alpha: 0.1);
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
            backgroundColor: color,
            actions: [
              CommonSearchField(
                searchController: searchController,
                autofocus: true,
              ),
              SizedBox(width: 16),
            ],
          )
        : AppBar(
            backgroundColor: color,
            toolbarHeight: toolbarHeight,
            title: Row(
              children: [
                if (lastFoldItems.isEmpty)
                  Text(
                    l10n.folder,
                    style: TextStyle(
                      fontSize: 16 * size.multiplier2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (lastFoldItems.isNotEmpty) ...[
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(lastFoldItems.length + 1, (index) {
                            Widget item;
                            if (index == 0) {
                              item = _BreadCrumbItem(
                                onTap: () {
                                  context.push(
                                    "/folders/None",
                                    extra: (
                                      foldersProvider(limit: 100),
                                      <ToneHarborTrackObject>[],
                                    ),
                                  );
                                },
                                crumbType: BreadcrumbType.first,
                                title: l10n.folder,
                                titleColor: colorScheme.onSurface,
                                hoverTitleColor: colorScheme.primary,
                                colorScheme: colorScheme,
                                arrowWidth: arrowWidth,
                                multiplier: size.multiplier2,
                              );
                            } else if (index == lastFoldItems.length) {
                              item = _BreadCrumbItem(
                                onTap: () {},
                                crumbType: BreadcrumbType.last,
                                title: lastFoldItems[index - 1].title,
                                titleColor: colorScheme.secondary,
                                hoverTitleColor: colorScheme.primary,
                                colorScheme: colorScheme,
                                arrowWidth: arrowWidth,
                                multiplier: size.multiplier2,
                              );
                            } else {
                              item = _BreadCrumbItem(
                                onTap: () {
                                  context.push(
                                    "/folders/${lastFoldItems[index - 1].id}",
                                    extra: (
                                      foldersProvider(
                                        limit: 100,
                                        id: lastFoldItems[index - 1].id,
                                      ),
                                      [...lastFoldItems.sublist(0, index)],
                                    ),
                                  );
                                },
                                crumbType: BreadcrumbType.middle,
                                title: lastFoldItems[index - 1].title,
                                titleColor: colorScheme.onSurface,
                                hoverTitleColor: colorScheme.primary,
                                colorScheme: colorScheme,
                                arrowWidth: arrowWidth,
                                multiplier: size.multiplier2,
                              );
                            }

                            if (index != 0) {
                              item = Transform.translate(
                                offset: Offset(-arrowWidth / 2 * index, 0),
                                child: item,
                              );
                            }
                            return item;
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
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
              if (size.lgAndUp) ...[
                IconButton(
                  onPressed: () async {
                    var direction = ref
                        .read(baseProvider.notifier)
                        .extraSortDirection;
                    await ref
                        .read(baseProvider.notifier)
                        .setSort(
                          sortBy: "title",
                          sortDirection: direction == "ASC" ? "DESC" : "ASC",
                        );
                  },
                  icon: const Icon(Icons.sort, size: 18),
                  tooltip: l10n.sort,
                ),
                IconButton(
                  onPressed: () {
                    ref.read(songSelectionProvider.notifier).toggle();
                  },
                  icon: const Icon(Icons.fact_check_rounded, size: 18),
                  tooltip: l10n.select_all,
                ),
                IconButton(
                  onPressed: () {
                    context.push("/setting");
                  },
                  icon: const Icon(Icons.settings_rounded, size: 18),
                  tooltip: l10n.settings,
                ),
              ],
              if (!size.lgAndUp) ...[
                InkWell(
                  customBorder: const CircleBorder(),
                  onTapDown: (details) async {
                    await showCustomMenu<void>(
                      context: ref.context,
                      globalPosition: details.globalPosition,
                      items: [
                        getActionMenuItem(
                          () async {
                            var direction = ref
                                .read(baseProvider.notifier)
                                .extraSortDirection;
                            await ref
                                .read(baseProvider.notifier)
                                .setSort(
                                  sortBy: "title",
                                  sortDirection: direction == "ASC"
                                      ? "DESC"
                                      : "ASC",
                                );
                          },
                          l10n.sort,
                          Icons.sort,
                        ),
                        getActionMenuItem(
                          () {
                            ref.read(songSelectionProvider.notifier).toggle();
                          },
                          l10n.select_all,
                          Icons.fact_check_rounded,
                        ),
                        getActionMenuItem(
                          () {
                            context.go("/");
                          },
                          l10n.music_house,
                          Icons.home,
                        ),
                      ],
                    );
                  },
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.more_vert, size: 18),
                  ),
                ),
              ],
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
    var folderResponse = ref.watch(baseProvider);
    var total = folderResponse.value?.data?.total ?? 0;
    final folderItems =
        (folderResponse.value?.data?.items)?.asTrackList() ?? [];
    final hasMore = folderItems.length < total;
    final isLoadingMore = useState(false);
    final l10n = ref.watch(l10nProvider);
    final activeTrack = ref.watch(audioPlayerStateProvider).activeTrack;
    final activeSongId = activeTrack?.id;
    final songRating = ref.watch(songRatingProvider);
    final songSelectionState = ref.watch(
      songSelectionProvider.select(
        (state) => SongSelectionState(
          selectionType: state.selectionType,
          ids: {},
          boxState: state.boxState,
        ),
      ),
    );
    useEffect(() {
      Future.microtask(() {
        ref.invalidate(songSelectionProvider);
      });
      return null;
    }, []);

    final filteredItems = useMemoized(() {
      if (searchQuery.isEmpty) {
        return folderItems;
      }
      final query = searchQuery.toLowerCase();
      return folderItems.where((item) {
        if (item.isSong) {
          final song = item as ToneHarborTrackObjectFull;
          return song.title.toLowerCase().contains(query) ||
              song.artist.toLowerCase().contains(query);
        } else {
          return item.title.toLowerCase().contains(query);
        }
      }).toList();
    }, [folderItems, searchQuery]);

    final displayHasMore = searchQuery.isEmpty && hasMore;

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
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier2;

    return Column(
      children: [
        if (songSelectionState.selectionType)
          SubSongSelectionTop(songs: filteredItems),
        if (!songSelectionState.selectionType)
          _buildAppBar(
            context,
            ref,
            colorScheme,
            total,
            searchController,
            size,
          ),
        Expanded(
          child: folderResponse.when(
            data: (data) {
              if (filteredItems.isEmpty) {
                return const Center(child: Text('No folders'));
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
                  var folderItem = filteredItems[index];
                  if (!folderItem.isSong) {
                    return _FolderItemWidget(
                      index: index,
                      folderItems: filteredItems,
                      colorScheme: colorScheme,
                      lastFoldItems: lastFoldItems,
                      songSelectionState: songSelectionState,
                    );
                  } else {
                    var item = folderItem;
                    return RepaintBoundary(
                      child: ContextMenuRegion(
                        contextMenu: ContextMenu(
                          entriesBuilder: () => SongContextMenu.build(
                            ref,
                            colorScheme,
                            l10n,
                            size,
                            item,
                          ),
                          padding: const EdgeInsets.all(8.0),
                        ),
                        child: SongItem(
                          key: ValueKey(folderItem.id),
                          index: index,
                          song: item,
                          activeSongId: activeSongId,
                          colorScheme: colorScheme,
                          selectionState: songSelectionState,
                          l10n: l10n,
                          isFavorite: songRating.contains(item.id),
                          multiplier: multiplier,
                          onTap: () async {
                            final (trackList, targetIndex) = filteredItems
                                .asTrackSongList(index);
                            await ref
                                .read(audioPlayerStateProvider.notifier)
                                .load(
                                  trackList,
                                  initialIndex: targetIndex,
                                  autoPlay: true,
                                );
                            if (context.mounted) {
                              context.push("/playing_detail");
                            }
                          },
                        ),
                      ),
                    );
                  }
                },
              );
            },
            loading: () => const Center(child: AudioEqualizerLoader()),
            error: (error, stackTrace) {
              return buildErrorView(context, ref, colorScheme, () {});
            },
          ),
        ),
        if (songSelectionState.selectionType)
          SubSongSelectionBottom(songs: filteredItems),
      ],
    );
  }
}
