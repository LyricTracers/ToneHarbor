import 'package:freezed_annotation/freezed_annotation.dart';
part 'song.freezed.dart';
part 'song.g.dart';

@freezed
sealed class SongRequest with _$SongRequest {
  const SongRequest._();
  const factory SongRequest({
    required String api,
    required String method,
    required String version,
    required int limit,
    required String library,
    required String additional,
    @JsonKey(name: 'sort_by') required String sortBy,
    @JsonKey(name: 'sort_direction') required String sortDirection,
    required int offset,
    String? artist,
  }) = _SongRequest;
  factory SongRequest.fromJson(Map<String, dynamic> json) =>
      _$SongRequestFromJson(json);
}

@freezed
sealed class SongAudio with _$SongAudio {
  const SongAudio._();
  const factory SongAudio({
    required int bitrate,
    required int channel,
    required String codec,
    required String container,
    required int duration,
    required int filesize,
    required int frequency,
  }) = _SongAudio;
  factory SongAudio.fromJson(Map<String, dynamic> json) =>
      _$SongAudioFromJson(json);
}

@freezed
sealed class SongRating with _$SongRating {
  const SongRating._();
  const factory SongRating({required int rating}) = _SongRating;
  factory SongRating.fromJson(Map<String, dynamic> json) =>
      _$SongRatingFromJson(json);
}

@freezed
sealed class SongTag with _$SongTag {
  const SongTag._();
  const factory SongTag({
    String? album,
    @JsonKey(name: 'album_artist') String? albumArtist,
    String? artist,
    String? comment,
    String? composer,
    required int disc,
    String? genre,
    required int track,
    required int year,
  }) = _SongTag;
  factory SongTag.fromJson(Map<String, dynamic> json) =>
      _$SongTagFromJson(json);
}

@freezed
sealed class SongAdditional with _$SongAdditional {
  const SongAdditional._();
  const factory SongAdditional({
    @JsonKey(name: 'song_audio') SongAudio? songAudio,
    @JsonKey(name: 'song_rating') SongRating? songRating,
    @JsonKey(name: 'song_tag') SongTag? songTag,
  }) = _SongAdditional;
  factory SongAdditional.fromJson(Map<String, dynamic> json) =>
      _$SongAdditionalFromJson(json);
}

@freezed
sealed class Song with _$Song {
  const Song._();
  const factory Song({
    required String id,
    required String path,
    required String title,
    required String type,
    SongAdditional? additional,
  }) = _Song;
  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}

@freezed
sealed class SongData with _$SongData {
  const SongData._();
  const factory SongData({required List<Song> songs, int? offset, int? total}) =
      _SongData;
  factory SongData.fromJson(Map<String, dynamic> json) =>
      _$SongDataFromJson(json);
}

@freezed
sealed class SongListResponse with _$SongListResponse {
  const SongListResponse._();
  const factory SongListResponse({required bool success, SongData? data}) =
      _SongListResponse;
  factory SongListResponse.fromJson(Map<String, dynamic> json) =>
      _$SongListResponseFromJson(json);
}

@freezed
sealed class SetRatingRequest with _$SetRatingRequest {
  const SetRatingRequest._();
  const factory SetRatingRequest({
    required String api,
    required String method,
    required String id,
    required int rating,
    required int version,
  }) = _SetRatingRequest;
  factory SetRatingRequest.fromJson(Map<String, dynamic> json) =>
      _$SetRatingRequestFromJson(json);
}

@freezed
sealed class SetRatingResponse with _$SetRatingResponse {
  const SetRatingResponse._();
  const factory SetRatingResponse({required bool success}) = _SetRatingResponse;
  factory SetRatingResponse.fromJson(Map<String, dynamic> json) =>
      _$SetRatingResponseFromJson(json);
}

@freezed
sealed class AlbumSongsRequest with _$AlbumSongsRequest {
  const AlbumSongsRequest._();
  const factory AlbumSongsRequest({
    required String api,
    required String method,
    required String version,
    required int limit,
    required String library,
    required String additional,
    @JsonKey(name: 'sort_by') required String sortBy,
    @JsonKey(name: 'sort_direction') required String sortDirection,
    required int offset,
    required String album,
    @JsonKey(name: 'album_artist') required String albumArtist,
    String? artist,
  }) = _AlbumSongsRequest;
  factory AlbumSongsRequest.fromJson(Map<String, dynamic> json) =>
      _$AlbumSongsRequestFromJson(json);
}

@freezed
sealed class BatchDownloadRequest with _$BatchDownloadRequest {
  const BatchDownloadRequest._();
  const factory BatchDownloadRequest({
    required String api,
    required String method,
    required String version,
    required String songs,
    required String library,
    String? filename,
  }) = _BatchDownloadRequest;
  factory BatchDownloadRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchDownloadRequestFromJson(json);
}

@freezed
sealed class LyricsRequest with _$LyricsRequest {
  const LyricsRequest._();
  const factory LyricsRequest({
    required String api,
    required String method,
    required String id,
    required int version,
  }) = _LyricsRequest;
  factory LyricsRequest.fromJson(Map<String, dynamic> json) =>
      _$LyricsRequestFromJson(json);
}

@freezed
sealed class LyricsData with _$LyricsData {
  const LyricsData._();
  const factory LyricsData({required String lyrics}) = _LyricsData;
  factory LyricsData.fromJson(Map<String, dynamic> json) =>
      _$LyricsDataFromJson(json);
}

@freezed
sealed class LyricsResponse with _$LyricsResponse {
  const LyricsResponse._();
  const factory LyricsResponse({required bool success, LyricsData? data}) =
      _LyricsResponse;
  factory LyricsResponse.fromJson(Map<String, dynamic> json) =>
      _$LyricsResponseFromJson(json);
}

@freezed
sealed class SearchLyricsRequest with _$SearchLyricsRequest {
  const SearchLyricsRequest._();
  const factory SearchLyricsRequest({
    required String api,
    required String method,
    required String version,
    required String title,
    String? artist,
    @Default(10) int limit,
    @Default('full_lyrics') String additional,
  }) = _SearchLyricsRequest;
  factory SearchLyricsRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchLyricsRequestFromJson(json);
}

@freezed
sealed class LyricsSearchAdditional with _$LyricsSearchAdditional {
  const LyricsSearchAdditional._();
  const factory LyricsSearchAdditional({required String full_lyrics}) =
      _LyricsSearchAdditional;
  factory LyricsSearchAdditional.fromJson(Map<String, dynamic> json) =>
      _$LyricsSearchAdditionalFromJson(json);
}

@freezed
sealed class LyricsSearchResult with _$LyricsSearchResult {
  const LyricsSearchResult._();
  const factory LyricsSearchResult({
    required String id,
    required String title,
    required String artist,
    required String partial_lyrics,
    required String plugin,
    LyricsSearchAdditional? additional,
  }) = _LyricsSearchResult;
  factory LyricsSearchResult.fromJson(Map<String, dynamic> json) =>
      _$LyricsSearchResultFromJson(json);
}

@freezed
sealed class SearchLyricsData with _$SearchLyricsData {
  const SearchLyricsData._();
  const factory SearchLyricsData({required List<LyricsSearchResult> lyrics}) =
      _SearchLyricsData;
  factory SearchLyricsData.fromJson(Map<String, dynamic> json) =>
      _$SearchLyricsDataFromJson(json);
}

@freezed
sealed class SearchLyricsResponse with _$SearchLyricsResponse {
  const SearchLyricsResponse._();
  const factory SearchLyricsResponse({
    required bool success,
    SearchLyricsData? data,
  }) = _SearchLyricsResponse;
  factory SearchLyricsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchLyricsResponseFromJson(json);
}

@freezed
sealed class GetNumberOfPlugInsRequest with _$GetNumberOfPlugInsRequest {
  const GetNumberOfPlugInsRequest._();
  const factory GetNumberOfPlugInsRequest({required String action}) =
      _GetNumberOfPlugInsRequest;
  factory GetNumberOfPlugInsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetNumberOfPlugInsRequestFromJson(json);
}

@freezed
sealed class GetNumberOfPlugInsResponse with _$GetNumberOfPlugInsResponse {
  const GetNumberOfPlugInsResponse._();
  const factory GetNumberOfPlugInsResponse({
    required bool success,
    required int hasPlugIn,
  }) = _GetNumberOfPlugInsResponse;
  factory GetNumberOfPlugInsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNumberOfPlugInsResponseFromJson(json);
}

@freezed
sealed class SongInfoRequest with _$SongInfoRequest {
  const SongInfoRequest._();
  const factory SongInfoRequest({
    required String api,
    required String method,
    required String version,
    required String id,
    required String additional,
  }) = _SongInfoRequest;
  factory SongInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$SongInfoRequestFromJson(json);
}

@freezed
sealed class SongInfoResponse with _$SongInfoResponse {
  const SongInfoResponse._();
  const factory SongInfoResponse({
    required bool success,
    required SongData data,
  }) = _SongInfoResponse;
  factory SongInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$SongInfoResponseFromJson(json);
}

@freezed
sealed class SearchSongRequest with _$SearchSongRequest {
  const SearchSongRequest._();
  const factory SearchSongRequest({
    required String api,
    required String method,
    required String version,
    required String additional,
    required String library,
    required int limit,
    required int offset,
    @JsonKey(name: 'sort_direction') required String sortDirection,
    required String title,
  }) = _SearchSongRequest;
  factory SearchSongRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchSongRequestFromJson(json);
}
