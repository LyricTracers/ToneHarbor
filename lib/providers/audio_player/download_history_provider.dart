import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/models/database/database.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'download_history_provider.g.dart';

enum DownloadHistoryFilter { all, completed, canceled }

@riverpod
class DownloadHistoryNotifier extends _$DownloadHistoryNotifier {
  static const int defaultPageSize = 50;

  int _currentPage = 0;
  int _totalRecords = 0;
  bool _hasMore = true;
  bool _isLoading = false;

  int get currentPage => _currentPage;
  int get totalRecords => _totalRecords;
  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;

  @override
  List<DownloadTaskRecord> build({
    DownloadHistoryFilter filter = DownloadHistoryFilter.all,
  }) {
    ref.keepAliveFor(Duration(minutes: 5));
    Future.microtask(() => _loadFirstPage());
    return [];
  }

  Future<void> _loadFirstPage() async {
    if (_isLoading) return;

    _isLoading = true;
    _currentPage = 0;
    try {
      final db = ref.read(appDatabaseProvider);

      final records = await _buildQuery(
        db,
        limit: defaultPageSize,
        offset: 0,
      ).get();

      final countQuery = db.downloadTaskState.trackId.count();
      final filteredQuery = db.selectOnly(db.downloadTaskState)
        ..addColumns([countQuery])
        ..where(db.downloadTaskState.type.equals(DownloadType.normal.index));

      if (filter == DownloadHistoryFilter.completed) {
        filteredQuery.where(
          db.downloadTaskState.status.equals(DownloadStatus.completed.index),
        );
      } else if (filter == DownloadHistoryFilter.canceled) {
        filteredQuery.where(
          db.downloadTaskState.status.equals(DownloadStatus.canceled.index),
        );
      } else {
        filteredQuery.where(
          db.downloadTaskState.status.isIn([
            DownloadStatus.completed.index,
            DownloadStatus.canceled.index,
          ]),
        );
      }

      final result = await filteredQuery.getSingle();
      _totalRecords = result.read(countQuery) ?? 0;

      final newRecords = records.map(_mapRecordToTask).toList();
      state = newRecords;
      _hasMore =
          newRecords.length >= defaultPageSize &&
          newRecords.length < _totalRecords;
    } finally {
      _isLoading = false;
    }
  }

  SimpleSelectStatement<DownloadTaskState, DownloadTaskStateData> _buildQuery(
    AppDatabase db, {
    required int limit,
    required int offset,
  }) {
    final query = db.select(db.downloadTaskState)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
      ..limit(limit, offset: offset);
    query.where((t) => t.type.equals(DownloadType.normal.index));

    if (filter == DownloadHistoryFilter.completed) {
      query.where((t) => t.status.equals(DownloadStatus.completed.index));
    } else if (filter == DownloadHistoryFilter.canceled) {
      query.where((t) => t.status.equals(DownloadStatus.canceled.index));
    } else {
      query.where(
        (t) => t.status.isIn([
          DownloadStatus.completed.index,
          DownloadStatus.canceled.index,
        ]),
      );
    }

    return query;
  }

  DownloadTaskRecord _mapRecordToTask(DownloadTaskStateData record) {
    final track = ToneHarborTrackObject.full(
      id: record.trackId,
      title: record.trackTitle,
      artist: record.trackArtist,
      album: '',
      externalUri: '',
      duration: Duration.zero,
      filesize: 0,
      bitrate: 0,
      channel: 0,
      codec: '',
      container: record.container,
      frequency: 0,
      rating: 0,
      platform: ToneHarborTrackPlatform.synology,
    );
    return DownloadTaskRecord(
      track: track,
      type: record.type,
      quality: record.quality,
      status: record.status,
    );
  }

  Future<void> loadMore() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    try {
      final db = ref.read(appDatabaseProvider);
      _currentPage++;

      final offset = _currentPage * defaultPageSize;
      final records = await _buildQuery(
        db,
        limit: defaultPageSize,
        offset: offset,
      ).get();

      final newRecords = records.map(_mapRecordToTask).toList();
      state = [...state, ...newRecords];
      _hasMore = newRecords.length >= defaultPageSize;
    } finally {
      _isLoading = false;
    }
  }

  Future<void> _refresh() async {
    _currentPage = 0;
    _hasMore = true;
    await _loadFirstPage();
  }

  Future<void> deleteHistory(Set<String> trackIds) async {
    if (trackIds.isEmpty) return;
    final db = ref.read(appDatabaseProvider);
    await (db.delete(
      db.downloadTaskState,
    )..where((tb) => tb.trackId.isIn(trackIds))).go();
    await _refresh();
  }

  Future<void> clearHistory() async {
    final db = ref.read(appDatabaseProvider);
    await db.delete(db.downloadTaskState).go();
    await _refresh();
  }
}

class DownloadTaskRecord {
  final ToneHarborTrackObject track;
  final DownloadType type;
  final AudioQuality quality;
  final DownloadStatus status;

  DownloadTaskRecord({
    required this.track,
    required this.type,
    required this.quality,
    required this.status,
  });
}
