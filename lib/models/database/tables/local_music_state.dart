part of '../database.dart';

class LocalMusicState extends Table {
  TextColumn get trackId => text()();
  IntColumn get qualities => integer()();
  TextColumn get title => text()();
  TextColumn get artist => text().withDefault(const Constant(''))();
  TextColumn get album => text().withDefault(const Constant(''))();
  TextColumn get container => text()();
  IntColumn get duration => integer().withDefault(const Constant(0))();
  IntColumn get fileSize => integer().withDefault(const Constant(0))();
  IntColumn get bitrate => integer().withDefault(const Constant(0))();
  IntColumn get channel => integer().withDefault(const Constant(0))();
  TextColumn get codec => text().withDefault(const Constant(''))();
  IntColumn get frequency => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {trackId};
}
