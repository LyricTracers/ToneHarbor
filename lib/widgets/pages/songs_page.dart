import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';

class _SongItem extends StatelessWidget {
  final int index;
  final Song song;
  final ColorScheme colorScheme;
  final ValueChanged<WidgetRef> onTap;
  final AppLocalizations l10n;
  final bool isSelected;
  const _SongItem({
    required this.index,
    required this.song,
    required this.colorScheme,
    required this.isSelected,
    required this.l10n,
    required this.onTap,
  });
  static const double itemHeight = 56.0;

  @override
  Widget build(Object context) {
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
    final isFavorite = song.additional?.songRating?.rating == 5;
    return Ink(
      child: ListTile(
        autofocus: true,
        minTileHeight: itemHeight,
        hoverColor: colorScheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        horizontalTitleGap: 15,
        titleAlignment: ListTileTitleAlignment.center,
        leading: Text(
          '${index + 1}',
          style: TextStyle(fontSize: 14, color: colorScheme.primary),
        ),
        title: Text(
          song.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.onSurfaceVariant),
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
            Text(
              '$artist-$album',
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurfaceVariant,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            // ref.invalidate(favoriteSongsProvider(limit: 50));
          },
          icon: Icon(
            isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            size: 18,
          ),
        ),
        onTap: () => {logger.i('onTap $song')},
      ),
    );
  }
}

class SongsPage extends HookConsumerWidget {
  const SongsPage({
    super.key,
    required this.title,
    required this.baseProvider,
    required this.limitTotal,
  });

  final int limitTotal;
  final String title;
  final $AsyncNotifierProvider<
    ExtraProvider<SongListResponse>,
    SongListResponse
  >
  baseProvider;

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
                " (共$total首)",
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
    var selectedIndex = useState(0);

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
                    child: _SongItem(
                      index: index,
                      song: item,
                      isSelected: selectedIndex.value == index,
                      colorScheme: colorScheme,
                      l10n: l10n,
                      onTap: (ref) => {},
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

  static Future<void> loadMore({
    required WidgetRef ref,
    required ValueNotifier<bool> isLoadingMore,
    required $AsyncNotifierProvider<
      ExtraProvider<SongListResponse>,
      SongListResponse
    >
    baseProvider,
  }) async {
    isLoadingMore.value = true;
    try {
      await ref.read(baseProvider.notifier).loadMore();
    } finally {
      isLoadingMore.value = false;
    }
  }
}
