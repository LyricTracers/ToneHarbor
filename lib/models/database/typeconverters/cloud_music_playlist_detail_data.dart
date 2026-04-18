part of '../database.dart';

class CloudMusicPlaylistDetailDataConverter
    extends TypeConverter<CloudMusicPlaylistDetailData, String> {
  const CloudMusicPlaylistDetailDataConverter();

  @override
  CloudMusicPlaylistDetailData fromSql(String fromDb) {
    final raw = jsonDecode(fromDb) as Map<String, dynamic>;
    return CloudMusicPlaylistDetailData.fromJson(raw);
  }

  @override
  String toSql(CloudMusicPlaylistDetailData value) {
    return jsonEncode(value.toJson());
  }
}
