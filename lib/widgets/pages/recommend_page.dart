import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/widgets.dart';

class RecommendPage extends HookConsumerWidget {
  const RecommendPage({super.key});

  PreferredSizeWidget buildAppBar(
    BuildContext context,
    WidgetRef ref,
    ColorScheme colorScheme,
  ) {
    final i10n = ref.watch(l10nProvider);
    final color = colorScheme.tertiary.withValues(alpha: 0.1);
    final size = MediaQuery.of(context).size;
    final toolbarHeight = 56 * size.multiplier2;
    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: color,
      title: Text(
        i10n.recommend,
        style: TextStyle(
          fontSize: 16 * size.multiplier2,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings_rounded, size: 18),
          onPressed: () {
            context.push("/setting");
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
    final needAppBar = MediaQuery.of(context).lgAndUp;
    return Column(
      children: [
        if (needAppBar) buildAppBar(context, ref, colorScheme),
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              context.push(
                                "/songs/${Uri.encodeComponent(i10n.my_favorite)}",
                                extra: (
                                  favoriteSongsProvider(limit: 50),
                                  -1,
                                  SongsPageSortAction.all,
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
                              context.push(
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
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
