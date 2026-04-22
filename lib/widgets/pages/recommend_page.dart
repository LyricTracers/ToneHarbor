import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/cloud_playlist_static_data.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_common_artists.dart';
import 'package:toneharbor/widgets/widgets.dart';

class RecommendPage extends HookConsumerWidget {
  const RecommendPage({super.key});

  PreferredSizeWidget buildAppBar(
    BuildContext context,
    WidgetRef ref,
    ColorScheme colorScheme,
  ) {
    final i10n = ref.watch(l10nProvider);

    return AppBar(
      backgroundColor: colorScheme.tertiary.withValues(alpha: 0.1),
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      title: Text(
        i10n.recommend,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings_rounded, size: 18),
          onPressed: () {
            context.pushWrapper("/setting");
          },
          tooltip: i10n.settings,
        ),
      ],
      centerTitle: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorScheme = getColorSchemeWhenReady(ref);
    final i10n = ref.watch(l10nProvider);
    final size = MediaQuery.of(context).size;
    final useCloudMusic = ref.watch(shouldUseCloudMusicHomeProvider);
    final useInfo = ref.watch(cloudUserInfoProvider);
    final recommendArtistsAsync = ref.watch(
      recommendTopArtistProvider(
        limit: 10,
        cacheDuration: const Duration(minutes: 60),
      ),
    );
    return Column(
      children: [
        if (size.lgAndUp) buildAppBar(context, ref, colorScheme),
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.only(right: 16, left: 16, bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!useCloudMusic) ...[
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i10n.my_favorite,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(5),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                if (useCloudMusic) {
                                  context.pushWrapper(
                                    "/cloud-favorite-songs/${Uri.encodeComponent(i10n.my_favorite)}",
                                  );
                                } else {
                                  context.pushWrapper(
                                    "/songs/${Uri.encodeComponent(i10n.my_favorite)}",
                                    extra: (
                                      favoriteSongsProvider(limit: 50),
                                      -1,
                                      SongsPageSortAction.all,
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                i10n.more,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 12),
                      CommonSongs(
                        songs: ref.watch(favoriteSongsProvider(limit: 50)),
                        onErrorTap: () {
                          ref.invalidate(favoriteSongsProvider(limit: 50));
                        },
                        limit: 20,
                      ),

                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i10n.daily_recommend,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(5),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                context.pushWrapper(
                                  "/random_songs/${Uri.encodeComponent(i10n.daily_recommend)}",
                                );
                              },
                              child: Text(
                                i10n.more,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 12),
                      const RecommendPageDailySongs(),

                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 4,
                        ),
                        child: Row(
                          children: [
                            Text(
                              i10n.recommend_albums,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 12),
                      CommonAlbums(
                        albums: ref.watch(
                          albumsProvider(
                            limit: 20,
                            sortBy: 'year',
                            sortDirection: 'desc',
                          ),
                        ),
                        onErrorTap: () {
                          ref.invalidate(
                            albumsProvider(
                              limit: 20,
                              sortBy: 'year',
                              sortDirection: 'desc',
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 4,
                        ),
                        child: Row(
                          children: [
                            Text(
                              i10n.recent_albums,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 12),
                      CommonAlbums(
                        albums: ref.watch(recentAlbumsProvider()),
                        onErrorTap: () {
                          ref.invalidate(recentAlbumsProvider());
                        },
                      ),
                      SizedBox(height: 8),
                    ],
                    if (useCloudMusic) ...[
                      SizedBox(height: 8),
                      if (useInfo.value != null) ...[
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 16,
                            left: 16,
                            bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                i10n.daily_recommend,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          indent: 16,
                          endIndent: 16,
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                        SizedBox(height: 12),
                        CommonSongs(
                          songs: ref.watch(cloudDailyRecommendProvider),
                          onErrorTap: () {},
                          limit: 20,
                        ),

                        SizedBox(height: 15),
                      ],

                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i10n.cloud_recommend_playlist,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(5),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                context.pushWrapper(
                                  "/cloud-playlist-catlist",
                                  extra: CloudPlaylistStaticData
                                      .staticCategories[0],
                                );
                              },
                              child: Text(
                                i10n.more,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 12),
                      CloudPlaylistsCat(
                        mainAxisSpacing: size.smAndDown ? 10 : 20,
                        crossAxisSpacing: size.smAndDown ? 20 : 32,
                        baseProvider: recommendPlaylistsProvider(limit: 12),
                        visibleRows: 2,
                      ),

                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i10n.cloud_recommend_artists,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(5),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                context.pushWrapper("/cloud-all-artist-list");
                              },
                              child: Text(
                                i10n.more,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 12),
                      CloudMusicArtistHorizontalListView(
                        artists: recommendArtistsAsync.value,
                        colorScheme: colorScheme,
                        config: ArtistLayoutConfig.defaultConfig
                            .copyWith(
                              height: 220,
                              fontSize: 14,
                              horizontalPadding: 24,
                              itemSpacing: 24,
                              itemWidth: 180,
                            )
                            .withMultiplier(size.multiplier),
                        isLoading: recommendArtistsAsync.isLoading,
                        shimmerCount: 10,
                      ),

                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i10n.new_album,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(5),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                context.pushWrapper(
                                  "/cloud-album-cat/${Uri.encodeComponent(i10n.new_album)}",
                                  extra: cloudMusicAlbumNewProvider(
                                    limit: 30,
                                    area: ref
                                        .watch(cloudMusicLanguageProvider)
                                        .area,
                                  ),
                                );
                              },
                              child: Text(
                                i10n.more,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 12),
                      CloudAlbumsCat(
                        mainAxisSpacing: size.smAndDown ? 10 : 20,
                        crossAxisSpacing: size.smAndDown ? 20 : 32,
                        baseProvider: cloudMusicAlbumNewProvider(
                          limit: 30,
                          area: ref.watch(cloudMusicLanguageProvider).area,
                        ),
                        visibleRows: size.mdAndUp ? 1 : 2,
                      ),

                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i10n.ranking,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(5),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                context.pushWrapper(
                                  "/cloud-playlist-catlist",
                                  extra: CloudPlaylistStaticData
                                      .staticCategories[2],
                                );
                              },
                              child: Text(
                                i10n.more,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 12),
                      CloudPlaylistsCat(
                        mainAxisSpacing: size.smAndDown ? 10 : 20,
                        crossAxisSpacing: size.smAndDown ? 20 : 32,
                        baseProvider: cloudToplistProvider(),
                        visibleRows: size.mdAndUp ? 1 : 2,
                      ),
                      SizedBox(height: 20),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
