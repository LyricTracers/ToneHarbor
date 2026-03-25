part of '../database.dart';

class MostPlayStateTable extends Table {
  TextColumn get trackId => text()();
  IntColumn get playCount => integer().withDefault(const Constant(1))();
  DateTimeColumn get lastPlayedAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get track => text().map(const ToneHarborObjectConverter())();

  @override
  Set<Column> get primaryKey => {trackId};
}
