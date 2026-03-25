part of '../database.dart';

class ToneHarborObjectConverter
    extends TypeConverter<ToneHarborTrackObject, String> {
  const ToneHarborObjectConverter();

  @override
  ToneHarborTrackObject fromSql(String fromDb) {
    final raw = jsonDecode(fromDb) as Map<String, dynamic>;
    return ToneHarborTrackObject.fromJson(raw);
  }

  @override
  String toSql(ToneHarborTrackObject value) {
    return jsonEncode(value.toJson());
  }
}
