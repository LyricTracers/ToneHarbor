part of '../database.dart';

class AudioPlayerStateTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get playing => boolean()();
  TextColumn get loopMode => textEnum<PlaylistMode>()();
  BoolColumn get shuffled => boolean()();
  TextColumn get collections => text().map(const StringListConverter())();
  TextColumn get tracks => text()
      .map(const ToneHarborObjectListConverter())
      .withDefault(const Constant("[]"))();
  IntColumn get currentIndex => integer().withDefault(const Constant(0))();
}
