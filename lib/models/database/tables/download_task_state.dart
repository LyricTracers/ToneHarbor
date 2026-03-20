part of '../database.dart';

class DownloadTaskState extends Table {
  TextColumn get trackId => text()();
  TextColumn get trackTitle => text()();
  TextColumn get trackArtist => text()();
  TextColumn get container => text()();
  IntColumn get type => intEnum<DownloadType>()(); // 0=normal, 1=preload
  IntColumn get quality => intEnum<AudioQuality>()();
}
