import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/widgets.dart';

class SearchResulutPage extends HookConsumerWidget {
  final String query;
  const SearchResulutPage({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final searchResult = ref.watch(mixSearchProvider(query: query));
    final activeTrack = ref.watch(audioPlayerStateProvider).activeTrack;
    final activeSongId = activeTrack?.id;
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
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier2;
    return Column(
      children: [
        if (songSelectionState.selectionType)
          SubSongSelectionTop(songs: searchResult.value?.songs?.songs ?? []),
        if (!songSelectionState.selectionType)
          AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            centerTitle: false,
            title: Row(
              children: [
                Text(
                  "${l10n.search}:",
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 16 * multiplier,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  query,
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 16 * multiplier,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  ref.read(songSelectionProvider.notifier).toggle();
                },
                tooltip: l10n.select_all,
                icon: const Icon(Icons.fact_check_rounded, size: 18),
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
          child: searchResult.when(
            data: (data) {
              if (data.albums == null &&
                  data.artists == null &&
                  data.songs == null) {
                return buildErrorView(context, ref, colorScheme, () {});
              }
              final artists = data.artists;
              final albums = data.albums;
              final songs = data.songs;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!songSelectionState.selectionType) ...[
                              if (artists != null &&
                                  artists.data != null &&
                                  artists.data!.artists != null &&
                                  artists.data!.artists!.isNotEmpty) ...[
                                Padding(
                                  padding: EdgeInsets.all(20 * multiplier),
                                  child: Text(
                                    l10n.artist,
                                    style: TextStyle(
                                      color: colorScheme.secondary,
                                      fontSize: 18 * multiplier,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                AritistHorizontalList(
                                  artists: artists.data!.artists!,
                                ),
                              ],
                              if (albums != null &&
                                  albums.data != null &&
                                  albums.data!.albums != null &&
                                  albums.data!.albums!.isNotEmpty) ...[
                                Padding(
                                  padding: EdgeInsets.all(20 * multiplier),
                                  child: Text(
                                    l10n.albums,
                                    style: TextStyle(
                                      color: colorScheme.secondary,
                                      fontSize: 18 * multiplier,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                AlbumHorizontalList(
                                  albums: albums.data?.albums ?? [],
                                ),
                              ],
                            ],

                            if (songs != null && songs.songs.isNotEmpty) ...[
                              if (!songSelectionState.selectionType)
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 20 * multiplier,
                                    top: 20 * multiplier,
                                    bottom: 20 * multiplier,
                                    right: 15 * multiplier,
                                  ),
                                  child: Text(
                                    l10n.all_music,
                                    style: TextStyle(
                                      color: colorScheme.secondary,
                                      fontSize: 18 * multiplier,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: songs.songs.length,
                                itemBuilder: (context, index) {
                                  var item = songs.songs[index];
                                  return RepaintBoundary(
                                    child: ContextMenuRegion(
                                      enableDefaultGestures:
                                          !songSelectionState.selectionType,
                                      contextMenu: ContextMenu(
                                        entriesBuilder: () =>
                                            SongContextMenu.build(
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
                                        isFavorite: songRating.contains(
                                          item.id,
                                        ),
                                        selectionState: songSelectionState,
                                        onTap: () async {
                                          List<ToneHarborTrackObject> tracks;
                                          var initIndex = index;
                                          tracks = songs.songs;
                                          if (tracks.isEmpty) return;
                                          await ref
                                              .read(
                                                audioPlayerStateProvider
                                                    .notifier,
                                              )
                                              .load(
                                                tracks,
                                                initialIndex:
                                                    initIndex < tracks.length
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
                                                (context) =>
                                                    const PlayingDetailLayout(),
                                              );
                                            } else {
                                              context.pushWrapper(
                                                "/playing_detail",
                                              );
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (songSelectionState.selectionType)
                    SubSongSelectionBottom(songs: songs?.songs ?? []),
                ],
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
