import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_station/album.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/common_shimmer_loader.dart';
import 'package:toneharbor/widgets/widgets.dart';

class AlbumPage extends HookConsumerWidget {
  final $AsyncNotifierProvider<ExtraProvider<AlbumResponse>, AlbumResponse>
  baseProvider;
  final String title;
  const AlbumPage({super.key, required this.baseProvider, required this.title});

  PreferredSizeWidget _buildAppBar(
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
            backgroundColor: size.lgAndUp
                ? colorScheme.tertiary.withValues(alpha: 0.1)
                : Colors.transparent,
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
            toolbarHeight: toolbarHeight,
            backgroundColor: size.lgAndUp
                ? colorScheme.tertiary.withValues(alpha: 0.1)
                : Colors.transparent,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            title: Row(
              children: [
                Text(
                  l10n.albums,
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
            centerTitle: false,
            actions: [
              size.lgAndUp
                  ? CommonSearchField(searchController: searchController)
                  : IconButton(
                      onPressed: () {
                        showSearch.value = true;
                        searchController.clear();
                      },
                      icon: Icon(Icons.search, size: 18),
                    ),
              IconButton(
                onPressed: () async {
                  var direction = ref
                      .read(baseProvider.notifier)
                      .extraSortDirection;
                  await ref
                      .read(baseProvider.notifier)
                      .setSort(
                        sortBy: "name",
                        sortDirection: direction == "ASC" ? "DESC" : "ASC",
                      );
                },
                icon: const Icon(Icons.sort, size: 18),
                tooltip: l10n.sort,
              ),
              if (size.lgAndUp)
                IconButton(
                  onPressed: () {
                    ref.context.pushWrapper("/setting");
                  },
                  icon: const Icon(Icons.settings_rounded, size: 18),
                  tooltip: l10n.settings,
                ),
            ],
          );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final searchController = useTextEditingController();
    final searchQuery = useSearchQuery(searchController);
    final albums = ref.watch(baseProvider);
    var total = albums.value?.data?.total ?? 0;
    final albumItems = albums.value?.data?.albums ?? [];
    final hasMore = albumItems.length < total;
    final isLoadingMore = useState(false);
    final scrollController = useScrollController();

    final filteredItems = useMemoized(() {
      if (searchQuery.isEmpty) {
        return albumItems;
      }
      final query = searchQuery.toLowerCase();
      return albumItems.where((album) {
        final name = album.name?.toLowerCase() ?? '';
        final artist =
            album.displayArtist?.toLowerCase() ??
            album.artist?.toLowerCase() ??
            '';
        return name.contains(query) || artist.contains(query);
      }).toList();
    }, [albumItems, searchQuery]);

    final displayHasMore = searchQuery.isEmpty && hasMore;

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        final state = ref.read(baseProvider);
        final currentAlbums = state.value?.data?.albums ?? [];
        var currentTotal = state.value?.data?.total ?? 0;

        final currentHasMore = currentAlbums.length < currentTotal;

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
    return Column(
      children: [
        _buildAppBar(ref, colorScheme, total, searchController, size),
        Expanded(
          child: albums.when(
            data: (data) {
              if (filteredItems.isEmpty) {
                return const Center(child: Text('No albums'));
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  controller: scrollController,
                  itemCount: filteredItems.length + (displayHasMore ? 1 : 0),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    if (index == filteredItems.length) {
                      return Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final album = filteredItems[index];
                    return _AlbumItem(album: album, colorScheme: colorScheme);
                  },
                ),
              );
            },
            loading: () => CommonShimmerLoader.albumGrid(
              colorScheme: colorScheme,
              size: size,
            ),
            error: (error, stackTrace) {
              return buildErrorView(context, ref, colorScheme, () {});
            },
          ),
        ),
      ],
    );
  }
}

class _AlbumItem extends StatelessWidget {
  const _AlbumItem({required this.album, required this.colorScheme});

  final AlbumItem album;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final albumName = (album.name?.isNotEmpty == true)
        ? album.name!
        : 'Unknown Album';
    final artistName = (album.displayArtist?.isNotEmpty == true)
        ? album.displayArtist!
        : (album.artist?.isNotEmpty == true)
        ? album.artist!
        : 'Unknown Artist';

    return InkWell(
      onTap: () {
        var tempAlbumName = albumName;
        var tempArtistName = artistName;
        if (albumName == "Unknown Album") tempAlbumName = "";
        if (artistName == "Unknown Artist") tempArtistName = "";
        context.pushWrapper(
          "/songs/${Uri.encodeComponent(albumName)}",
          extra: (
            albumSongsProvider(
              album: tempAlbumName,
              albumArtist: tempArtistName,
            ),
            -1,
            SongsPageSortAction.titleName,
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final coverSize = constraints.maxWidth;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: SongCoverImage(
                  songId: "",
                  albumName: albumName,
                  artistName: artistName,
                  colorScheme: colorScheme,
                  config: SongCoverImageConfig(
                    size: coverSize,
                    borderRadius: 12,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      albumName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      artistName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
