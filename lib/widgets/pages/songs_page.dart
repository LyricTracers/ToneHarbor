import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/providers/audio_player/song_selection_provider.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';
import 'package:toneharbor/widgets/components/common_search_field.dart';
import 'package:toneharbor/widgets/components/song_context_menu.dart';
import 'package:toneharbor/widgets/components/song_item.dart';
import 'package:toneharbor/widgets/components/sub_song_selection_bottom.dart';
import 'package:toneharbor/widgets/components/sub_song_selection_top.dart';

part 'songs_page_action.dart';

class SongsPage<T extends ExtraProvider<ToneHarborTrackObjectList>>
    extends HookConsumerWidget {
  const SongsPage({
    super.key,
    required this.title,
    required this.baseProvider,
    required this.limitTotal,
    this.sortAction = SongsPageSortAction.none,
    this.isLocal = false,
    this.refreshRandom = false,
    this.playlistId = '',
  });

  final int limitTotal;
  final String title;
  final $AsyncNotifierProvider<T, ToneHarborTrackObjectList> baseProvider;
  final SongsPageSortAction sortAction;
  final bool isLocal;
  final bool refreshRandom;
  final String playlistId;

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
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          if (total > 0)
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                " ${l10n.total_songs.replaceFirst("%s", total.toString())}",
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      actions: [
        CommonSearchField(searchController: searchController),
        const SizedBox(width: 16),
        _buildSortAction(ref, l10n, searchController),
        IconButton(
          onPressed: () {
            ref.read(songSelectionProvider.notifier).toggle();
          },
          icon: const Icon(Icons.fact_check_rounded, size: 18),
        ),
        if (refreshRandom)
          IconButton(
            icon: Icon(Icons.update_rounded, size: 18),
            onPressed: () async {
              await audioStationRequestCache.clearGroup("randomSongs");
              ref.invalidate(randomSongsProvider);
            },
          ),
        IconButton(
          onPressed: () {
            ref.context.push("/setting");
          },
          icon: const Icon(Icons.settings_rounded, size: 18),
        ),
      ],
      centerTitle: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final scrollController = useScrollController();
    final searchController = useTextEditingController();
    final searchQuery = useSearchQuery(searchController);
    final l10n = ref.watch(l10nProvider);
    var songs = ref.watch(baseProvider);
    var total = songs.value?.total ?? 0;
    if (limitTotal > 0 && total > limitTotal) {
      total = limitTotal;
    }
    final songItems = songs.value?.songs ?? [];
    final hasMore = songItems.length < total;
    final isLoadingMore = useState(false);
    final activeTrack = ref.watch(audioPlayerStateProvider).activeTrack;
    final activeSongId = activeTrack?.id;
    useEffect(() {
      Future.microtask(() {
        ref.invalidate(songSelectionProvider);
      });
      return null;
    }, []);
    final songRating = ref.watch(songRatingProvider);
    final songSelectionState = ref.watch(
      songSelectionProvider.select(
        (state) => SongSelectionState(
          selectionType: state.selectionType,
          ids: {},
          boxState: state.boxState,
        ),
      ),
    );

    final filteredItems = useMemoized(() {
      if (searchQuery.isEmpty) {
        return songItems;
      }
      final query = searchQuery.toLowerCase();
      return songItems.where((song) {
        final title = song.title.toLowerCase();
        final artist = song.artist.toLowerCase();
        final album = song.album.toLowerCase();
        return title.contains(query) ||
            artist.contains(query) ||
            album.contains(query);
      }).toList();
    }, [songItems, searchQuery]);

    final displayHasMore = searchQuery.isEmpty && hasMore;

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        final state = ref.read(baseProvider);
        final currentSongs = state.value?.songs ?? [];
        var currentTotal = state.value?.total ?? 0;
        if (limitTotal > 0 && currentTotal > limitTotal) {
          currentTotal = limitTotal;
        }
        final currentHasMore = currentSongs.length < currentTotal;

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
        if (songSelectionState.selectionType)
          SubSongSelectionTop(songs: filteredItems),
        if (!songSelectionState.selectionType)
          _buildAppBar(ref, colorScheme, total, searchController),
        Expanded(
          child: songs.when(
            data: (data) {
              if (filteredItems.isEmpty) {
                return const Center(child: Text('No songs'));
              }
              return ListView.builder(
                controller: scrollController,
                itemCount: filteredItems.length + (displayHasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == filteredItems.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    );
                  }
                  var item = filteredItems[index];
                  return RepaintBoundary(
                    child: ContextMenuRegion(
                      enableDefaultGestures: !songSelectionState.selectionType,
                      contextMenu: ContextMenu(
                        entriesBuilder: () => SongContextMenu.build(
                          ref,
                          colorScheme,
                          l10n,
                          item,
                          playlistId: playlistId,
                          index: searchQuery.isEmpty ? index : -1,
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
                        isFavorite: songRating.contains(item.id),
                        selectionState: songSelectionState,
                        onTap: () async {
                          {
                            var tracks = <ToneHarborTrackObject>[];
                            var initIndex = index;
                            if (!isLocal) {
                              initIndex = 0;
                              tracks.addAll(
                                filteredItems.where((song) {
                                  if (!song.isSong) return false;
                                  if (song.id == item.id) {
                                    initIndex = tracks.length;
                                  }
                                  if (song is ToneHarborTrackObjectMultLocal) {
                                    return song.availableQualities.isNotEmpty &&
                                        File(song.path).existsSync();
                                  } else {
                                    return true;
                                  }
                                }),
                              );
                            } else {
                              tracks = filteredItems;
                            }
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
                              context.push("/playing_detail");
                            }
                          }
                        },
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: AudioEqualizerLoader()),
            error: (error, stackTrace) {
              return buildErrorView(context, ref, colorScheme, () {});
            },
          ),
        ),
        if (songSelectionState.selectionType)
          SubSongSelectionBottom(songs: filteredItems, isLocal: isLocal),
      ],
    );
  }
}
