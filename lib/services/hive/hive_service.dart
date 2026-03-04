import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toneharbor/services/hive/hive_adapters.dart';

class HiveService {
  static const String playerStateBox = 'audio_player_state';
  static const String playbackHistoryBox = 'playback_history';

  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter(AudioPlayerPersistedStateHiveAdapter());
    Hive.registerAdapter(SongHiveAdapter());
    Hive.registerAdapter(SongAdditionalHiveAdapter());
    Hive.registerAdapter(SongAudioHiveAdapter());
    Hive.registerAdapter(SongTagHiveAdapter());
    Hive.registerAdapter(SongRatingHiveAdapter());
    Hive.registerAdapter(PlaybackHistoryEntryHiveAdapter());

    try {
      await Hive.openBox<AudioPlayerPersistedStateHive>(playerStateBox);
      await Hive.openBox<PlaybackHistoryEntryHive>(playbackHistoryBox);
    } catch (e) {
      if (e.toString().contains('lock failed')) {
        final appDocDir = await getApplicationDocumentsDirectory();
        final lockFile = File('${appDocDir.path}/audio_player_state.lock');
        if (await lockFile.exists()) {
          await lockFile.delete();
        }
        await Hive.openBox<AudioPlayerPersistedStateHive>(playerStateBox);
        await Hive.openBox<PlaybackHistoryEntryHive>(playbackHistoryBox);
      } else {
        rethrow;
      }
    }
  }

  static Box<AudioPlayerPersistedStateHive> getPlayerStateBox() {
    return Hive.box<AudioPlayerPersistedStateHive>(playerStateBox);
  }

  static Box<PlaybackHistoryEntryHive> getPlaybackHistoryBox() {
    return Hive.box<PlaybackHistoryEntryHive>(playbackHistoryBox);
  }

  static Future<void> clearAll() async {
    await Hive.deleteFromDisk();
  }
}
