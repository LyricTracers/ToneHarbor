import 'package:freezed_annotation/freezed_annotation.dart';
part 'album.freezed.dart';
part 'album.g.dart';

@freezed
sealed class AvgRating with _$AvgRating {
  const AvgRating._();
  const factory AvgRating({int? rating}) = _AvgRating;
  factory AvgRating.fromJson(Map<String, dynamic> json) =>
      _$AvgRatingFromJson(json);
}

@freezed
sealed class AlbumAdditional with _$AlbumAdditional {
  const AlbumAdditional._();
  const factory AlbumAdditional({
    @JsonKey(name: 'avg_rating') AvgRating? avgRating,
  }) = _AlbumAdditional;
  factory AlbumAdditional.fromJson(Map<String, dynamic> json) =>
      _$AlbumAdditionalFromJson(json);
}

@freezed
sealed class AlbumItem with _$AlbumItem {
  const AlbumItem._();
  const factory AlbumItem({
    AlbumAdditional? additional,
    @JsonKey(name: 'album_artist') String? albumArtist,
    String? artist,
    @JsonKey(name: 'display_artist') String? displayArtist,
    String? name,
    int? year,
  }) = _AlbumItem;
  factory AlbumItem.fromJson(Map<String, dynamic> json) =>
      _$AlbumItemFromJson(json);
}

@freezed
sealed class AlbumRequest with _$AlbumRequest {
  const AlbumRequest._();
  const factory AlbumRequest({
    required String api,
    required String method,
    required int limit,
    required String library,
    required String additional,
    @JsonKey(name: 'sort_by') required String sortBy,
    @JsonKey(name: 'sort_direction') required String sortDirection,
    required int offset,
    required int version,
    String? artist,
  }) = _AlbumRequest;
  factory AlbumRequest.fromJson(Map<String, dynamic> json) =>
      _$AlbumRequestFromJson(json);
}

@freezed
sealed class SearchAlbumRequest with _$SearchAlbumRequest {
  const SearchAlbumRequest._();
  const factory SearchAlbumRequest({
    required String api,
    required String method,
    required int version,
    required String filter,
    required String library,
    required int limit,
    required int offset,
    @JsonKey(name: 'sort_by') required String sortBy,
    @JsonKey(name: 'sort_direction') required String sortDirection,
  }) = _SearchAlbumRequest;
  factory SearchAlbumRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchAlbumRequestFromJson(json);
}

@freezed
sealed class AlbumData with _$AlbumData {
  const AlbumData._();
  const factory AlbumData({
    List<AlbumItem>? albums,
    required int offset,
    required int total,
  }) = _AlbumData;
  factory AlbumData.fromJson(Map<String, dynamic> json) =>
      _$AlbumDataFromJson(json);
}

@freezed
sealed class AlbumResponse with _$AlbumResponse {
  const AlbumResponse._();
  const factory AlbumResponse({
    required bool success,
    AlbumData? data,
    Map<String, dynamic>? error,
  }) = _AlbumResponse;
  factory AlbumResponse.fromJson(Map<String, dynamic> json) =>
      _$AlbumResponseFromJson(json);
}
