import 'package:lyricskit/lyricskit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/playlist_list.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'playlist_provider.g.dart';
part 'playlist_provider.dependence.dart';

@riverpod
class PlaylistResponseNotifier extends _$PlaylistResponseNotifier
    with ExtraProvider<PlaylistListResponse> {
  @override
  Future<PlaylistListResponse> build({
    int limit = 100,
    int offset = 0,
    String library = 'all',
    String sortBy = '',
    String sortDirection = 'ASC',
  }) async {
    ref.keepAliveFor(const Duration(minutes: 5));
    duration = const Duration(minutes: 30);
    groupKey = 'playlist';
    if (extraSortBy.isEmpty && extraSortDirection.isEmpty) {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
    return await _getPlaylists(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: extraSortBy,
      sortDirection: extraSortDirection,
      cacheDuration: duration,
      groupKey: groupKey,
    );
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {
    if (extraSortBy == sortBy && extraSortDirection == sortDirection) {
      return;
    }

    final oldState = state.value;
    state = AsyncLoading();
    try {
      final newState = await _getPlaylists(
        ref: ref,
        limit: limit,
        offset: 0,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        cacheDuration: duration,
        groupKey: groupKey,
      );
      state = AsyncData(newState);
    } catch (e) {
      logger.e('set Sort playlists失败: $e');
      state = AsyncData(oldState!);
    } finally {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value!.data;
    if (currentData == null) return;

    final currentTotal = currentData.total;
    final currentPlaylists = currentData.playlists ?? [];

    if (currentPlaylists.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newState = await _getPlaylists(
        ref: ref,
        limit: limit,
        offset: currentPlaylists.length,
        library: library,
        sortBy: extraSortBy,
        sortDirection: extraSortDirection,
        cacheDuration: duration,
        groupKey: groupKey,
      );

      final newPlaylists = newState.data?.playlists ?? [];
      final mergedPlaylists = [...currentPlaylists, ...newPlaylists];

      state = AsyncData(
        newState.copyWith(
          data: newState.data?.copyWith(
            playlists: mergedPlaylists,
            total: currentTotal,
          ),
        ),
      );
    } catch (e) {
      logger.e('加载更多播放列表失败: $e');
      state = AsyncData(oldState!);
    }
  }
}

@riverpod
class PlaylistDetail extends _$PlaylistDetail
    with ExtraProvider<SongListResponse> {
  @override
  Future<SongListResponse> build({
    required String id,
    String library = 'shared',
    String additional =
        'songs_song_tag,songs_song_audio,songs_song_rating,sharing_info',
    int limit = 100,
    int offset = 0,
    String sortBy = '',
    String sortDirection = 'ASC',
  }) async {
    ref.keepAliveFor(const Duration(minutes: 5));
    duration = const Duration(minutes: 30);
    groupKey = 'playlist';
    if (extraSortBy.isEmpty && extraSortDirection.isEmpty) {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
    var result = await _getPlaylistDetail(
      ref: ref,
      id: id,
      library: library,
      additional: additional,
      limit: limit,
      offset: offset,
      sortBy: extraSortBy,
      sortDirection: extraSortDirection,
      groupKey: groupKey,
      cacheDuration: duration,
    );
    return result.toSongListResponse();
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {
    if (extraSortBy == sortBy && extraSortDirection == sortDirection) {
      return;
    }

    final oldState = state.value;
    state = AsyncLoading();
    try {
      final result = await _getPlaylistDetail(
        ref: ref,
        id: id,
        library: library,
        additional: additional,
        limit: limit,
        offset: offset,
        sortBy: sortBy,
        sortDirection: sortDirection,
        groupKey: groupKey,
        cacheDuration: duration,
      );
      state = AsyncData(result.toSongListResponse());
    } catch (e) {
      logger.e('set Sort playlists失败: $e');
      state = AsyncData(oldState!);
    } finally {
      extraSortBy = sortBy;
      extraSortDirection = sortDirection;
    }
  }

  @override
  Future<void> loadMore() async {
    if (state.value == null) return;
    final currentData = state.value!.data;
    if (currentData == null) return;

    final currentTotal = currentData.total ?? 0;
    final currentSongs = currentData.songs;

    if (currentSongs.length >= currentTotal) return;

    final oldState = state.value;
    try {
      final newResult = await _getPlaylistDetail(
        ref: ref,
        id: id,
        library: library,
        additional: additional,
        limit: limit,
        offset: currentSongs.length,
        sortBy: extraSortBy,
        sortDirection: extraSortDirection,
        groupKey: groupKey,
        cacheDuration: duration,
      );
      final newState = newResult.toSongListResponse();

      final newSongs = newState.data?.songs ?? [];
      final mergedSongs = [...currentSongs, ...newSongs];

      state = AsyncData(
        newState.copyWith(
          data: newState.data?.copyWith(
            songs: mergedSongs,
            total: currentTotal,
          ),
        ),
      );
    } catch (e) {
      logger.e('加载更多播放列表失败: $e');
      state = AsyncData(oldState!);
    }
  }
}

@riverpod
class PlaylistStateNotifier extends _$PlaylistStateNotifier {
  @override
  void build() {
    ref.keepAliveFor(const Duration(minutes: 5));
  }

  Future<PlaylistDetailResponse> fetchPlaylistInfo({
    required String id,
    String additional = 'songs',
  }) async {
    return await _getPlaylistInfo(
      ref: ref,
      id: id,
      additional: additional,
      cacheDuration: const Duration(minutes: 5),
    );
  }

  Future<CreatePlaylistResponse> createPlaylist({required String name}) async {
    return await _createPlaylist(ref: ref, name: name);
  }

  Future<RenamePlaylistResponse> renamePlaylist({
    required String id,
    required String newName,
  }) async {
    return await _renamePlaylist(ref: ref, id: id, newName: newName);
  }

  Future<DeletePlaylistResponse> deletePlaylist({required String id}) async {
    return await _deletePlaylist(ref: ref, id: id);
  }

  Future<AddPlaylistSongsResponse> addSongToPlaylist({
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

  Future<AddPlaylistSongsResponse> addSongsToPlaylist({
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

  Future<AddPlaylistSongsResponse> removeSongsFromPlaylist({
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

  Future<RemoveMissingSongsResponse> removeMissingSongs({
    required String id,
  }) async {
    return await _removeMissingSongs(ref: ref, id: id);
  }
}
