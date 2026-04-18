import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/pages/add_to_playlists_page.dart';

class SongContextMenu {
  static List<ContextMenuEntry> build(
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
    Size size,
    ToneHarborTrackObject item, {
    String playlistId = '',
    int index = -1,
  }) {
    final itemId = item.id;
    final itemTitle = item.title;
    bool isFavorite;
    if (item is ToneHarborTrackObjectCloudMusic) {
      final cloudLike = ref.watch(cloudLikelistStateProvider);
      isFavorite = cloudLike.value?.contains(itemId) ?? false;
    } else {
      final songRating = ref.read(songRatingProvider);
      isFavorite = songRating.contains(itemId);
    }

    final entries = <ContextMenuEntry>[
      MenuHeader(text: itemTitle),
      MenuDivider(),
    ];

    if (item is ToneHarborTrackObjectMultLocal) {
      final availableQualities = item.availableQualities;
      if (availableQualities.length > 1) {
        entries.add(
          MenuItem.submenu(
            label: Text(l10n.delete),
            icon: const Icon(Icons.delete_forever),
            items: [
              MenuItem(
                label: Text(l10n.select_all),
                onSelected: (value) async {
                  ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                  await ref
                      .read(audioPlayerStateProvider.notifier)
                      .removeAllTracksById(itemId);
                  await ref
                      .read(localSongsProvider.notifier)
                      .removeAllSongs(item);
                  ref.invalidate(localSongsProvider);
                  ref.read(requestFlagProvider.notifier).setRequestFlag(false);
                },
              ),
              ...availableQualities.map((quality) {
                return MenuItem(
                  label: Text(quality.localizedLabel(l10n)),
                  onSelected: (value) async {
                    ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                    await ref
                        .read(audioPlayerStateProvider.notifier)
                        .removeAllTracksById(itemId);
                    await ref
                        .read(localSongsProvider.notifier)
                        .removeSong(item, quality);
                    ref
                        .read(requestFlagProvider.notifier)
                        .setRequestFlag(false);
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
              ref.read(requestFlagProvider.notifier).setRequestFlag(true);
              await ref
                  .read(audioPlayerStateProvider.notifier)
                  .removeAllTracksById(itemId);
              await ref
                  .read(localSongsProvider.notifier)
                  .removeSong(item, availableQualities[0]);
              ref.read(requestFlagProvider.notifier).setRequestFlag(false);
            },
          ),
        );
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
              if (item is ToneHarborTrackObjectCloudMusic) {
                await ref
                    .read(cloudLikelistStateProvider.notifier)
                    .updateLike(item);
              } else {
                final response = await ref
                    .read(songRatingProvider.notifier)
                    .setRating(id: itemId, rating: isFavorite ? 0 : 5);
                if (response.success) {
                  ref
                      .read(favoriteSongsProvider(limit: 50).notifier)
                      .invalidateCache();
                  ref.invalidate(favoriteSongsProvider);
                }
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
            ref.read(requestFlagProvider.notifier).setRequestFlag(true);
            await ref.read(downloadManagerProvider.notifier).addToQueue(item);
            ref.read(requestFlagProvider.notifier).setRequestFlag(false);
          },
        ),
        MenuItem.submenu(
          label: Text(l10n.add_to),
          icon: const Icon(Icons.add_box_rounded),
          items: [
            MenuItem(
              label: Text(l10n.next_song),
              onSelected: (value) async {
                ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                await ref
                    .read(audioPlayerStateProvider.notifier)
                    .addTrackAtFirst(item, allowDuplicates: true);
                ref.read(requestFlagProvider.notifier).setRequestFlag(false);
              },
            ),
            MenuItem(
              label: Text(l10n.play_queue),
              onSelected: (value) async {
                ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                await ref
                    .read(audioPlayerStateProvider.notifier)
                    .addTrack(item);
                ref.read(requestFlagProvider.notifier).setRequestFlag(false);
              },
            ),
            if (item is! ToneHarborTrackObjectCloudMusic)
              MenuItem(
                label: Text(l10n.song_playlist),
                onSelected: (value) {
                  if (size.mdAndUp) {
                    showSlidePanel(
                      context: ref.context,
                      builder: (context) => AddToPlaylistsPage(itemId),
                    );
                  } else {
                    showModalBottomSheetWidget(
                      ref.context,
                      colorScheme,
                      (context) => AddToPlaylistsPage(itemId),
                    );
                  }
                },
              ),
          ],
        ),
        if (playlistId.isNotEmpty && index != -1)
          MenuItem(
            label: Text(l10n.remove_from_playlist),
            icon: Icon(Icons.playlist_remove_rounded),
            onSelected: (value) async {
              try {
                ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                var result = await ref
                    .read(playlistStateProvider.notifier)
                    .removeSongsFromPlaylist(
                      id: playlistId,
                      offset: index,
                      limit: 1,
                    );
                if (result.success) {
                  await clearCacheByGroupKey(groupKey: "playlistDetail");
                  ref.invalidate(playlistDetailProvider);
                }
              } catch (e) {
                final context = ref.context;
                if (context.mounted) {
                  if (e is AudioStationException) {
                    showSnackBar(e.message, context, colorScheme.secondary);
                  } else {
                    showSnackBar(e.toString(), context, colorScheme.secondary);
                  }
                }
              } finally {
                ref.read(requestFlagProvider.notifier).setRequestFlag(false);
              }
            },
          ),
        if (item is ToneHarborTrackObjectCloudMusic) ...[
          MenuDivider(),
          if (item.ar != null && item.ar!.isNotEmpty) ...[
            if (item.ar!.length == 1) ...[
              MenuItem(
                label: Text(item.ar![0].name),
                icon: const Icon(Icons.person_rounded),
                onSelected: (value) async {
                  ref.context.pushWrapper(
                    "/cloud-artist-detail",
                    extra: item.ar![0],
                  );
                },
              ),
            ],
            if (item.ar!.length > 1) ...[
              MenuItem.submenu(
                label: Text(l10n.artist_profile),
                icon: const Icon(Icons.person_rounded),
                items: [
                  ...item.ar!.map(
                    (artist) => MenuItem(
                      icon: const Icon(Icons.person_rounded),
                      label: Text(artist.name),
                      onSelected: (value) async {
                        ref.context.pushWrapper(
                          "/cloud-artist-detail",
                          extra: artist,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ],

          if (item.al != null && item.al!.name.isNotEmpty)
            MenuItem(
              label: Text(item.al!.name),
              icon: const Icon(Icons.album_rounded, size: 18),
              onSelected: (value) {
                ref.context.pushWrapper("/cloud-album-detail", extra: item.al);
              },
            ),
        ],
      ]);
    }

    return entries;
  }
}
