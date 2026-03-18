import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toneharbor/providers/providers.dart';
part 'sub_content_state.freezed.dart';
part 'sub_content_state.g.dart';

@freezed
sealed class SubContentData with _$SubContentData {
  const SubContentData._();
  const factory SubContentData({required SubContentType type, String? extra}) =
      _SubContentData;
  factory SubContentData.fromJson(Map<String, dynamic> json) =>
      _$SubContentDataFromJson(json);
}
