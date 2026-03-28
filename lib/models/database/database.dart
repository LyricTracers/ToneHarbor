import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:drift/native.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/audio_player/download_manager.dart';
part 'database.g.dart';

part 'tables/audio_player_state.dart';
part 'tables/favorite_playlist_state.dart';
part 'tables/download_task_state.dart';
part 'tables/local_music_state.dart';
part 'tables/most_play_state.dart';

part 'typeconverters/string_list.dart';
part 'typeconverters/tone_harbor_object_list.dart';
part 'typeconverters/tone_harbor_object.dart';

@DriftDatabase(
  tables: [
    AudioPlayerStateTable,
    FavoritePlaylistStateTable,
    DownloadTaskState,
    LocalMusicState,
    MostPlayStateTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.createTable(localMusicState);
        }
        if (from < 3) {
          await m.dropColumn(localMusicState, 'path');
        }
        if (from < 4) {
          await m.deleteTable(localMusicState.actualTableName);
          await m.createTable(localMusicState);
        }
        if (from < 5) {
          await m.createTable(mostPlayStateTable);
        }
        if (from < 6) {
          await m.addColumn(localMusicState, localMusicState.rating);
          await m.addColumn(localMusicState, localMusicState.externalUri);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cacheBase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cacheBase;

    return NativeDatabase.createInBackground(file);
  });
}
