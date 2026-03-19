import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/sub_content_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/audio_player/song_selection_provider.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

class SubSongSelectionBottom extends HookConsumerWidget {
  final List<Song> songs;
  const SubSongSelectionBottom({super.key, required this.songs});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    return AppBar(
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            final ids = ref.read(songSelectionProvider).ids;
            if (ids.isEmpty) {
              if (ref.context.mounted) {
                showSnackBar("当前没有选择的歌曲！", ref.context, colorScheme.secondary);
              }
              return;
            }
            ref.invalidate(songSelectionProvider);
          },
          icon: const Icon(Icons.download_rounded, size: 18),
          tooltip: "下载",
        ),
        IconButton(
          onPressed: () async {
            final ids = ref.read(songSelectionProvider).ids;
            if (ids.isEmpty) {
              if (ref.context.mounted) {
                showSnackBar("当前没有选择的歌曲！", ref.context, colorScheme.secondary);
              }
              return;
            }
            if (ids.length > 100) {
              if (ref.context.mounted) {
                showSnackBar(
                  "一次性收藏歌曲数量已经大于100！",
                  ref.context,
                  colorScheme.secondary,
                );
              }
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
              if (ref.context.mounted) {
                showSnackBarError(e, ref.context, colorScheme.secondary);
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
            if (ids.isEmpty) {
              if (ref.context.mounted) {
                showSnackBar("当前没有选择的歌曲！", ref.context, colorScheme.secondary);
              }
              return;
            }
            if (ids.length > 100) {
              if (ref.context.mounted) {
                showSnackBar(
                  "一次性取消收藏歌曲数量已经大于100！",
                  ref.context,
                  colorScheme.secondary,
                );
              }
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
              if (ref.context.mounted) {
                showSnackBarError(e, ref.context, colorScheme.secondary);
              }
            } finally {
              ref.read(requestFlagProvider.notifier).setRequestFlag(false);
            }
          },
          icon: const Icon(Icons.favorite_border_rounded, size: 18),
          tooltip: l10n.no_favorite_playlist,
        ),
        IconButton(
          onPressed: () async {
            final ids = ref.read(songSelectionProvider).ids;
            if (ids.isEmpty) {
              if (ref.context.mounted) {
                showSnackBar("当前没有选择的歌曲！", ref.context, colorScheme.secondary);
              }
              return;
            }
            if (ids.length > 1000) {
              if (ref.context.mounted) {
                showSnackBar(
                  "一次性添加播放队列数量已经大于1000！",
                  ref.context,
                  colorScheme.secondary,
                );
              }
              return;
            }
            final songMap = <String, Song>{
              for (var song in songs) song.id: song,
            };
            final selectedTracks = ids
                .map((id) => songMap[id]?.asTrack())
                .whereType<ToneHarborTrackObject>()
                .toList();
            await ref
                .read(audioPlayerStateProvider.notifier)
                .addTracksAtFirst(selectedTracks, allowDuplicates: true);
            ref.invalidate(songSelectionProvider);
          },
          icon: const Icon(Icons.queue_play_next_rounded, size: 18),
          tooltip: l10n.next_song,
        ),
        IconButton(
          onPressed: () async {
            final ids = ref.read(songSelectionProvider).ids;
            if (ids.isEmpty) {
              if (ref.context.mounted) {
                showSnackBar("当前没有选择的歌曲！", ref.context, colorScheme.secondary);
              }
              return;
            }
            if (ids.length > 1000) {
              if (ref.context.mounted) {
                showSnackBar(
                  "一次性添加播放队列数量已经大于1000！",
                  ref.context,
                  colorScheme.secondary,
                );
              }
              return;
            }
            final songMap = <String, Song>{
              for (var song in songs) song.id: song,
            };
            final selectedTracks = ids
                .map((id) => songMap[id]?.asTrack())
                .whereType<ToneHarborTrackObject>()
                .toList();
            await ref
                .read(audioPlayerStateProvider.notifier)
                .addTracks(selectedTracks);
            ref.invalidate(songSelectionProvider);
          },
          icon: const Icon(Icons.queue_music_rounded, size: 18),
          tooltip: l10n.play_queue,
        ),
        IconButton(
          onPressed: () {
            final ids = ref.read(songSelectionProvider).ids;
            if (ids.isEmpty) {
              if (ref.context.mounted) {
                showSnackBar("当前没有选择的歌曲！", ref.context, colorScheme.secondary);
              }
              return;
            }
            if (ids.length > 100) {
              if (ref.context.mounted) {
                showSnackBar(
                  "一次性取消收藏歌曲数量已经大于100！",
                  ref.context,
                  colorScheme.secondary,
                );
              }
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
        SizedBox(width: 15),
      ],
    );
  }
}
