import 'package:freezed_annotation/freezed_annotation.dart';
part 'artist.freezed.dart';
part 'artist.g.dart';

@freezed
sealed class AvgRating with _$AvgRating {
  const AvgRating._();
  const factory AvgRating({int? rating}) = _AvgRating;
  factory AvgRating.fromJson(Map<String, dynamic> json) =>
      _$AvgRatingFromJson(json);
}

@freezed
sealed class Additional with _$Additional {
  const Additional._();
  const factory Additional({AvgRating? avgRating}) = _Additional;
  factory Additional.fromJson(Map<String, dynamic> json) =>
      _$AdditionalFromJson(json);
}

@freezed
sealed class Artist with _$Artist {
  const Artist._();
  const factory Artist({String? name, Additional? additional}) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

@freezed
sealed class ArtistRequest with _$ArtistRequest {
  const ArtistRequest._();
  const factory ArtistRequest({
    required String api,
    required String method,
    required int limit,
    required String library,
    required String additional,
    @JsonKey(name: 'sort_by') required String sortBy,
    @JsonKey(name: 'sort_direction') required String sortDirection,
    required int offset,
    required int version,
  }) = _ArtistRequest;

  factory ArtistRequest.fromJson(Map<String, dynamic> json) =>
      _$ArtistRequestFromJson(json);
}

@freezed
sealed class ArtistData with _$ArtistData {
  const ArtistData._();
  const factory ArtistData({
    List<Artist>? artists,
    required int offset,
    required int total,
  }) = _ArtistData;

  factory ArtistData.fromJson(Map<String, dynamic> json) =>
      _$ArtistDataFromJson(json);
}

@freezed
sealed class ArtistResponse with _$ArtistResponse {
  const ArtistResponse._();
  const factory ArtistResponse({
    required bool success,
    ArtistData? data,
    Map<String, dynamic>? error,
  }) = _ArtistResponse;

  factory ArtistResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtistResponseFromJson(json);
}
