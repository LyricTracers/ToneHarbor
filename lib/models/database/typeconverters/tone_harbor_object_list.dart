part of '../database.dart';

class ToneHarborObjectListConverter
    extends TypeConverter<List<ToneHarborTrackObject>, String> {
  const ToneHarborObjectListConverter();

  @override
  List<ToneHarborTrackObject> fromSql(String fromDb) {
    final raw = (jsonDecode(fromDb) as List).cast<Map>();

    return raw
        .map((e) => ToneHarborTrackObject.fromJson(e.cast<String, dynamic>()))
        .toList();
  }

  @override
  String toSql(List<ToneHarborTrackObject> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}
