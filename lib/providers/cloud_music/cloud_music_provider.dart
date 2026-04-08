import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/artists.dart';
import 'package:toneharbor/services/cloud_music/playlists.dart';
import 'package:toneharbor/services/cloud_music/user.dart';
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
  Duration? cacheDuration = const Duration(minutes: 60),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  final apiState = ref.watch(cloudMusicApiUrlsProvider);
  final loginState = ref.watch(cloudMusicAuthStateProvider);
  if (apiState.defaultUrl.isNotEmpty) {
    try {
      if (loginState) {
        final playlists = await Future.wait([
          dailyRecommendPlaylist(ref, cacheDuration: cacheDuration),
          recommendPlaylist(ref, limit: limit, cacheDuration: cacheDuration),
        ]);
        final dailyRecommend = playlists[0];
        final recommend = playlists[1];
        return [...dailyRecommend, ...recommend].take(limit).toList();
      } else {
        return await recommendPlaylist(
          ref,
          limit: limit,
          cacheDuration: cacheDuration,
        );
      }
    } finally {
      if (keepAliveDuration == null) {
        link.close();
      }
    }
  }
  return const [];
}

@riverpod
Future<List<CloudMusicArtist>> recommendTopArtist(
  Ref ref, {
  int limit = 6,
  Duration? cacheDuration = const Duration(minutes: 60),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  final apiState = ref.watch(cloudMusicApiUrlsProvider);
  final type = ref.read(cloudMusicLanguageProvider);
  if (apiState.defaultUrl.isNotEmpty) {
    try {
      final artists = await toplistOfArtists(
        ref,
        type: type.value,
        cacheDuration: cacheDuration,
      );
      if (artists.length <= limit) {
        return artists;
      }
      final indices = <int>{};
      final random = Random();
      while (indices.length < limit) {
        indices.add(random.nextInt(artists.length));
      }
      return indices.map((i) => artists[i]).toList();
    } finally {
      if (keepAliveDuration == null) {
        link.close();
      }
    }
  }
  return const [];
}

@riverpod
class CloudMusicPlaylistDetail extends _$CloudMusicPlaylistDetail {
  @override
  Future<CloudMusicPlaylistDetailData?> build(int playlistId) async {
    ref.keepAliveFor(Duration(minutes: 1));
    return await getPlaylistDetail(ref, id: playlistId);
  }

  Future<void> loadMore({int loadNum = 100}) async {
    final current = state.value;
    if (current == null) return;

    final trackIds = current.trackIds;
    final tracks = current.tracks ?? [];

    if (trackIds == null || tracks.length >= trackIds.length) return;

    final startIndex = tracks.length;
    final endIndex = (startIndex + loadNum).clamp(0, trackIds.length);

    if (startIndex >= endIndex) return;

    final idsToLoad = trackIds
        .sublist(startIndex, endIndex)
        .map((t) => t.id)
        .toList();

    if (idsToLoad.isEmpty) return;

    state = const AsyncValue.loading();

    try {
      final response = await getTrackDetail(ref, ids: idsToLoad);
      final newTracks = response.songs;

      state = AsyncValue.data(
        current.copyWith(tracks: [...tracks, ...newTracks]),
      );
    } catch (e) {
      state = AsyncValue.data(current);
    }
  }

  bool get hasMore {
    final current = state.value;
    if (current == null || current.trackIds == null) return false;
    final tracks = current.tracks ?? [];
    return tracks.length < current.trackIds!.length;
  }

  int get totalTracks {
    final current = state.value;
    if (current == null || current.trackIds == null) return 0;
    return current.trackIds!.length;
  }

  int get loadedTracks {
    final current = state.value;
    if (current == null) return 0;
    return current.tracks?.length ?? 0;
  }
}

@keepAlive
class CloudUserInfo extends _$CloudUserInfo {
  @override
  Future<CloudMusicUser?> build() async {
    final loginState = ref.watch(cloudMusicAuthStateProvider);
    if (loginState) {
      return getUserInfo(ref);
    }
    return null;
  }
}
