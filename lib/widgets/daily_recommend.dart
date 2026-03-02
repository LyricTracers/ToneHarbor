import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/widgets.dart';

class DailyRecommend extends ConsumerWidget {
  const DailyRecommend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final randomSongs = ref.watch(randomSongsProvider(limit: 9, offset: 0));

    return randomSongs.when(
      data: (data) => _buildSongList(context, ref, data, colorScheme),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildSongList(
    BuildContext context,
    WidgetRef ref,
    SongListResponse response,
    ColorScheme colorScheme,
  ) {
    final songs = response.data?.songs ?? [];
    if (songs.isEmpty) {
      return const Center(child: Text('No songs'));
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final sidebarWidth = 230.0;
    final availableScreenWidth = screenWidth - sidebarWidth;
    final horizontalPadding = 32.0;
    final itemSpacing = 12.0;
    final minItemWidth = 280.0;

    final columns =
        ((availableScreenWidth - horizontalPadding) /
                (minItemWidth + itemSpacing))
            .floor()
            .clamp(2, 3);

    final displayCount = columns == 3 ? 9 : 6;
    final displaySongs = songs.take(displayCount).toList();

    final rows = 3;

    final authHeadersValue = ref.watch(authHeadersProvider);

    return authHeadersValue.when(
      data: (authHeaders) {
        return Column(
          children: List.generate(rows, (rowIndex) {
            final rowSongs = <Song>[];
            for (int col = 0; col < columns; col++) {
              final index = rowIndex + col * rows;
              if (index < displaySongs.length) {
                rowSongs.add(displaySongs[index]);
              }
            }

            return Padding(
              padding: EdgeInsets.only(bottom: rowIndex < rows - 1 ? 8 : 0),
              child: Row(
                children: rowSongs.map((song) {
                  return Expanded(
                    key: ValueKey(song.id),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: rowSongs.last == song ? 0 : itemSpacing,
                      ),
                      child: _buildSongItem(
                        context,
                        ref,
                        song,
                        colorScheme,
                        authHeaders ?? <String, String>{},
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildSongItem(
    BuildContext context,
    WidgetRef ref,
    Song song,
    ColorScheme colorScheme,
    Map<String, String> authHeaders,
  ) {
    final albumName = song.additional?.songTag?.album ?? '';
    final artistName = song.additional?.songTag?.artist ?? '';
    final songTitle = song.title;
    final albumArtistName = song.additional?.songTag?.albumArtist ?? '';

    final coverUrl = ref.watch(
      coverUrlProvider(albumName: albumName, albumArtistName: albumArtistName),
    );

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        hoverColor: colorScheme.surface.withValues(alpha: 0.3),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: coverUrl.when(
                  data: (url) {
                    if (url.isEmpty) {
                      return _buildPlaceholder(colorScheme, 48);
                    }
                    return ExtendedImage.network(
                      url,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      headers: authHeaders,
                      cache: true,
                      cacheKey: song.id,
                      clearMemoryCacheIfFailed: true,
                      loadStateChanged: (state) {
                        switch (state.extendedImageLoadState) {
                          case LoadState.loading:
                            return _buildPlaceholder(
                              colorScheme,
                              48,
                              isLoading: true,
                            );
                          case LoadState.completed:
                            return ExtendedRawImage(
                              image: state.extendedImageInfo?.image,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            );
                          case LoadState.failed:
                            return _buildPlaceholder(colorScheme, 48);
                        }
                      },
                    );
                  },
                  loading: () =>
                      _buildPlaceholder(colorScheme, 48, isLoading: true),
                  error: (error, stack) => _buildPlaceholder(colorScheme, 48),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmartMarquee(
                        text: albumName.isNotEmpty
                            ? albumName
                            : 'Unknown Album',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 2),
                      SmartMarquee(
                        text: '$artistName - $songTitle',
                        style: TextStyle(
                          fontSize: 11,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Icon(Icons.play_circle_outline, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(
    ColorScheme colorScheme,
    double size, {
    bool isLoading = false,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.onSurface.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isLoading
          ? Center(
              child: SizedBox(
                width: size * 0.4,
                height: size * 0.4,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colorScheme.onSurface,
                ),
              ),
            )
          : Icon(
              Icons.music_note,
              size: size * 0.4,
              color: colorScheme.onSurface,
            ),
    );
  }
}
