part of '../database.dart';

class FavoritePlaylistStateTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get playlistId => text()();
  TextColumn get title => text()();
  TextColumn get cloudData =>
      text().nullable().map(const CloudMusicPlaylistDetailDataConverter())();
}
