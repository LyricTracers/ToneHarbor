import 'dart:io';

import 'package:drift/drift.dart' hide Column;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/models/database/database.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/providers/providers.dart';

part 'local_songs_provider.g.dart';

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
    int? actualFileSize,
    int? actualBitrate,
  }) async {
    try {
      final existing = await (db.select(
        db.localMusicState,
      )..where((t) => t.trackId.equals(track.id))).getSingleOrNull();

      final container = track.isCloudMusic
          ? (actualContainer ?? track.container)
          : (quality.isTranscode
                ? 'mp3'
                : (actualContainer ?? track.container));

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
                fileSize: Value(actualFileSize ?? track.filesize),
                bitrate: Value(actualBitrate ?? track.bitrate),
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

  static Future<Set<String>> removeQualityFromAll(
    AppDatabase db,
    AudioQuality quality,
  ) async {
    final deletedTrackIds = <String>{};
    final qualityBit = 1 << quality.index;
    final allBitsMask = (1 << AudioQuality.values.length) - 1;
    final clearMask = allBitsMask ^ qualityBit;

    try {
      await db.transaction(() async {
        final result = await db
            .customSelect(
              'SELECT track_id FROM local_music_state WHERE qualities = ?',
              variables: [Variable.withInt(qualityBit)],
              readsFrom: {db.localMusicState},
            )
            .get();

        for (final row in result) {
          deletedTrackIds.add(row.read<String>('track_id'));
        }

        if (deletedTrackIds.isNotEmpty) {
          await db.customStatement(
            'DELETE FROM local_music_state WHERE qualities = ?',
            [qualityBit],
          );
        }

        await db.customStatement(
          'UPDATE local_music_state SET qualities = qualities & ?, updated_at = ? WHERE qualities & ? != 0 AND qualities != ?',
          [
            clearMask,
            DateTime.now().millisecondsSinceEpoch,
            qualityBit,
            qualityBit,
          ],
        );
      });

      logger.i(
        '[LocalMusicStateService] Removed quality $quality from all records, deleted ${deletedTrackIds.length} tracks',
      );
    } catch (e) {
      logger.e(
        '[LocalMusicStateService] Failed to remove quality from all: $e',
      );
    }

    return deletedTrackIds;
  }

  static Future<void> removeAllByQuality(
    AppDatabase db,
    AudioQuality quality,
  ) async {
    final cacheDir = getMusicCacheDirSync(quality);
    final dir = Directory(cacheDir);

    if (await dir.exists()) {
      await dir.delete(recursive: true);
      await dir.create(recursive: true);
      logger.i('[LocalMusicStateService] Deleted cache directory: $cacheDir');
    }

    await removeQualityFromAll(db, quality);
  }
}

ToneHarborTrackObjectMultLocal _localSongFromDb(LocalMusicStateData data) {
  final qualities = <AudioQuality>[];
  if (data.trackId.startsWith("music_")) {
    for (final q in AudioQuality.values) {
      if ((data.qualities & (1 << q.index)) != 0) {
        final filename = generateTrackFilename(
          data.title,
          data.artist,
          data.trackId,
        );
        final path = buildTrackPath(filename, data.container, q);
        if (File(path).existsSync()) {
          qualities.add(q);
        }
      }
    }
  } else {
    qualities.add(AudioQuality.high);
  }

  return ToneHarborTrackObjectMultLocal(
    id: data.trackId,
    title: data.title,
    artist: data.artist,
    album: data.album,
    container: data.container,
    externalUri: data.externalUri,
    rating: data.rating,
    duration: Duration(microseconds: data.duration),
    filesize: data.fileSize,
    bitrate: data.bitrate,
    channel: data.channel,
    codec: data.codec,
    frequency: data.frequency,
    availableQualities: qualities,
  );
}

@riverpod
class LocalSongs extends _$LocalSongs
    with ExtraProvider<ToneHarborTrackObjectList> {
  static const int _pageSize = 50;
  int _currentPage = 0;
  bool _isLoadingMore = false;
  String _sortBy = 'time';
  String _sortDirection = 'desc';
  int _totalCount = 0;

  @override
  Future<ToneHarborTrackObjectList> build() async {
    _currentPage = 0;
    _isLoadingMore = false;
    _totalCount = 0;

    return await _loadInitialSongs();
  }

  Future<ToneHarborTrackObjectList> _loadInitialSongs() async {
    try {
      final db = ref.read(appDatabaseProvider);

      final countQuery = db.selectOnly(db.localMusicState)
        ..addColumns([db.localMusicState.trackId.count()]);
      final countResult = await countQuery.getSingle();
      final dbCount = countResult.read(db.localMusicState.trackId.count()) ?? 0;

      _totalCount = dbCount;

      if (dbCount == 0) {
        return ToneHarborTrackObjectListEmpty();
      }

      final songs = await _loadPageFromDatabase(db, 0, _pageSize);
      _currentPage = 1;

      return ToneHarborTrackObjectList.data(
        songs: songs,
        total: _totalCount,
        offset: 0,
      );
    } catch (e) {
      logger.e('[LocalSongs] Failed to load songs: $e');
      return ToneHarborTrackObjectListEmpty();
    }
  }

  Future<List<ToneHarborTrackObjectMultLocal>> _loadPageFromDatabase(
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

    final result = <ToneHarborTrackObjectMultLocal>[];
    for (final record in records) {
      final song = _localSongFromDb(record);
      result.add(song);
    }

    return result;
  }

  @override
  Future<void> loadMore() async {
    if (_isLoadingMore) return;

    final currentState = state;
    if (currentState is! AsyncData<ToneHarborTrackObjectList>) return;

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

      final currentSongs = currentState.value.songs;
      final allSongs = [...currentSongs, ...newSongs];
      _currentPage++;

      state = AsyncValue.data(
        ToneHarborTrackObjectList.data(
          songs: allSongs,
          total: _totalCount,
          offset: 0,
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
    _sortBy = sortBy.toLowerCase();
    _sortDirection = sortDirection.toLowerCase();
    _currentPage = 0;

    final db = ref.read(appDatabaseProvider);
    final songs = await _loadPageFromDatabase(db, 0, _pageSize);
    _currentPage = 1;

    state = AsyncValue.data(
      ToneHarborTrackObjectList.data(
        songs: songs,
        total: _totalCount,
        offset: 0,
      ),
    );
  }

  Future<void> refresh() async {
    _currentPage = 0;
    _isLoadingMore = false;
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
        ToneHarborTrackObjectList.data(
          songs: songs,
          total: _totalCount,
          offset: 0,
        ),
      );
    } catch (e) {
      logger.e('[LocalSongs] Failed to refresh: $e');
      state = AsyncValue.data(ToneHarborTrackObjectListEmpty());
    }
  }

  Future<void> removeSong(
    ToneHarborTrackObjectMultLocal track,
    AudioQuality quality,
  ) async {
    final song = track;

    final path = await song.getPath(quality: quality);
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
      _totalCount--;
      await LocalMusicStateService.removeFromLocalMusicState(
        ref.read(appDatabaseProvider),
        track.id,
      );
      await _updateStateAfterRemove(track.id);
    }

    final recordDeleted =
        await LocalMusicStateService.removeFromLocalMusicState(
          ref.read(appDatabaseProvider),
          track.id,
          quality: quality,
        );

    if (recordDeleted) {
      _totalCount--;
      await _updateStateAfterRemove(track.id);
    }
  }

  Future<void> removeAllSongs(ToneHarborTrackObjectMultLocal track) async {
    _totalCount--;
    final trackId = track.id;

    for (final quality in track.availableQualities) {
      final path = await track.getPath(quality: quality);
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

    await LocalMusicStateService.removeFromLocalMusicState(
      ref.read(appDatabaseProvider),
      trackId,
    );
    await _updateStateAfterRemove(trackId);
  }

  Future<void> removeAllSongsByIds(
    Set<ToneHarborTrackObjectMultLocal> tracks,
    Set<String> trackIds,
  ) async {
    if (tracks.isEmpty) return;

    for (final track in tracks) {
      _totalCount--;
      for (final quality in track.availableQualities) {
        final path = await track.getPath(quality: quality);
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

    await LocalMusicStateService.removeFromLocalMusicStateByIds(
      ref.read(appDatabaseProvider),
      trackIds,
    );

    await _updateStateAfterRemoveByIds(trackIds);
  }

  Future<void> _updateStateAfterRemove(String trackId) async {
    final currentState = state;
    if (currentState is AsyncData<ToneHarborTrackObjectList>) {
      final currentSongs = currentState.value.songs;
      final updatedSongs = currentSongs.where((s) => s.id != trackId).toList();

      state = AsyncValue.data(
        ToneHarborTrackObjectList.data(
          songs: updatedSongs,
          total: _totalCount,
          offset: 0,
        ),
      );
    }
  }

  Future<void> _updateStateAfterRemoveByIds(Set<String> trackIds) async {
    final currentState = state;
    if (currentState is AsyncData<ToneHarborTrackObjectList>) {
      final currentSongs = currentState.value.songs;
      final updatedSongs = currentSongs
          .where((s) => !trackIds.contains(s.id))
          .toList();

      state = AsyncValue.data(
        ToneHarborTrackObjectList.data(
          songs: updatedSongs,
          total: _totalCount,
          offset: 0,
        ),
      );
    }
  }
}
