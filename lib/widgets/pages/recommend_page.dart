import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/pages/songs_page.dart';
import 'package:toneharbor/widgets/widgets.dart';

class RecommendPage extends BaseContentPage {
  const RecommendPage({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref) {
    final i10n = ref.watch(l10nProvider);

    return AppBar(
      title: Text(
        i10n.recommend,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh_rounded, size: 18),
          onPressed: () {
            ref.invalidate(randomSongsProvider);
            ref.invalidate(recentAlbumsProvider);
            ref.invalidate(
              albumsProvider(limit: 20, sortBy: 'year', sortDirection: 'desc'),
            );
            ref.invalidate(favoriteSongsProvider(limit: 50));
          },
        ),
      ],
      centerTitle: false,
    );
  }

  @override
  Widget buildContent(BuildContext context, WidgetRef ref) {
    var colorScheme = getColorSchemeWhenReady(ref);
    final i10n = ref.watch(l10nProvider);

    return SingleChildScrollView(
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
                          color: colorScheme.onPrimaryContainer,
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
                          "/songs/${Uri.encodeComponent(i10n.daily_recommend)}",
                          extra: (
                            randomSongsProvider(limit: 100),
                            100,
                            SongsPageSortAction.none,
                          ),
                        );
                      },
                      child: Text(
                        i10n.more,
                        style: TextStyle(
                          fontSize: 11,
                          color: colorScheme.onPrimaryContainer,
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
    );
  }
}
