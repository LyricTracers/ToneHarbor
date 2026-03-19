import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';
import 'package:toneharbor/widgets/components/song_context_menu.dart';
import 'package:toneharbor/widgets/components/song_item.dart';

part 'songs_page_action.dart';

class SongsPage<T extends ExtraProvider<SongListResponse>>
    extends HookConsumerWidget {
  const SongsPage({
    super.key,
    required this.title,
    required this.baseProvider,
    required this.limitTotal,
    this.sortAction = SongsPageSortAction.none,
  });

  final int limitTotal;
  final String title;
  final $AsyncNotifierProvider<T, SongListResponse> baseProvider;
  final SongsPageSortAction sortAction;

  PreferredSizeWidget _buildAppBar(
    WidgetRef ref,
    ColorScheme colorScheme,
    int total,
  ) {
    final l10n = ref.watch(l10nProvider);
    return AppBar(
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
        Container(
          constraints: BoxConstraints(maxWidth: 200, maxHeight: 35),
          child: SearchAnchor.bar(
            suggestionsBuilder: (context, ref) => [],
            barHintStyle: WidgetStateProperty.all(TextStyle(fontSize: 14)),
            barHintText: l10n.searchHint,
            barLeading: Icon(Icons.search, size: 18),
          ),
        ),
        SizedBox(width: 16),
        _buildSortAction(ref, l10n),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_rounded, size: 18),
        ),
      ],
      centerTitle: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final scrollController = useScrollController();
    final l10n = ref.watch(l10nProvider);
    var songs = ref.watch(baseProvider);
    var total = songs.value?.data?.total ?? 0;
    if (limitTotal > 0 && total > limitTotal) {
      total = limitTotal;
    }
    final songItems = songs.value?.data?.songs ?? [];
    final hasMore = songItems.length < total;
    final isLoadingMore = useState(false);
    final activeTrack = ref.watch(audioPlayerStateProvider).activeTrack;
    final activeSongId = activeTrack?.id;
    final songRating = ref.watch(songRatingProvider);

    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        final state = ref.read(baseProvider);
        final currentSongs = state.value?.data?.songs ?? [];
        var currentTotal = state.value?.data?.total ?? 0;
        if (limitTotal > 0 && total > limitTotal) {
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
        _buildAppBar(ref, colorScheme, total),
        Expanded(
          child: songs.when(
            data: (data) {
              if (songItems.isEmpty) {
                return const Center(child: Text('No songs'));
              }
              return ListView.builder(
                controller: scrollController,
                itemCount: songItems.length + (hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == songItems.length) {
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
                  var item = songItems[index];
                  return RepaintBoundary(
                    child: ContextMenuRegion(
                      contextMenu: ContextMenu(
                        entriesBuilder: () =>
                            SongContextMenu.build(ref, colorScheme, l10n, item),
                        padding: const EdgeInsets.all(8.0),
                      ),
                      child: SongItem(
                        key: ValueKey(index),
                        index: index,
                        song: songItems[index],
                        activeSongId: activeSongId,
                        colorScheme: colorScheme,
                        l10n: l10n,
                        isFavorite: songRating.contains(item.id),
                        onTap: () async {
                          await ref
                              .read(audioPlayerStateProvider.notifier)
                              .load(
                                songItems.asTrackList(),
                                initialIndex: index,
                                autoPlay: true,
                              );
                          if (context.mounted) context.push("/playing_detail");
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
      ],
    );
  }
}
