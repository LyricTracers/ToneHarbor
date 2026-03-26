import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/sub_content_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';

import 'package:toneharbor/providers/audio_player/download_manager.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

class SongContextMenu {
  static List<ContextMenuEntry> build(
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
    ToneHarborTrackObject item, {
    bool isLocal = false,
  }) {
    final itemId = item.id;
    final itemTitle = item.title;

    final songRating = ref.read(songRatingProvider);
    final isFavorite = songRating.contains(itemId);

    final entries = <ContextMenuEntry>[
      MenuHeader(text: itemTitle),
      MenuDivider(),
    ];

    if (isLocal || item.isLocal) {
      final localSongsNotifier = ref.read(localSongsProvider.notifier);
      final localSong = localSongsNotifier.getLocalSong(itemId);
      final availableQualities = localSongsNotifier.getAvailableQualities(
        itemId,
      );
      if (localSong != null) {
        if (availableQualities.length > 1) {
          entries.add(
            MenuItem.submenu(
              label: Text(l10n.delete),
              icon: const Icon(Icons.delete_forever),
              items: [
                MenuItem(
                  label: Text(l10n.select_all),
                  onSelected: (value) async {
                    final track = localSong.toTrack();
                    if (track != null) {
                      await ref
                          .read(audioPlayerStateProvider.notifier)
                          .removeAllTracksById(track.id);
                      await ref
                          .read(localSongsProvider.notifier)
                          .removeAllSongs(track.id);
                      ref.invalidate(localSongsProvider);
                    }
                  },
                ),
                ...availableQualities.map((quality) {
                  return MenuItem(
                    label: Text(quality.label),
                    onSelected: (value) async {
                      final track = localSong.toTrack(quality: quality);
                      if (track != null) {
                        await ref
                            .read(audioPlayerStateProvider.notifier)
                            .removeAllTracksById(track.id);
                        await ref
                            .read(localSongsProvider.notifier)
                            .removeSong(track.id, quality);
                      }
                    },
                  );
                }),
              ],
            ),
          );
        } else if (availableQualities.length == 1) {
          entries.add(
            MenuItem(
              label: Text(l10n.delete),
              icon: Icon(Icons.delete_forever_rounded),
              onSelected: (value) async {
                final track = localSong.toTrack();
                if (track != null) {
                  await ref
                      .read(audioPlayerStateProvider.notifier)
                      .removeAllTracksById(track.id);
                  await ref
                      .read(localSongsProvider.notifier)
                      .removeSong(track.id, availableQualities[0]);
                }
              },
            ),
          );
        }
      }
    } else {
      entries.addAll([
        MenuItem(
          label: Text(isFavorite ? l10n.no_favorite_playlist : l10n.favorite),
          icon: Icon(
            isFavorite ? Icons.favorite_border_rounded : Icons.favorite_rounded,
          ),
          onSelected: (value) async {
            try {
              ref.read(requestFlagProvider.notifier).setRequestFlag(true);
              final response = await ref
                  .read(songRatingProvider.notifier)
                  .setRating(id: itemId, rating: isFavorite ? 0 : 5);
              if (response.success) {
                ref
                    .read(favoriteSongsProvider(limit: 50).notifier)
                    .invalidateCache();
                ref.invalidate(favoriteSongsProvider);
              }
            } catch (e) {
              if (ref.context.mounted) {
                showSnackBarError(e, ref.context, colorScheme.secondary);
              }
            } finally {
              ref.read(requestFlagProvider.notifier).setRequestFlag(false);
            }
          },
        ),
        MenuItem(
          label: Text(l10n.download),
          icon: Icon(Icons.download_rounded),
          onSelected: (value) async {
            ref.read(downloadManagerProvider.notifier).addToQueue(item);
          },
        ),
        MenuItem.submenu(
          label: Text(l10n.add_to),
          icon: const Icon(Icons.add_box_rounded),
          items: [
            MenuItem(
              label: Text(l10n.next_song),
              onSelected: (value) async {
                await ref
                    .read(audioPlayerStateProvider.notifier)
                    .addTrackAtFirst(item, allowDuplicates: true);
              },
            ),
            MenuItem(
              label: Text(l10n.play_queue),
              onSelected: (value) async {
                await ref
                    .read(audioPlayerStateProvider.notifier)
                    .addTrack(item);
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
                        extra: itemId,
                      ),
                    );
              },
            ),
          ],
        ),
      ]);
    }

    return entries;
  }
}
