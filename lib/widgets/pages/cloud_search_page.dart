import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_common_artists.dart';
import 'package:toneharbor/widgets/components/cloud_common_songs.dart';
import 'package:toneharbor/widgets/widgets.dart';

class CloudSearchPage extends HookConsumerWidget {
  final String query;
  const CloudSearchPage({super.key, required this.query});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final queryState = useState(query);
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier2;
    final toolbarHeight = kToolbarHeight * size.multiplier3;
    final searchArtistsAsync = ref.watch(
      cloudMusicSearchArtistsProvider(query: queryState.value),
    );
    final searchSongsAsync = ref.watch(
      cloudMusicSearchSongsProvider(query: queryState.value),
    );

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.artist,
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontSize: 18 * multiplier,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (searchArtistsAsync.value != null)
                        TextButton(
                          onPressed: () {
                            context.pushWrapper(
                              "/cloud-artist-list/${Uri.encodeComponent('${l10n.search}:${queryState.value}')}",
                              extra: cloudMusicSearchArtistsProvider(
                                query: queryState.value,
                              ),
                            );
                          },
                          child: Text(
                            l10n.more,
                            style: TextStyle(
                              fontSize: 11,
                              color: colorScheme.tertiary,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CloudMusicArtistHorizontalListView(
                  artists: searchArtistsAsync.value?.artists ?? [],
                  colorScheme: colorScheme,
                  config: ArtistLayoutConfig.defaultConfig
                      .copyWith(
                        height: 180,
                        fontSize: 14,
                        horizontalPadding: 24,
                        itemSpacing: 24,
                        itemWidth: 120,
                      )
                      .withMultiplier(size.multiplier),
                  isLoading: searchArtistsAsync.isLoading,
                  shimmerCount: 10,
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.all(20 * multiplier),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.albums,
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontSize: 18 * multiplier,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushWrapper(
                            "/cloud-album-cat/${Uri.encodeComponent('${l10n.search}:${queryState.value}')}",
                            extra: cloudMusicSearchAlbumsProvider(
                              query: queryState.value,
                            ),
                          );
                        },
                        child: Text(
                          l10n.more,
                          style: TextStyle(
                            fontSize: 11,
                            color: colorScheme.tertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CloudAlbumsCat(
                  baseProvider: cloudMusicSearchAlbumsProvider(
                    query: queryState.value,
                  ),
                  visibleRows: 2,
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.all(20 * multiplier),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.all_music,
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontSize: 18 * multiplier,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (searchSongsAsync.value != null)
                        TextButton(
                          onPressed: () {
                            context.pushWrapper(
                              "/cloud-songs-list/${Uri.encodeComponent('${l10n.search}:${queryState.value}')}",
                              extra: cloudMusicSearchSongsProvider(
                                query: queryState.value,
                              ),
                            );
                          },
                          child: Text(
                            l10n.more,
                            style: TextStyle(
                              fontSize: 11,
                              color: colorScheme.tertiary,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 15 * multiplier),
                sliver: SliverToBoxAdapter(
                  child: CloudMusicSongsHorizontalListView(
                    songs: searchSongsAsync.value?.songs ?? [],
                    songsFlag: searchSongsAsync.isLoading ? 1 : 0,
                    colorScheme: colorScheme,
                    size: size,
                    l10n: l10n,
                  ),
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.all(20 * multiplier),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.playlists,
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontSize: 18 * multiplier,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushWrapper(
                            "/cloud-playlist-list/${Uri.encodeComponent('${l10n.search}:${queryState.value}')}",
                            extra: cloudMusicSearchPlaylistsProvider(
                              query: queryState.value,
                            ),
                          );
                        },
                        child: Text(
                          l10n.more,
                          style: TextStyle(
                            fontSize: 11,
                            color: colorScheme.tertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CloudPlaylistsCat(
                  baseProvider: cloudMusicSearchPlaylistsProvider(
                    query: queryState.value,
                  ),
                  visibleRows: 2,
                ),
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
