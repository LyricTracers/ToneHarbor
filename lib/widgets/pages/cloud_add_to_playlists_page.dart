import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/playlists.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/cloud_playlist_static_data.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/components/common_shimmer_loader.dart';

class CloudAddToPlaylistsPage extends HookConsumerWidget {
  const CloudAddToPlaylistsPage(this.songIds, {super.key});

  final String songIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final size = MediaQuery.of(context).size;
    var width = size.width;

    final scrollController = useScrollController();

    final category = CloudPlaylistStaticData.staticCategories[4];
    final playlistsState = ref.watch(
      cloudMusicPlaylistCatlistProvider(cat: category.name),
    );
    final playlists = playlistsState.value?.playlists ?? [];
    final total = playlistsState.value?.total ?? 0;
    final hasMore = playlists.length < total;
    final isLoadingMore = useState(false);
    final favoritePlaylistsState = ref.watch(favoritePlaylistStateProvider);

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        final state = ref.read(
          cloudMusicPlaylistCatlistProvider(cat: category.name),
        );
        final currentPlaylists = state.value?.playlists ?? [];
        final currentTotal = state.value?.total ?? 0;
        final currentHasMore = currentPlaylists.length < currentTotal;

        if (currentScroll >= maxScroll * 0.8 &&
            currentHasMore &&
            !isLoadingMore.value) {
          loadMore(
            ref: ref,
            isLoadingMore: isLoadingMore,
            category: category.name,
          );
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    var targetWidth = 0.0;
    if (size.xlAndUp) {
      targetWidth = width * 0.35;
    } else if (size.isLg) {
      targetWidth = width * 0.45;
    } else if (size.isMd) {
      targetWidth = width * 0.55;
    } else {
      targetWidth = double.infinity;
    }

    return Stack(
      children: [
        Container(
          width: targetWidth,
          color: colorScheme.surfaceContainerHighest,
          height: double.infinity,
          child: Column(
            children: [
              AppBar(
                titleSpacing: 0,
                toolbarHeight: kToolbarHeight * size.multiplier3 * 0.8,
                title: Text(
                  l10n.add_to_playlists,
                  style: TextStyle(
                    fontSize: 14 * size.multiplier2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () async {
                      // showCreatePlaylistDialog(
                      //   context,
                      //   ref,
                      //   nameController,
                      //   colorScheme,
                      //   callBackAddPlaylists,
                      // );
                    },
                    icon: Icon(
                      Icons.create_rounded,
                      size: 18 * size.multiplier2,
                    ),
                    tooltip: l10n.create_playlist,
                  ),
                ],
                centerTitle: false,
                backgroundColor: colorScheme.tertiary.withValues(alpha: 0.1),
              ),
              Expanded(
                child: playlistsState.when(
                  data: (data) {
                    if (playlists.isEmpty) {
                      return Center(child: Text(l10n.no_playlists));
                    }

                    return ListView.builder(
                      controller: scrollController,
                      itemCount: playlists.length + (hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == playlists.length) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          );
                        }

                        final playlist = playlists[index];

                        return RepaintBoundary(
                          child: Stack(
                            children: [
                              ListTile(
                                minTileHeight: 48 * size.multiplier2,
                                contentPadding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                horizontalTitleGap: 10,
                                leading: CloudMusicCoverImage(
                                  imageUrl: playlist.cover,
                                  colorScheme: colorScheme,
                                  config: CloudMusicCoverImageConfig(
                                    size: 36 * size.multiplier2,
                                    borderRadius: 4,
                                  ),
                                ),
                                title: Text(
                                  playlist.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () async {
                                  ref
                                      .read(requestFlagProvider.notifier)
                                      .setRequestFlag(true);
                                  try {
                                    var result = await updateTrackSongs(
                                      ref,
                                      playlist.id,
                                      songIds,
                                      true,
                                    );
                                    if (result) {
                                      await audioStationRequestCache.delete(
                                        'cloud_playlistDetail:${playlist.id}',
                                      );
                                      ref.invalidate(
                                        cloudMusicPlaylistDetailProvider(
                                          playlist.id,
                                        ),
                                      );
                                      ref.invalidate(songSelectionProvider);
                                      if (context.mounted) {
                                        showSnackBar(
                                          l10n.addsong_to_playlist_success
                                              .replaceFirst(
                                                "%s",
                                                playlist.name,
                                              ),
                                          context,
                                          colorScheme.secondary,
                                        );
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      showSnackBarError(
                                        e,
                                        context,
                                        colorScheme.secondary,
                                      );
                                    }
                                  } finally {
                                    ref
                                        .read(requestFlagProvider.notifier)
                                        .setRequestFlag(false);
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) =>
                      Center(child: Text(error.toString())),
                  loading: () => CommonShimmerLoader.playlistItemList(
                    colorScheme: colorScheme,
                    size: size,
                    hasCover: true,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }

  static Future<void> loadMore({
    required WidgetRef ref,
    required ValueNotifier<bool> isLoadingMore,
    required String category,
  }) async {
    isLoadingMore.value = true;
    try {
      await ref
          .read(cloudMusicPlaylistCatlistProvider(cat: category).notifier)
          .loadMore();
    } finally {
      isLoadingMore.value = false;
    }
  }
}
