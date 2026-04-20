import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/common_shimmer_loader.dart';
import 'package:toneharbor/widgets/widgets.dart';

class SearchResultPage extends HookConsumerWidget {
  final String query;
  const SearchResultPage({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final queryState = useState(query);
    final provider = mixSearchProvider(query: queryState.value);
    final searchResultHot = ref.watch(searchCloudHotProvider);
    final searchAlbumsResult = ref.watch(
      provider.select(
        (state) => state.copyWith(
          searchAlbumFlag: state.searchAlbumFlag,
          searchCloudFlag: state.searchCloudFlag,
          albums: state.albums,
          cloudAlbumsList: state.cloudAlbumsList,
        ),
      ),
    );

    final searchArtistsResult = ref.watch(
      provider.select(
        (state) => state.copyWith(
          searchArtistFlag: state.searchArtistFlag,
          artists: state.artists,
          cloudArtistsList: state.cloudArtistsList,
        ),
      ),
    );

    final searchSongsResult = ref.watch(
      provider.select(
        (state) => state.copyWith(
          searchSongFlag: state.searchSongFlag,
          searchCloudFlag: state.searchCloudFlag,
          songs: state.songs,
        ),
      ),
    );

    final activeTrack = ref.watch(audioPlayerStateProvider).activeTrack;
    final activeSongId = activeTrack?.id;
    final songRating = ref.watch(songRatingProvider);
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier2;
    final toolbarHeight = kToolbarHeight * size.multiplier3;
    final useCloudMusic = ref.watch(shouldUseCloudMusicHomeProvider);
    return Column(
      children: [
        AppBar(
          toolbarHeight: toolbarHeight,
          backgroundColor: size.lgAndUp
              ? colorScheme.tertiary.withValues(alpha: 0.1)
              : Colors.transparent,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          centerTitle: false,
          actions: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                constraints: BoxConstraints(maxWidth: 200, maxHeight: 36),
                child: SearchHistoryTextField(
                  query: queryState.value,
                  showHistoryIcon: false,
                  listTextStyle: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: l10n.searchHint,
                    hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search, size: 18),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear, size: 14),
                      onPressed: () {
                        queryState.value = '';
                        logger.i("clear search query");
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                  ),
                  onFocusChanged: (v) {},
                  onSubmitSearch: (value) {
                    var r = value.trim();
                    if (r.isEmpty) return;
                    queryState.value = r;
                  },
                ),
              ),
            ),

            if (useCloudMusic) ...[
              SizedBox(width: 8 * multiplier),
              IconButton(
                onPressed: () {
                  if (queryState.value.isEmpty) return;
                  context.pushWrapper(
                    "/cloud-search/${Uri.encodeComponent(queryState.value)}",
                  );
                },
                icon: const Icon(Icons.saved_search_rounded, size: 18),
                tooltip: l10n.more_search,
              ),
              SizedBox(width: 8 * multiplier),
            ],
            if (size.lgAndUp)
              IconButton(
                onPressed: () {
                  context.pushWrapper("/setting");
                },
                icon: const Icon(Icons.settings_rounded, size: 18),
                tooltip: l10n.settings,
              ),
          ],
        ),

        if (searchResultHot.isLoading)
          Padding(
            padding: EdgeInsets.all(size.smAndUp ? 16 : 8),

            child: SizedBox(
              height: 48 * size.multiplier2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8 * size.multiplier2),
                    child: CommonShimmerLoader.chipLoader(
                      colorScheme: colorScheme,
                      width: 80 + (index % 3) * 20,
                      height: 28 * size.multiplier2,
                    ),
                  );
                },
              ),
            ),
          ),

        if (searchResultHot.value != null && searchResultHot.value!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.smAndUp ? 16 : 8,
              vertical: size.smAndUp ? 8 : 4,
            ),
            child: SizedBox(
              height: 48 * size.multiplier2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: searchResultHot.value!.length,
                itemBuilder: (context, index) {
                  final hotKeyword = searchResultHot.value![index];
                  final isSelected = hotKeyword == queryState.value;
                  return Padding(
                    padding: EdgeInsets.only(right: 8 * size.multiplier2),
                    child: RawChip(
                      label: Text(hotKeyword),
                      labelStyle: TextStyle(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 14 * size.multiplier2,
                      ),
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: 12 * size.multiplier2,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: isSelected
                            ? BorderSide(color: colorScheme.primary, width: 1.2)
                            : BorderSide(
                                color: colorScheme.outline,
                                width: 0.8,
                              ),
                      ),
                      onSelected: (selected) {
                        queryState.value = hotKeyword;
                      },
                    ),
                  );
                },
              ),
            ),
          ),

        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(20 * multiplier),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    l10n.artist,
                    style: TextStyle(
                      color: colorScheme.secondary,
                      fontSize: 18 * multiplier,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if ((searchArtistsResult.searchArtistFlag == 1 ||
                      searchArtistsResult.searchCloudFlag == 1) &&
                  (searchArtistsResult.artists?.data?.artists?.isEmpty ??
                      true) &&
                  (searchArtistsResult.cloudArtistsList?.isEmpty ?? true))
                SliverToBoxAdapter(
                  child: CommonShimmerLoader.artistHorizontalList(
                    colorScheme: colorScheme,
                    size: size,
                    itemCount: 10,
                  ),
                ),
              if ((searchArtistsResult.artists?.data?.artists?.isNotEmpty ??
                      false) ||
                  (searchArtistsResult.cloudArtistsList?.isNotEmpty ?? false))
                SliverToBoxAdapter(
                  child: ArtistHorizontalList(
                    artists: searchArtistsResult.artists?.data?.artists,
                    cloudArtists: searchArtistsResult.cloudArtistsList,
                  ),
                ),
              SliverPadding(
                padding: EdgeInsets.all(20 * multiplier),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    l10n.albums,
                    style: TextStyle(
                      color: colorScheme.secondary,
                      fontSize: 18 * multiplier,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if ((searchAlbumsResult.searchAlbumFlag == 1 ||
                      searchAlbumsResult.searchCloudFlag == 1) &&
                  (searchAlbumsResult.albums?.data?.albums?.isEmpty ?? true) &&
                  (searchAlbumsResult.cloudAlbumsList?.isEmpty ?? true))
                SliverToBoxAdapter(
                  child: CommonShimmerLoader.albumHorizontalList(
                    colorScheme: colorScheme,
                    size: size,
                    itemCount: 10,
                  ),
                ),
              if ((searchAlbumsResult.albums?.data?.albums?.isNotEmpty ??
                      false) ||
                  (searchAlbumsResult.cloudAlbumsList?.isNotEmpty ?? false))
                SliverToBoxAdapter(
                  child: AlbumHorizontalList(
                    albums: searchAlbumsResult.albums?.data?.albums ?? [],
                    cloudAlbums: searchAlbumsResult.cloudAlbumsList,
                  ),
                ),

              SliverPadding(
                padding: EdgeInsets.only(
                  left: 20 * multiplier,
                  top: 20 * multiplier,
                  bottom: 20 * multiplier,
                  right: 15 * multiplier,
                ),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    l10n.all_music,
                    style: TextStyle(
                      color: colorScheme.secondary,
                      fontSize: 18 * multiplier,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if ((searchSongsResult.searchSongFlag == 1 ||
                      searchSongsResult.searchCloudFlag == 1) &&
                  (searchSongsResult.songs == null ||
                      searchSongsResult.songs!.songs.isEmpty))
                SliverToBoxAdapter(
                  child: CommonShimmerLoader.searchSongList(
                    colorScheme: colorScheme,
                    size: size,
                    itemCount: 10,
                  ),
                ),
              if ((searchSongsResult.searchSongFlag == 0 ||
                      searchSongsResult.searchCloudFlag == 0) &&
                  searchSongsResult.songs != null &&
                  searchSongsResult.songs!.songs.isNotEmpty)
                SliverList.builder(
                  itemCount: searchSongsResult.songs!.songs.length,
                  itemBuilder: (context, index) {
                    var item = searchSongsResult.songs!.songs[index];
                    return RepaintBoundary(
                      child: ContextMenuRegion(
                        enableDefaultGestures: true,
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
                          key: ValueKey(item.id),
                          index: index,
                          song: item,
                          activeSongId: activeSongId,
                          colorScheme: colorScheme,
                          l10n: l10n,
                          multiplier: multiplier,
                          isFavorite: songRating.contains(item.id),
                          onTap: () async {
                            List<ToneHarborTrackObject> tracks;
                            var initIndex = index;
                            tracks = searchSongsResult.songs!.songs;
                            if (tracks.isEmpty) return;
                            await ref
                                .read(audioPlayerStateProvider.notifier)
                                .load(
                                  tracks,
                                  initialIndex: initIndex < tracks.length
                                      ? initIndex
                                      : 0,
                                  autoPlay: true,
                                );
                            if (context.mounted) {
                              if (size.isXs) {
                                showModalBottomSheetWidget(
                                  ref.context,
                                  colorScheme,
                                  isScrollControlled: true,
                                  (context) => const PlayingDetailLayout(),
                                );
                              } else {
                                context.pushWrapper("/playing_detail");
                              }
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),

              SliverToBoxAdapter(child: SizedBox(height: 20 * multiplier)),
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    l10n.reach_end,
                    style: TextStyle(
                      fontSize: 12 * size.multiplier,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20 * multiplier)),
            ],
          ),
        ),
      ],
    );
  }
}
