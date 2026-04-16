import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    final searchResult = ref.watch(mixSearchProvider(query: queryState.value));
    final activeTrack = ref.watch(audioPlayerStateProvider).activeTrack;
    final activeSongId = activeTrack?.id;
    final songRating = ref.watch(songRatingProvider);
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier2;
    final toolbarHeight = kToolbarHeight * size.multiplier3;
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
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
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
            SizedBox(width: 16 * multiplier),
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
              if ((searchResult.searchArtistFlag == 1 ||
                      searchResult.searchCloudFlag == 1) &&
                  (searchResult.artists?.data?.artists?.isEmpty ?? true) &&
                  (searchResult.cloudArtistsList?.isEmpty ?? true))
                SliverToBoxAdapter(
                  child: CommonShimmerLoader.artistHorizontalList(
                    colorScheme: colorScheme,
                    size: size,
                    itemCount: 10,
                  ),
                ),
              if ((searchResult.artists?.data?.artists?.isNotEmpty ?? false) ||
                  (searchResult.cloudArtistsList?.isNotEmpty ?? false))
                SliverToBoxAdapter(
                  child: ArtistHorizontalList(
                    artists: searchResult.artists?.data?.artists,
                    cloudArtists: searchResult.cloudArtistsList,
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
              if ((searchResult.searchAlbumFlag == 1 ||
                      searchResult.searchCloudFlag == 1) &&
                  (searchResult.albums?.data?.albums?.isEmpty ?? true) &&
                  (searchResult.cloudAlbumsList?.isEmpty ?? true))
                SliverToBoxAdapter(
                  child: CommonShimmerLoader.albumHorizontalList(
                    colorScheme: colorScheme,
                    size: size,
                    itemCount: 10,
                  ),
                ),
              if ((searchResult.albums?.data?.albums?.isNotEmpty ?? false) ||
                  (searchResult.cloudAlbumsList?.isNotEmpty ?? false))
                SliverToBoxAdapter(
                  child: AlbumHorizontalList(
                    albums: searchResult.albums?.data?.albums ?? [],
                    cloudAlbums: searchResult.cloudAlbumsList,
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
              if ((searchResult.searchSongFlag == 1 ||
                      searchResult.searchCloudFlag == 1) &&
                  (searchResult.songs == null ||
                      searchResult.songs!.songs.isEmpty))
                SliverToBoxAdapter(
                  child: CommonShimmerLoader.searchSongList(
                    colorScheme: colorScheme,
                    size: size,
                    itemCount: 10,
                  ),
                ),
              if ((searchResult.searchSongFlag == 0 ||
                      searchResult.searchCloudFlag == 0) &&
                  searchResult.songs != null &&
                  searchResult.songs!.songs.isNotEmpty)
                SliverList.builder(
                  itemCount: searchResult.songs!.songs.length,
                  itemBuilder: (context, index) {
                    var item = searchResult.songs!.songs[index];
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
                            tracks = searchResult.songs!.songs;
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
