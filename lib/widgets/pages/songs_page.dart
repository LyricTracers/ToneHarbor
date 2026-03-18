import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/sub_content_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';

part 'songs_page_action.dart';

class _SongItem extends HookConsumerWidget {
  final int index;
  final Song song;
  final ColorScheme colorScheme;
  final ValueChanged<WidgetRef> onTap;
  final AppLocalizations l10n;
  final String? activeSongId;
  final bool isFavorite;
  const _SongItem({
    required this.index,
    required this.song,
    required this.activeSongId,
    required this.colorScheme,
    required this.l10n,
    required this.onTap,
    required this.isFavorite,
  });
  static const double itemHeight = 66.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bitrate = ((song.additional?.songAudio?.bitrate ?? 0) / 1000).round();
    var container = song.additional?.songAudio?.container;
    if (container == null || container.isEmpty) {
      container = 'mp3';
    }
    var artist = song.additional?.songTag?.artist;
    if (artist == null || artist.isEmpty) {
      artist = song.additional?.songTag?.albumArtist;
    }
    if (artist == null || artist.isEmpty) {
      artist = 'Unknown Artist';
    }
    var album = song.additional?.songTag?.album;
    if (album == null || album.isEmpty) {
      album = 'Unknown Album';
    }
    var isHovered = useState(false);
    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Stack(
        children: [
          if (isFavorite)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  l10n.favorite,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Container(
            height: itemHeight,
            color: isHovered.value
                ? colorScheme.outline.withValues(alpha: .1)
                : Colors.transparent,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTap: () => onTap(ref),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    activeSongId == song.id
                        ? SvgPicture.string(
                            placeholderErrorIconString,
                            width: 24,
                            height: 24,
                            fit: BoxFit.fitWidth,
                            colorFilter: ColorFilter.mode(
                              colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 14,
                              color: colorScheme.primary,
                            ),
                          ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            song.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '$container ${bitrate}k',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  '$artist-$album',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    final songRating = ref.watch(songRatingProvider);

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
                        entriesBuilder: () {
                          var playlistId = item.id;
                          var songRating = ref.read(songRatingProvider);
                          var isFavorite = songRating.contains(playlistId);
                          return <ContextMenuEntry>[
                            MenuHeader(text: item.title),
                            MenuDivider(),
                            MenuItem(
                              label: Text(
                                isFavorite
                                    ? l10n.no_favorite_playlist
                                    : l10n.favorite,
                              ),
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite_border_rounded
                                    : Icons.favorite_rounded,
                              ),
                              onSelected: (value) async {
                                try {
                                  ref
                                      .read(requestFlagProvider.notifier)
                                      .setRequestFlag(true);
                                  SetRatingResponse response;
                                  if (isFavorite) {
                                    response = await ref
                                        .read(songRatingProvider.notifier)
                                        .setRating(id: playlistId, rating: 0);
                                  } else {
                                    response = await ref
                                        .read(songRatingProvider.notifier)
                                        .setRating(id: playlistId, rating: 5);
                                  }
                                  if (response.success) {
                                    ref
                                        .read(
                                          favoriteSongsProvider(
                                            limit: 50,
                                          ).notifier,
                                        )
                                        .invalidateCache();
                                    ref.invalidate(favoriteSongsProvider);
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
                            MenuItem.submenu(
                              label: Text(l10n.add_to),
                              icon: Icon(Icons.add_box_rounded),
                              items: [
                                MenuItem(
                                  label: Text(l10n.next_song),
                                  onSelected: (value) async {
                                    await ref
                                        .read(audioPlayerStateProvider.notifier)
                                        .addTracksAtFirst(
                                          [item].asTrackList(),
                                          allowDuplicates: true,
                                        );
                                  },
                                ),
                                MenuItem(
                                  label: Text(l10n.next_song),
                                  onSelected: (value) async {
                                    await ref
                                        .read(audioPlayerStateProvider.notifier)
                                        .addTracks([item].asTrackList());
                                  },
                                ),
                                MenuItem(
                                  label: Text(l10n.song_playlist),
                                  onSelected: (value) {
                                    ref
                                        .read(subContentProvider.notifier)
                                        .set(
                                          SubContentData(
                                            type: SubContentType.addToPlayLists,
                                            extra: item.id,
                                          ),
                                        );
                                  },
                                ),
                              ],
                            ),
                          ];
                        },
                        padding: const EdgeInsets.all(8.0),
                      ),
                      child: _SongItem(
                        index: index,
                        song: item,
                        activeSongId: activeSongId,
                        colorScheme: colorScheme,
                        l10n: l10n,
                        isFavorite: songRating.contains(item.id),
                        onTap: (ref) async => {
                          await ref
                              .read(audioPlayerStateProvider.notifier)
                              .load(
                                songItems.asTrackList(),
                                initialIndex: index,
                                autoPlay: true,
                              ),
                          if (context.mounted) context.push("/playing_detail"),
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
