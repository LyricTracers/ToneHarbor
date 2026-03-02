import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/widgets.dart';

class RecommendPage extends BaseContentPage {
  const RecommendPage({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.recommend,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      centerTitle: false,
      toolbarOpacity: 0.5,
    );
  }

  @override
  Widget buildContent(BuildContext context, WidgetRef ref) {
    var colorScheme = getColorSchemeWhenReady(ref);
    final randomSongs = ref.watch(randomSongsProvider(limit: 9, offset: 0));
    final i10n = getValueWhenReadyWithWidgetRef(
      ref,
      l10nProvider,
      AppLocalizations.of(context),
    )!;

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
                  top: 16,
                  bottom: 8,
                ),
                child: Text(
                  i10n.daily_recommend,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
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
              randomSongs.when(
                data: (data) => _buildSongList(context, ref, data, colorScheme),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ],
          ),
        ),
      ),
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
                child: Padding(
                  padding: EdgeInsets.only(
                    right: rowSongs.last == song ? 0 : itemSpacing,
                  ),
                  child: _buildSongItem(context, ref, song, colorScheme),
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }

  Widget _buildSongItem(
    BuildContext context,
    WidgetRef ref,
    Song song,
    ColorScheme colorScheme,
  ) {
    final albumName = song.additional?.songTag?.album ?? '';
    final artistName = song.additional?.songTag?.artist ?? '';
    final songTitle = song.title;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        hoverColor: colorScheme.surface.withValues(alpha: 0.3),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          // TODO: 播放歌曲
        },
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FutureBuilder<Uint8List>(
                  future: downloadCover(
                    ref: ref,
                    albumName: albumName,
                    albumArtistName:
                        song.additional?.songTag?.albumArtist ?? '',
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Image.memory(
                        snapshot.data!,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildPlaceholder(colorScheme, 48),
                      );
                    }
                    return _buildPlaceholder(colorScheme, 48);
                  },
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
              Icon(
                Icons.play_circle_outline,
                color: colorScheme.primary,
                size: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(ColorScheme colorScheme, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.music_note,
        size: size * 0.4,
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
