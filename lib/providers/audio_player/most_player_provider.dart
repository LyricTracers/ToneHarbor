import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/database/database.dart';

import 'package:toneharbor/providers/providers.dart';
part 'most_player_provider.g.dart';

@riverpod
class MostPlayerNotifier extends _$MostPlayerNotifier
    with ExtraProvider<ToneHarborTrackObjectList> {
  @override
  Future<ToneHarborTrackObjectList> build({
    String sortDirection = 'desc',
  }) async {
    if (extraSortBy.isEmpty && extraSortDirection.isEmpty) {
      extraSortBy = "playCount";
      extraSortDirection = sortDirection;
    }
    return await query();
  }

  Future<ToneHarborTrackObjectList> query() async {
    final db = ref.read(appDatabaseProvider);
    final query = db.select(db.mostPlayStateTable);
    query.orderBy([
      (t) => OrderingTerm(
        expression: t.playCount,
        mode: extraSortDirection == 'asc'
            ? OrderingMode.asc
            : OrderingMode.desc,
      ),
      (t) => OrderingTerm(
        expression: t.lastPlayedAt,
        mode: extraSortDirection == 'asc'
            ? OrderingMode.asc
            : OrderingMode.desc,
      ),
    ]);
    query.limit(100, offset: 0);
    final records = await query.get();

    final songs = records.map((e) => e.track).toList();

    return ToneHarborTrackObjectListData(
      songs: songs,
      total: songs.length,
      offset: 0,
    );
  }

  @override
  Future<void> loadMore() async {}

  @override
  Future<void> setSort({
    required String sortBy,
    required String sortDirection,
  }) async {
    extraSortDirection = sortDirection;
    state = AsyncLoading();
    state = AsyncData(await query());
  }
}

class MostPlayerService {
  static Future<void> insertMostPlayer(
    AppDatabase db,
    ToneHarborTrackObject track,
  ) async {
    if (!track.isSong) {
      return;
    }
    track = track.convertFull();
    final trackId = track.id;

    await db.transaction(() async {
      final existing = await (db.select(
        db.mostPlayStateTable,
      )..where((t) => t.trackId.equals(trackId))).getSingleOrNull();

      if (existing != null) {
        await (db.update(
          db.mostPlayStateTable,
        )..where((t) => t.trackId.equals(trackId))).write(
          MostPlayStateTableCompanion(
            playCount: Value(existing.playCount + 1),
            lastPlayedAt: Value(DateTime.now()),
          ),
        );
      } else {
        final count = await db.mostPlayStateTable.count().getSingle();
        if (count >= 110) {
          final deleteCount = count - 109;
          final toDelete =
              await (db.selectOnly(db.mostPlayStateTable)
                    ..addColumns([db.mostPlayStateTable.trackId])
                    ..orderBy([
                      OrderingTerm(expression: db.mostPlayStateTable.playCount),
                      OrderingTerm(
                        expression: db.mostPlayStateTable.lastPlayedAt,
                      ),
                    ])
                    ..limit(deleteCount))
                  .map((row) => row.read(db.mostPlayStateTable.trackId)!)
                  .get();

          await (db.delete(
            db.mostPlayStateTable,
          )..where((t) => t.trackId.isIn(toDelete))).go();
        }

        await db
            .into(db.mostPlayStateTable)
            .insert(
              MostPlayStateTableCompanion.insert(
                trackId: trackId,
                track: track,
                lastPlayedAt: Value(DateTime.now()),
              ),
            );
      }
    });
  }
}
