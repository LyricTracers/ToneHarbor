import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_station/artist.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';
import 'package:toneharbor/widgets/components/common_search_field.dart';
import 'package:toneharbor/widgets/widgets.dart';

class ArtistPage extends HookConsumerWidget {
  final $AsyncNotifierProvider<Artists, ArtistResponse> baseProvider;
  const ArtistPage({super.key, required this.baseProvider});

  PreferredSizeWidget _buildAppBar(
    WidgetRef ref,
    ColorScheme colorScheme,
    int total,
    TextEditingController searchController,
  ) {
    final l10n = ref.watch(l10nProvider);
    return AppBar(
      title: Row(
        children: [
          Text(
            l10n.artist,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          if (total > 0)
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                " ${l10n.total_artists.replaceFirst("%s", total.toString())}",
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      centerTitle: false,
      actions: [
        CommonSearchField(searchController: searchController),
        const SizedBox(width: 16),
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
          icon: const Icon(Icons.sort, size: 18),
          tooltip: l10n.sort,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_rounded, size: 18),
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
    final artistItems = albums.value?.data?.artists ?? [];
    final hasMore = artistItems.length < total;
    final isLoadingMore = useState(false);
    final scrollController = useScrollController();

    final filteredItems = useMemoized(() {
      if (searchQuery.isEmpty) {
        return artistItems;
      }
      final query = searchQuery.toLowerCase();
      return artistItems.where((artist) {
        final name = artist.name?.toLowerCase() ?? '';
        return name.contains(query);
      }).toList();
    }, [artistItems, searchQuery]);

    final displayHasMore = searchQuery.isEmpty && hasMore;

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        final state = ref.read(baseProvider);
        final currentArtists = state.value?.data?.artists ?? [];
        var currentTotal = state.value?.data?.total ?? 0;

        final currentHasMore = currentArtists.length < currentTotal;

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
        _buildAppBar(ref, colorScheme, total, searchController),
        Expanded(
          child: albums.when(
            data: (data) {
              if (filteredItems.isEmpty) {
                return const Center(child: Text('No artists'));
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  controller: scrollController,
                  itemCount: filteredItems.length + (displayHasMore ? 1 : 0),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    if (index == filteredItems.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final artist = filteredItems[index];
                    return _ArtistItem(
                      artist: artist,
                      colorScheme: colorScheme,
                    );
                  },
                ),
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

class _ArtistItem extends StatelessWidget {
  const _ArtistItem({required this.artist, required this.colorScheme});

  final Artist artist;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    var artistName = artist.name == null ? 'Unknown Artist' : artist.name!;
    if (artistName.isEmpty) {
      artistName = "Unknown Artist";
    }

    return InkWell(
      onTap: () {
        context.push(
          '/albums/$artistName',
          extra: albumsProvider(
            artist: artistName == 'Unknown Artist' ? '' : artistName,
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
                  albumName: "",
                  artistName: artistName,
                  colorScheme: colorScheme,
                  config: SongCoverImageConfig(
                    size: coverSize,
                    isCircular: true,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  artistName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
