import 'dart:io';

import 'package:drift/drift.dart' hide Column;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/models/database/database.dart';
import 'package:toneharbor/providers/common_provider.dart';
import 'package:toneharbor/providers/database/database.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'local_songs_provider.g.dart';

const List<AudioQuality> _qualityPriority = [
  AudioQuality.original,
  AudioQuality.high,
  AudioQuality.medium,
  AudioQuality.low,
];

class LocalMusicStateService {
  static int _qualitiesToBitmask(Set<AudioQuality> qualities) {
    int mask = 0;
    for (final q in qualities) {
      mask |= 1 << q.index;
    }
    return mask;
  }

  static Set<AudioQuality> _bitmaskToQualities(int bitmask) {
    final result = <AudioQuality>{};
    for (final q in AudioQuality.values) {
      if ((bitmask & (1 << q.index)) != 0) {
        result.add(q);
      }
    }
    return result;
  }

  static Future<void> addToLocalMusicState(
    AppDatabase db,
    ToneHarborTrackObject track,
    AudioQuality quality, {
    String? actualContainer,
  }) async {
    try {
      final existing = await (db.select(
        db.localMusicState,
      )..where((t) => t.trackId.equals(track.id))).getSingleOrNull();

      final container = quality.isTranscode
          ? 'mp3'
          : (actualContainer ?? track.container);

      if (existing != null) {
        final currentQualities = _bitmaskToQualities(existing.qualities);
        currentQualities.add(quality);
        await (db.update(
          db.localMusicState,
        )..where((t) => t.trackId.equals(track.id))).write(
          LocalMusicStateCompanion(
            qualities: Value(_qualitiesToBitmask(currentQualities)),
            updatedAt: Value(DateTime.now()),
          ),
        );
      } else {
        await db
            .into(db.localMusicState)
            .insert(
              LocalMusicStateCompanion.insert(
                trackId: track.id,
                qualities: _qualitiesToBitmask({quality}),
                title: track.title,
                artist: Value(track.artist),
                album: Value(track.album),
                container: container,
                duration: Value(track.duration.inMilliseconds),
                fileSize: Value(track.filesize),
                bitrate: Value(track.bitrate),
                channel: Value(track.channel),
                codec: Value(track.codec),
                frequency: Value(track.frequency),
              ),
            );
      }

      logger.i(
        '[LocalMusicStateService] Added to local music state: ${track.title}',
      );
    } catch (e) {
      logger.e(
        '[LocalMusicStateService] Failed to add to local music state: $e',
      );
    }
  }

  static Future<bool> removeFromLocalMusicState(
    AppDatabase db,
    String trackId, {
    AudioQuality? quality,
  }) async {
    try {
      if (quality != null) {
        final existing = await (db.select(
          db.localMusicState,
        )..where((t) => t.trackId.equals(trackId))).getSingleOrNull();

        if (existing != null) {
          final currentQualities = _bitmaskToQualities(existing.qualities);
          currentQualities.remove(quality);

          if (currentQualities.isEmpty) {
            await (db.delete(
              db.localMusicState,
            )..where((t) => t.trackId.equals(trackId))).go();
            return true;
          } else {
            await (db.update(
              db.localMusicState,
            )..where((t) => t.trackId.equals(trackId))).write(
              LocalMusicStateCompanion(
                qualities: Value(_qualitiesToBitmask(currentQualities)),
                updatedAt: Value(DateTime.now()),
              ),
            );
            return false;
          }
        }
        return false;
      } else {
        await (db.delete(
          db.localMusicState,
        )..where((t) => t.trackId.equals(trackId))).go();
        return true;
      }
    } catch (e) {
      logger.e(
        '[LocalMusicStateService] Failed to remove from local music state: $e',
      );
      return false;
    }
  }

  static Future<void> removeFromLocalMusicStateByIds(
    AppDatabase db,
    Set<String> trackIds,
  ) async {
    try {
      if (trackIds.isEmpty) return;

      await (db.delete(
        db.localMusicState,
      )..where((t) => t.trackId.isIn(trackIds))).go();

      logger.i(
        '[LocalMusicStateService] Removed ${trackIds.length} tracks from local music state',
      );
    } catch (e) {
      logger.e(
        '[LocalMusicStateService] Failed to remove from local music state: $e',
      );
    }
  }
}

class LocalSong {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String container;
  final int duration;
  final int fileSize;
  final int bitrate;
  final int channel;
  final String codec;
  final int frequency;
  final List<AudioQuality> availableQualities;
  final String filename;

  LocalSong({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.container,
    required this.duration,
    required this.fileSize,
    required this.bitrate,
    required this.channel,
    required this.codec,
    required this.frequency,
    required this.availableQualities,
    String? filename,
  }) : filename = filename ?? _generateFilename(title, artist, id);

  AudioQuality get bestQuality {
    if (availableQualities.isEmpty) {
      return AudioQuality.high;
    }
    return availableQualities.first;
  }

  String get path => getPath(bestQuality);

  static String _generateFilename(String title, String artist, String id) {
    var fileName = "${title}_$id";
    if (artist.isNotEmpty) {
      fileName = "${artist}_$fileName";
    }
    return sanitizeFilename(fileName, id);
  }

  static String _buildPath(
    String filename,
    String container,
    AudioQuality quality,
  ) {
    try {
      final cacheDir = getMusicCacheDirSync(quality);
      final extension = quality.isTranscode ? 'mp3' : container;
      return '$cacheDir/$filename.$extension';
    } catch (e) {
      return '';
    }
  }

  String getPath(AudioQuality quality) =>
      _buildPath(filename, container, quality);

  ToneHarborTrackObject? toTrack({AudioQuality? quality}) {
    if (availableQualities.isEmpty) {
      return null;
    }

    AudioQuality q;
    if (quality != null && availableQualities.contains(quality)) {
      q = quality;
    } else {
      q = bestQuality;
    }

    return ToneHarborTrackObject.local(
      id: id,
      title: title,
      artist: artist,
      album: album,
      externalUri: "",
      duration: Duration(milliseconds: duration),
      rating: 0,
      filesize: fileSize,
      bitrate: bitrate,
      channel: channel,
      codec: codec,
      container: container,
      frequency: frequency,
      path: getPath(q),
    );
  }

  Song toSong() {
    return Song(
      id: id,
      path: path,
      title: title,
      type: 'file',
      additional: SongAdditional(
        songTag: SongTag(
          album: album.isEmpty ? null : album,
          artist: artist.isEmpty ? null : artist,
          disc: 1,
          track: 1,
          year: 0,
        ),
        songAudio: SongAudio(
          bitrate: bitrate,
          channel: channel,
          codec: codec,
          container: container,
          duration: duration ~/ 1000,
          filesize: fileSize,
          frequency: frequency,
        ),
      ),
    );
  }

  LocalSong copyWith({List<AudioQuality>? availableQualities}) {
    return LocalSong(
      id: id,
      title: title,
      artist: artist,
      album: album,
      container: container,
      duration: duration,
      fileSize: fileSize,
      bitrate: bitrate,
      channel: channel,
      codec: codec,
      frequency: frequency,
      availableQualities: availableQualities ?? this.availableQualities,
      filename: filename,
    );
  }

  factory LocalSong.fromDb(LocalMusicStateData data) {
    final qualities = <AudioQuality>[];
    final filename = _generateFilename(data.title, data.artist, data.trackId);
    for (final q in _qualityPriority) {
      if ((data.qualities & (1 << q.index)) != 0) {
        final path = _buildPath(filename, data.container, q);
        if (File(path).existsSync()) {
          qualities.add(q);
        }
      }
    }

    return LocalSong(
      id: data.trackId,
      title: data.title,
      artist: data.artist,
      album: data.album,
      container: data.container,
      duration: data.duration,
      fileSize: data.fileSize,
      bitrate: data.bitrate,
      channel: data.channel,
      codec: data.codec,
      frequency: data.frequency,
      availableQualities: qualities,
      filename: filename,
    );
  }
}

@riverpod
class LocalSongs extends _$LocalSongs with ExtraProvider<SongListResponse> {
  static const int _pageSize = 50;
  int _currentPage = 0;
  bool _isLoadingMore = false;
  String _sortBy = 'time';
  String _sortDirection = 'desc';
  int _totalCount = 0;

  final Map<String, LocalSong> _songsCache = {};

  @override
  Future<SongListResponse> build() async {
    _currentPage = 0;
    _isLoadingMore = false;
    _songsCache.clear();
    _totalCount = 0;

    return await _loadInitialSongs();
  }

  Future<SongListResponse> _loadInitialSongs() async {
    try {
      final db = ref.read(appDatabaseProvider);

      final countQuery = db.selectOnly(db.localMusicState)
        ..addColumns([db.localMusicState.trackId.count()]);
      final countResult = await countQuery.getSingle();
      final dbCount = countResult.read(db.localMusicState.trackId.count()) ?? 0;

      _totalCount = dbCount;

      if (dbCount == 0) {
        return SongListResponse(
          success: true,
          data: SongData(songs: [], total: 0, offset: 0),
        );
      }

      final songs = await _loadPageFromDatabase(db, 0, _pageSize);
      _currentPage = 1;

      return SongListResponse(
        success: true,
        data: SongData(
          songs: songs.map((e) => e.toSong()).toList(),
          total: _totalCount,
          offset: 0,
        ),
      );
    } catch (e) {
      logger.e('[LocalSongs] Failed to load songs: $e');
      return SongListResponse(
        success: false,
        data: SongData(songs: [], total: 0, offset: 0),
      );
    }
  }

  Future<List<LocalSong>> _loadPageFromDatabase(
    AppDatabase db,
    int offset,
    int limit,
  ) async {
    final query = db.select(db.localMusicState);

    switch (_sortBy) {
      case 'title':
        query.orderBy([
          (t) => OrderingTerm(
            expression: t.title,
            mode: _sortDirection == 'asc'
                ? OrderingMode.asc
                : OrderingMode.desc,
          ),
        ]);
        break;
      case 'time':
        query.orderBy([
          (t) => OrderingTerm(
            expression: t.updatedAt,
            mode: _sortDirection == 'asc'
                ? OrderingMode.asc
                : OrderingMode.desc,
          ),
        ]);
        break;
      case 'artist':
        query.orderBy([
          (t) => OrderingTerm(
            expression: t.artist,
            mode: _sortDirection == 'asc'
                ? OrderingMode.asc
                : OrderingMode.desc,
          ),
        ]);
        break;
      case 'album':
        query.orderBy([
          (t) => OrderingTerm(
            expression: t.album,
            mode: _sortDirection == 'asc'
                ? OrderingMode.asc
                : OrderingMode.desc,
          ),
        ]);
        break;
      default:
        query.orderBy([
          (t) => OrderingTerm(
            expression: t.title,
            mode: _sortDirection == 'asc'
                ? OrderingMode.asc
                : OrderingMode.desc,
          ),
        ]);
    }

    query.limit(limit, offset: offset);

    final records = await query.get();

    final result = <LocalSong>[];
    for (final record in records) {
      final song = LocalSong.fromDb(record);
      _songsCache[song.id] = song;
      result.add(song);
    }

    return result;
  }

  @override
  Future<void> loadMore() async {
    if (_isLoadingMore) return;

    final currentState = state;
    if (currentState is! AsyncData<SongListResponse>) return;

    var currentCount = _currentPage * _pageSize;
    if (currentCount >= _totalCount) return;

    _isLoadingMore = true;

    try {
      final db = ref.read(appDatabaseProvider);
      final newSongs = await _loadPageFromDatabase(db, currentCount, _pageSize);

      if (newSongs.isEmpty) {
        _isLoadingMore = false;
        return;
      }

      final currentSongs = currentState.value.data?.songs ?? [];
      final allSongs = [...currentSongs, ...newSongs.map((e) => e.toSong())];
      _currentPage++;

      state = AsyncValue.data(
        SongListResponse(
          success: true,
          data: SongData(songs: allSongs, total: _totalCount, offset: 0),
        ),
      );
    } finally {
      _isLoadingMore = false;
    }
  }

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {
    _sortBy = sortBy;
    _sortDirection = sortDirection;
    _currentPage = 0;
    _songsCache.clear();

    final db = ref.read(appDatabaseProvider);
    final songs = await _loadPageFromDatabase(db, 0, _pageSize);
    _currentPage = 1;

    state = AsyncValue.data(
      SongListResponse(
        success: true,
        data: SongData(
          songs: songs.map((e) => e.toSong()).toList(),
          total: _totalCount,
          offset: 0,
        ),
      ),
    );
  }

  LocalSong? getLocalSong(String songId) {
    return _songsCache[songId];
  }

  List<AudioQuality> getAvailableQualities(String songId) {
    final song = _songsCache[songId];
    if (song == null) return [];
    return song.availableQualities;
  }

  Future<ToneHarborTrackObject?> getLocalSongTrack(String songId) async {
    final song = _songsCache[songId];
    if (song == null) return null;

    final track = song.toTrack();
    if (track == null) {
      await removeAllSongs(songId);
      return null;
    }
    return track;
  }

  Future<void> refresh() async {
    _currentPage = 0;
    _isLoadingMore = false;
    _songsCache.clear();
    state = const AsyncValue.loading();

    try {
      final db = ref.read(appDatabaseProvider);

      final countQuery = db.selectOnly(db.localMusicState)
        ..addColumns([db.localMusicState.trackId.count()]);
      final countResult = await countQuery.getSingle();
      _totalCount = countResult.read(db.localMusicState.trackId.count()) ?? 0;

      final songs = await _loadPageFromDatabase(db, 0, _pageSize);
      _currentPage = 1;
      state = AsyncValue.data(
        SongListResponse(
          success: true,
          data: SongData(
            songs: songs.map((e) => e.toSong()).toList(),
            total: _totalCount,
            offset: 0,
          ),
        ),
      );
    } catch (e) {
      logger.e('[LocalSongs] Failed to refresh: $e');
      state = AsyncValue.data(
        SongListResponse(
          success: false,
          data: SongData(songs: [], total: 0, offset: 0),
        ),
      );
    }
  }

  Future<void> addOrUpdateSong(
    ToneHarborTrackObject track,
    AudioQuality quality,
  ) async {
    await LocalMusicStateService.addToLocalMusicState(
      ref.read(appDatabaseProvider),
      track,
      quality,
    );

    final existing = _songsCache[track.id];
    if (existing != null) {
      _songsCache[track.id] = existing.copyWith(
        availableQualities: [...existing.availableQualities, quality],
      );
      _updateSongInState(track.id);
    } else {
      _songsCache[track.id] = LocalSong(
        id: track.id,
        title: track.title,
        artist: track.artist,
        album: track.album,
        container: track.container,
        duration: track.duration.inMilliseconds,
        fileSize: track.filesize,
        bitrate: track.bitrate,
        channel: track.channel,
        codec: track.codec,
        frequency: track.frequency,
        availableQualities: [quality],
      );
      _totalCount++;
      await _refreshFirstPage();
    }
  }

  void _updateSongInState(String trackId) {
    final currentState = state;
    if (currentState is AsyncData<SongListResponse>) {
      final currentSongs = currentState.value.data?.songs ?? [];
      final updatedSong = _songsCache[trackId]?.toSong();
      if (updatedSong == null) return;

      final index = currentSongs.indexWhere((s) => s.id == trackId);
      if (index == -1) return;

      final updatedSongs = List<Song>.from(currentSongs);
      updatedSongs[index] = updatedSong;

      state = AsyncValue.data(
        SongListResponse(
          success: true,
          data: SongData(songs: updatedSongs, total: _totalCount, offset: 0),
        ),
      );
    }
  }

  Future<void> _refreshFirstPage() async {
    final db = ref.read(appDatabaseProvider);
    final songs = await _loadPageFromDatabase(db, 0, _pageSize);
    _currentPage = 1;

    state = AsyncValue.data(
      SongListResponse(
        success: true,
        data: SongData(
          songs: songs.map((e) => e.toSong()).toList(),
          total: _totalCount,
          offset: 0,
        ),
      ),
    );
  }

  Future<void> removeSong(String trackId, AudioQuality quality) async {
    final song = _songsCache[trackId];

    if (song != null) {
      final path = song.getPath(quality);
      if (path.isNotEmpty) {
        try {
          final file = File(path);
          if (await file.exists()) {
            await file.delete();
            logger.i('[LocalSongs] Deleted local file: $path');
          }
        } catch (e) {
          logger.e('[LocalSongs] Failed to delete file: $path, $e');
        }
      }

      final newQualities = song.availableQualities
          .where((q) => q != quality)
          .toList();

      if (newQualities.isEmpty) {
        _songsCache.remove(trackId);
        _totalCount--;
        await LocalMusicStateService.removeFromLocalMusicState(
          ref.read(appDatabaseProvider),
          trackId,
        );
        await _updateStateAfterRemove(trackId);
      } else {
        _songsCache[trackId] = song.copyWith(availableQualities: newQualities);
        _updateSongInState(trackId);
      }
      return;
    }

    final recordDeleted =
        await LocalMusicStateService.removeFromLocalMusicState(
          ref.read(appDatabaseProvider),
          trackId,
          quality: quality,
        );

    if (recordDeleted) {
      _totalCount--;
      _songsCache.remove(trackId);
      await _updateStateAfterRemove(trackId);
    }
  }

  Future<void> removeAllSongs(String trackId) async {
    final removed = _songsCache.remove(trackId);
    if (removed != null) {
      _totalCount--;

      for (final quality in removed.availableQualities) {
        final path = removed.getPath(quality);
        if (path.isNotEmpty) {
          try {
            final file = File(path);
            if (await file.exists()) {
              await file.delete();
              logger.i('[LocalSongs] Deleted local file: $path');
            }
          } catch (e) {
            logger.e('[LocalSongs] Failed to delete file: $path, $e');
          }
        }
      }
    }

    await LocalMusicStateService.removeFromLocalMusicState(
      ref.read(appDatabaseProvider),
      trackId,
    );
    if (removed != null) {
      await _updateStateAfterRemove(trackId);
    }
  }

  Future<void> removeAllSongsByIds(Set<String> trackIds) async {
    if (trackIds.isEmpty) return;

    for (final trackId in trackIds) {
      final removed = _songsCache.remove(trackId);
      if (removed != null) {
        _totalCount--;

        for (final quality in removed.availableQualities) {
          final path = removed.getPath(quality);
          if (path.isNotEmpty) {
            try {
              final file = File(path);
              if (await file.exists()) {
                await file.delete();
                logger.i('[LocalSongs] Deleted local file: $path');
              }
            } catch (e) {
              logger.e('[LocalSongs] Failed to delete file: $path, $e');
            }
          }
        }
      }
    }

    await LocalMusicStateService.removeFromLocalMusicStateByIds(
      ref.read(appDatabaseProvider),
      trackIds,
    );

    await _updateStateAfterRemoveByIds(trackIds);
  }

  Future<void> _updateStateAfterRemove(String trackId) async {
    final currentState = state;
    if (currentState is AsyncData<SongListResponse>) {
      final currentSongs = currentState.value.data?.songs ?? [];
      final updatedSongs = currentSongs.where((s) => s.id != trackId).toList();

      state = AsyncValue.data(
        SongListResponse(
          success: true,
          data: SongData(songs: updatedSongs, total: _totalCount, offset: 0),
        ),
      );
    }
  }

  Future<void> _updateStateAfterRemoveByIds(Set<String> trackIds) async {
    final currentState = state;
    if (currentState is AsyncData<SongListResponse>) {
      final currentSongs = currentState.value.data?.songs ?? [];
      final updatedSongs = currentSongs
          .where((s) => !trackIds.contains(s.id))
          .toList();

      state = AsyncValue.data(
        SongListResponse(
          success: true,
          data: SongData(songs: updatedSongs, total: _totalCount, offset: 0),
        ),
      );
    }
  }
}
