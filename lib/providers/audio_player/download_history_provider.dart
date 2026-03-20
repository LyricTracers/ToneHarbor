import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/audio_player/download_manager.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'download_history_provider.g.dart';

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
    DownloadType? filterType,
    DownloadStatus? filterStatus,
  }) {
    ref.keepAliveFor(Duration(minutes: 5));
    Future.microtask(() => _loadFirstPage());
    return [];
  }

  Future<void> _loadFirstPage() async {
    if (_isLoading) return;

    _isLoading = true;
    try {
      final db = ref.read(appDatabaseProvider);

      final query = db.select(db.downloadTaskState)
        ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
        ..limit(defaultPageSize, offset: 0);

      if (filterType != null) {
        query.where((t) => t.type.equals(filterType!.index));
      }
      if (filterStatus != null) {
        query.where((t) => t.status.equals(filterStatus!.index));
      }

      final records = await query.get();

      final countQuery = db.select(db.downloadTaskState);
      if (filterType != null) {
        countQuery.where((t) => t.type.equals(filterType!.index));
      }
      if (filterStatus != null) {
        countQuery.where((t) => t.status.equals(filterStatus!.index));
      }
      _totalRecords = await countQuery.get().then((r) => r.length);

      state = records.map(_mapRecordToTask).toList();
      _hasMore = state.length < _totalRecords;
    } finally {
      _isLoading = false;
    }
  }

  DownloadTaskRecord _mapRecordToTask(record) {
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
      final limit = defaultPageSize;

      final query = db.select(db.downloadTaskState)
        ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
        ..limit(limit, offset: offset);

      if (filterType != null) {
        query.where((t) => t.type.equals(filterType!.index));
      }
      if (filterStatus != null) {
        query.where((t) => t.status.equals(filterStatus!.index));
      }

      final records = await query.get();

      state = [...state, ...records.map(_mapRecordToTask)];
      _hasMore = records.length == defaultPageSize;
    } finally {
      _isLoading = false;
    }
  }

  Future<void> _refresh() async {
    _currentPage = 0;
    _hasMore = true;
    await _loadFirstPage();
  }

  Future<void> deleteHistory(List<String> trackIds) async {
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
