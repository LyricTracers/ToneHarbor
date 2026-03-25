import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/database/database.dart';
part 'most_player_provider.g.dart';

@riverpod
class MostPlayerNotifier extends _$MostPlayerNotifier {
  @override
  Future<SongListResponse> build({String sortDirection = 'desc'}) async {
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

    final songs = records.map((e) {
      final track = e.track;
      return Song(
        id: track.id,
        path: '',
        title: track.title,
        type: 'song',
        additional: SongAdditional(
          songAudio: SongAudio(
            bitrate: track.bitrate,
            channel: track.channel,
            codec: track.codec,
            container: track.container,
            duration: track.duration.inSeconds,
            filesize: track.filesize,
            frequency: track.frequency,
          ),
          songTag: SongTag(
            album: track.album,
            artist: track.artist,
            disc: 0,
            genre: '',
            track: 0,
            year: 0,
          ),
          songRating: SongRating(rating: track.rating),
        ),
      );
    }).toList();

    return SongListResponse(
      success: true,
      data: SongData(songs: songs, total: songs.length, offset: 0),
    );
  }

  // Future<void> incrementPlayCount(ToneHarborTrackObject track) async {
  //   final db = ref.read(appDatabaseProvider);
  //   final existing = await (db.select(
  //     db.mostPlayStateTable,
  //   )..where((t) => t.trackId.equals(track.id))).getSingleOrNull();

  //   if (existing == null) {
  //     await db
  //         .into(db.mostPlayStateTable)
  //         .insert(
  //           MostPlayStateTableCompanion.insert(trackId: track.id, track: track),
  //         );
  //   } else {
  //     await (db.update(
  //       db.mostPlayStateTable,
  //     )..where((t) => t.trackId.equals(track.id))).write(
  //       MostPlayStateTableCompanion(
  //         playCount: Value(existing.playCount + 1),
  //         lastPlayedAt: Value(DateTime.now()),
  //       ),
  //     );
  //   }

  //   ref.invalidateSelf();
  // }
}
