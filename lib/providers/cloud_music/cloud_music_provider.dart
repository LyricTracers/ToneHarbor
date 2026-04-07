import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/playlists.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'cloud_music_provider.g.dart';

@riverpod
bool shouldUseCloudMusicHome(Ref ref) {
  final apiState = ref.watch(cloudMusicApiUrlsProvider);
  return apiState.useAsHome && apiState.defaultUrl.isNotEmpty;
}

@riverpod
Future<List<CloudMusicPlaylist>> recommendPlaylists(
  Ref ref, {
  int limit = 10,
  Duration? cacheDuration = const Duration(minutes: 30),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  final apiState = ref.watch(cloudMusicApiUrlsProvider);
  if (apiState.defaultUrl.isNotEmpty) {
    try {
      return await recommendPlaylist(
        ref,
        limit: limit,
        cacheDuration: cacheDuration,
      );
    } finally {
      if (keepAliveDuration != null) {
        link.close();
      }
    }
  }
  return const [];
}
