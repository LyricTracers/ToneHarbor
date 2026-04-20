import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/albums.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/cloud_playlist_static_data.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_common_artists.dart';
import 'package:toneharbor/widgets/components/cloud_playlists_cat.dart';
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
    return Column(
      children: [
        if (size.lgAndUp) buildAppBar(context, ref, colorScheme),
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!useCloudMusic) ...[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 8,
                          bottom: 8,
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
                      SizedBox(height: 8),
                      CommonSongs(
                        songs: ref.watch(favoriteSongsProvider(limit: 50)),
                        onErrorTap: () {
                          ref.invalidate(favoriteSongsProvider(limit: 50));
                        },
                        limit: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                          bottom: 8,
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
                      SizedBox(height: 8),
                      const RecommendPageDailySongs(),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          i10n.recommend_albums,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 8),
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
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          i10n.recent_albums,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 8),
                      CommonAlbums(
                        albums: ref.watch(recentAlbumsProvider()),
                        onErrorTap: () {
                          ref.invalidate(recentAlbumsProvider());
                        },
                      ),
                    ],
                    if (useCloudMusic) ...[
                      if (useInfo.value != null) ...[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Text(
                            i10n.daily_recommend,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          indent: 16,
                          endIndent: 16,
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                        SizedBox(height: 8),
                        CommonSongs(
                          songs: ref.watch(cloudDailyRecommendProvider),
                          onErrorTap: () {},
                          limit: 20,
                        ),
                      ],

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                          bottom: 8,
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
                      SizedBox(height: 15),
                      CloudPlaylistsCat(
                        baseProvider: recommendPlaylistsProvider(limit: 12),
                        visibleRows: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                          bottom: 8,
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
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        indent: 16,
                        endIndent: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: 15),
                      CloudMusicArtistHorizontalList(
                        limit: 10,
                        cloudLayoutConfig: ArtistLayoutConfig.defaultConfig
                            .copyWith(
                              height: 220,
                              fontSize: 14,
                              horizontalPadding: 24,
                              itemSpacing: 24,
                              itemWidth: 180,
                            ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                          bottom: 8,
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
                      SizedBox(height: 15),
                      CloudAlbumsCat(
                        baseProvider: cloudMusicAlbumNewProvider(
                          limit: 30,
                          area: ref.watch(cloudMusicLanguageProvider).area,
                        ),
                        visibleRows: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                          bottom: 8,
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
                      SizedBox(height: 15),
                      CloudPlaylistsCat(
                        baseProvider: cloudToplistProvider(),
                        visibleRows: size.mdAndUp ? 1 : 2,
                      ),
                      SizedBox(height: 15),
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
