import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/database/database.dart';
part 'most_player_provider.g.dart';

@riverpod
class MostPlayerNotifier extends _$MostPlayerNotifier {
  @override
  Future<ToneHarborTrackObjectList> build({String sortDirection = 'desc'}) async {
    final db = ref.read(appDatabaseProvider);
    final query = db.select(db.mostPlayStateTable);
    query.orderBy([
      (t) => OrderingTerm(
        expression: t.playCount,
        mode: sortDirection == 'asc' ? OrderingMode.asc : OrderingMode.desc,
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
}
