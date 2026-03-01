import 'dart:ui';

import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/playlist_list.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'playlist_provider.dependence.dart';
part 'playlist_provider.g.dart';

@riverpod
Future<RemoveMissingSongsResponse> removeMissingSongs(
  Ref ref, {
  required String id,
}) async {
  return await _removeMissingSongs(ref: ref, id: id);
}

@riverpod
Future<AddPlaylistSongsResponse> removeSongsFromPlaylist(
  Ref ref, {
  required String id,
  required int offset,
  required int limit,
}) async {
  return await _addSongToPlaylist(
    ref: ref,
    id: id,
    songId: '',
    offset: offset,
    limit: limit,
  );
}

@riverpod
Future<AddPlaylistSongsResponse> addSongsToPlaylist(
  Ref ref, {
  required String id,
  required List<String> songIds,
  int offset = -1,
  int limit = 0,
  bool skipDuplicate = false,
}) async {
  return await _addSongToPlaylist(
    ref: ref,
    id: id,
    songId: songIds.join(','),
    offset: offset,
    limit: limit,
    skipDuplicate: skipDuplicate,
  );
}

@riverpod
Future<AddPlaylistSongsResponse> addSongToPlaylist(
  Ref ref, {
  required String id,
  required String songId,
  int offset = -1,
  int limit = 0,
  bool skipDuplicate = false,
}) async {
  return await _addSongToPlaylist(
    ref: ref,
    id: id,
    songId: songId,
    offset: offset,
    limit: limit,
    skipDuplicate: skipDuplicate,
  );
}

@riverpod
Future<DeletePlaylistResponse> deletePlaylist(
  Ref ref, {
  required String id,
}) async {
  return await _deletePlaylist(ref: ref, id: id);
}

@riverpod
Future<RenamePlaylistResponse> renamePlaylist(
  Ref ref, {
  required String id,
  required String newName,
}) async {
  return await _renamePlaylist(ref: ref, id: id, newName: newName);
}

@riverpod
Future<CreatePlaylistResponse> createPlaylist(
  Ref ref, {
  required String name,
}) async {
  return await _createPlaylist(ref: ref, name: name);
}

@riverpod
Future<PlaylistListResponse> playlists(
  Ref ref, {
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = '',
  String sortDirection = 'ASC',
  Duration? cacheDuration = const Duration(minutes: 5),
}) async {
  return await _getPlaylists(
    ref: ref,
    limit: limit,
    offset: offset,
    library: library,
    sortBy: sortBy,
    sortDirection: sortDirection,
    cacheDuration: cacheDuration,
  );
}

@riverpod
Future<PlaylistDetailResponse> playlistDetail(
  Ref ref, {
  required String id,
  String library = 'shared',
  String additional = 'songs,song_tag,song_audio,song_rating,sharing_info',
  int limit = 100,
  int offset = 0,
  String sortBy = '',
  String sortDirection = 'ASC',
  Duration? cacheDuration = const Duration(minutes: 5),
}) async {
  return await _getPlaylistDetail(
    ref: ref,
    id: id,
    library: library,
    additional: additional,
    limit: limit,
    offset: offset,
    sortBy: sortBy,
    sortDirection: sortDirection,
    cacheDuration: cacheDuration,
  );
}

@riverpod
Future<PlaylistDetailResponse> playlistInfo(
  Ref ref, {
  required String id,
  String additional = 'songs',
  Duration? cacheDuration = const Duration(minutes: 5),
}) async {
  return await _getPlaylistInfo(
    ref: ref,
    id: id,
    additional: additional,
    cacheDuration: cacheDuration,
  );
}

@riverpod
class PlaylistsState extends _$PlaylistsState {
  @override
  PlaylistListResponse? build() {
    return null;
  }

  Future<void> fetchPlaylists({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = '',
    String sortDirection = 'ASC',
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    state = null;
    try {
      final response = await _getPlaylists(
        ref: ref,
        limit: limit,
        offset: offset,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        cacheDuration: cacheDuration,
      );
      state = response;
    } catch (e) {
      logger.e('获取播放列表失败: $e');
      rethrow;
    }
  }
}
