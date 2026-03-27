import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/sub_content_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/audio_player/download_manager.dart';
import 'package:toneharbor/providers/audio_player/song_selection_provider.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_utils.dart';

class SubSongSelectionBottom extends HookConsumerWidget {
  final List<ToneHarborTrackObject> songs;
  final bool isLocal;
  const SubSongSelectionBottom({
    super.key,
    required this.songs,
    this.isLocal = false,
  });

  bool _checkIdsEmpty(Set<String> ids, BuildContext context, WidgetRef ref) {
    if (ids.isEmpty) {
      if (context.mounted) {
        showSnackBar(
          ref.read(l10nProvider).no_selected_songs,
          context,
          getColorSchemeWhenReady(ref).secondary,
        );
      }
      return true;
    }
    return false;
  }

  bool _checkIdsLimit(
    Set<String> ids,
    int limit,
    BuildContext context,
    WidgetRef ref,
    String message,
  ) {
    if (ids.length > limit) {
      if (context.mounted) {
        showSnackBar(message, context, getColorSchemeWhenReady(ref).secondary);
      }
      return true;
    }
    return false;
  }

  List<ToneHarborTrackObject> _getSelectedTracks(Set<String> ids) {
    return ids
        .map((id) => songs.firstWhere((element) => element.id == id))
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    return AppBar(
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      actions: [
        if (!isLocal) ...[
          IconButton(
            onPressed: () {
              final ids = ref.read(songSelectionProvider).ids;
              if (_checkIdsEmpty(ids, context, ref)) return;
              ref.invalidate(songSelectionProvider);
              ref
                  .read(downloadManagerProvider.notifier)
                  .addAllToQueue(_getSelectedTracks(ids));
            },
            icon: const Icon(Icons.download_rounded, size: 18),
            tooltip: l10n.download,
          ),
          IconButton(
            onPressed: () async {
              final ids = ref.read(songSelectionProvider).ids;
              if (_checkIdsEmpty(ids, context, ref)) return;
              if (_checkIdsLimit(
                ids,
                100,
                context,
                ref,
                l10n.favorite_limit_exceeded,
              )) {
                return;
              }

              try {
                ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                final response = await ref
                    .read(songRatingProvider.notifier)
                    .setRatings(ids: ids, rating: 5);
                if (response.success) {
                  ref
                      .read(favoriteSongsProvider(limit: 50).notifier)
                      .invalidateCache();
                  ref.invalidate(favoriteSongsProvider);
                  ref.invalidate(songSelectionProvider);
                }
              } catch (e) {
                if (context.mounted) {
                  showSnackBarError(e, context, colorScheme.secondary);
                }
              } finally {
                ref.read(requestFlagProvider.notifier).setRequestFlag(false);
              }
            },
            icon: const Icon(Icons.favorite_rounded, size: 18),
            tooltip: l10n.favorite,
          ),
          IconButton(
            onPressed: () async {
              final ids = ref.read(songSelectionProvider).ids;
              if (_checkIdsEmpty(ids, context, ref)) return;
              if (_checkIdsLimit(
                ids,
                100,
                context,
                ref,
                l10n.cancel_favorite_limit_exceeded,
              )) {
                return;
              }

              try {
                ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                final response = await ref
                    .read(songRatingProvider.notifier)
                    .setRatings(ids: ids, rating: 0);
                if (response.success) {
                  ref
                      .read(favoriteSongsProvider(limit: 50).notifier)
                      .invalidateCache();
                  ref.invalidate(favoriteSongsProvider);
                  ref.invalidate(songSelectionProvider);
                }
              } catch (e) {
                if (context.mounted) {
                  showSnackBarError(e, context, colorScheme.secondary);
                }
              } finally {
                ref.read(requestFlagProvider.notifier).setRequestFlag(false);
              }
            },
            icon: const Icon(Icons.favorite_border_rounded, size: 18),
            tooltip: l10n.no_favorite_playlist,
          ),
          IconButton(
            onPressed: () {
              final ids = ref.read(songSelectionProvider).ids;
              if (_checkIdsEmpty(ids, context, ref)) return;
              if (_checkIdsLimit(
                ids,
                1000,
                context,
                ref,
                l10n.cancel_favorite_limit_exceeded,
              )) {
                return;
              }

              ref
                  .read(subContentProvider.notifier)
                  .set(
                    SubContentData(
                      type: SubContentType.addToPlayLists,
                      extra: ids.join(','),
                    ),
                  );
            },
            icon: const Icon(Icons.playlist_add_rounded, size: 18),
            tooltip: l10n.song_playlist,
          ),
        ],
        if (isLocal)
          IconButton(
            onPressed: () async {
              final ids = ref.read(songSelectionProvider).ids;
              if (_checkIdsEmpty(ids, context, ref)) return;
              if (_checkIdsLimit(
                ids,
                100,
                context,
                ref,
                l10n.cancel_favorite_limit_exceeded,
              )) {
                return;
              }

              await ref
                  .read(audioPlayerStateProvider.notifier)
                  .removeTracks(ids);
              await ref
                  .read(localSongsProvider.notifier)
                  .removeAllSongsByIds(ids);
              ref.invalidate(songSelectionProvider);
              ref.invalidate(localSongsProvider);
            },
            icon: const Icon(Icons.delete_forever_rounded, size: 18),
            tooltip: l10n.delete,
          ),
        IconButton(
          onPressed: () async {
            final ids = ref.read(songSelectionProvider).ids;
            if (_checkIdsEmpty(ids, context, ref)) return;
            if (_checkIdsLimit(
              ids,
              1000,
              context,
              ref,
              l10n.queue_limit_exceeded,
            )) {
              return;
            }

            final selectedTracks = _getSelectedTracks(ids);
            await ref
                .read(audioPlayerStateProvider.notifier)
                .addTracksAtFirst(selectedTracks, allowDuplicates: true);
            if (!audioPlayer.isPlaying) {
              var index =
                  audioPlayer.currentIndex < 0 ||
                      audioPlayer.currentIndex >= audioPlayer.sources.length
                  ? 0
                  : audioPlayer.currentIndex;
              await audioPlayer.jumpTo(index);
            }
            ref.invalidate(songSelectionProvider);
          },
          icon: const Icon(Icons.queue_play_next_rounded, size: 18),
          tooltip: l10n.next_song,
        ),
        IconButton(
          onPressed: () async {
            final ids = ref.read(songSelectionProvider).ids;
            if (_checkIdsEmpty(ids, context, ref)) return;
            if (_checkIdsLimit(
              ids,
              1000,
              context,
              ref,
              l10n.queue_limit_exceeded,
            )) {
              return;
            }

            final selectedTracks = _getSelectedTracks(ids);
            await ref
                .read(audioPlayerStateProvider.notifier)
                .addTracks(selectedTracks);
            if (!audioPlayer.isPlaying) {
              var index =
                  audioPlayer.currentIndex < 0 ||
                      audioPlayer.currentIndex >= audioPlayer.sources.length
                  ? 0
                  : audioPlayer.currentIndex;
              await audioPlayer.jumpTo(index);
            }
            ref.invalidate(songSelectionProvider);
          },
          icon: const Icon(Icons.queue_music_rounded, size: 18),
          tooltip: l10n.play_queue,
        ),

        const SizedBox(width: 15),
      ],
    );
  }
}
