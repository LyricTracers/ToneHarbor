part of '../database.dart';

class DownloadTaskState extends Table {
  TextColumn get trackId => text()();
  TextColumn get trackTitle => text()();
  TextColumn get trackArtist => text()();
  TextColumn get container => text()();
  IntColumn get type => intEnum<DownloadType>()();
  IntColumn get quality => intEnum<AudioQuality>()();
  IntColumn get status => intEnum<DownloadStatus>()();
  IntColumn get fileSize => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {trackId};
}
