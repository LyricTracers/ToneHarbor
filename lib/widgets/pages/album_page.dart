import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_station/album.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/pages/songs_page.dart';
import 'package:toneharbor/widgets/widgets.dart';

class AlbumPage extends HookConsumerWidget {
  final $AsyncNotifierProvider<Albums, AlbumResponse> baseProvider;
  const AlbumPage({super.key, required this.baseProvider});

  PreferredSizeWidget _buildAppBar(
    WidgetRef ref,
    ColorScheme colorScheme,
    int total,
  ) {
    final l10n = ref.watch(l10nProvider);
    return AppBar(
      title: Text(
        l10n.albums,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
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
          onPressed: () async {
            var direction = ref.read(baseProvider.notifier).extraSortDirection;
            await ref
                .read(baseProvider.notifier)
                .setSort(
                  sortBy: "name",
                  sortDirection: direction == "ASC" ? "DESC" : "ASC",
                );
          },
          icon: Icon(Icons.sort, size: 18),
          tooltip: l10n.sort,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_rounded, size: 18),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final albums = ref.watch(baseProvider);
    var total = albums.value?.data?.total ?? 0;
    final albumItems = albums.value?.data?.albums ?? [];
    final hasMore = albumItems.length < total;
    final isLoadingMore = useState(false);
    final scrollController = useScrollController();
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

    return Column(
      children: [
        _buildAppBar(ref, colorScheme, total),
        Expanded(
          child: albums.when(
            data: (data) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  controller: scrollController,
                  itemCount: albumItems.length + (hasMore ? 1 : 0),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    if (index == albumItems.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final album = albumItems[index];
                    return _AlbumItem(album: album, colorScheme: colorScheme);
                  },
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
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
        context.push(
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
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
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
                    const SizedBox(height: 4),
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
