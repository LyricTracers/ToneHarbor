import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/audio_player/song_selection_provider.dart';
import 'package:toneharbor/providers/providers.dart';

class SubSongSelectionTop extends HookConsumerWidget {
  final List<ToneHarborTrackObject> songs;
  final String playlistId;
  const SubSongSelectionTop({
    super.key,
    required this.songs,
    this.playlistId = '',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          ref.invalidate(songSelectionProvider);
        },
        icon: Icon(Icons.arrow_back_ios_sharp),
      ),
      centerTitle: true,
      title: Consumer(
        builder: (context, ref, child) {
          final selection = ref.watch(songSelectionProvider);
          return Text(
            l10n.selected_count.replaceFirst('%s', '${selection.ids.length}'),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          );
        },
      ),
      actions: [
        Text(
          l10n.select_all,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Consumer(
          builder: (context, ref, child) {
            final selection = ref.watch(songSelectionProvider);
            final selectableSongs = songs.where((song) => song.isSong).toList();
            return Checkbox(
              shape: const CircleBorder(),
              value: selection.ids.length == selectableSongs.length,
              onChanged: (b) {
                if (b == true) {
                  ref
                      .read(songSelectionProvider.notifier)
                      .selectAll(
                        selectableSongs.map((song) {
                          return song.id;
                        }).toSet(),
                      );
                } else {
                  ref.read(songSelectionProvider.notifier).deSelectAll();
                }
              },
            );
          },
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
