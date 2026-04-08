import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/cloud_music/cloud_music_provider.dart';

class CloudDetailPlaylistPage extends HookConsumerWidget {
  final int playlistId;

  const CloudDetailPlaylistPage({super.key, required this.playlistId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(cloudMusicPlaylistDetailProvider(playlistId));
    return Container();
  }
}
