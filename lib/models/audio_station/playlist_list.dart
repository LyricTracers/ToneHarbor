import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toneharbor/models/audio_station/song.dart';
part 'playlist_list.freezed.dart';
part 'playlist_list.g.dart';

@freezed
sealed class PlaylistInfo with _$PlaylistInfo {
  const PlaylistInfo._();
  const factory PlaylistInfo({
    required String id,
    required String library,
    required String name,
    @JsonKey(name: 'sharing_status') required String sharingStatus,
    required String type,
  }) = _PlaylistInfo;
  factory PlaylistInfo.fromJson(Map<String, dynamic> json) =>
      _$PlaylistInfoFromJson(json);
}

@freezed
sealed class PlaylistSharingInfo with _$PlaylistSharingInfo {
  const PlaylistSharingInfo._();
  const factory PlaylistSharingInfo({
    @JsonKey(name: 'date_available') required String dateAvailable,
    @JsonKey(name: 'date_expired') required String dateExpired,
    required String id,
    required String status,
    required String url,
  }) = _PlaylistSharingInfo;
  factory PlaylistSharingInfo.fromJson(Map<String, dynamic> json) =>
      _$PlaylistSharingInfoFromJson(json);
}

@freezed
sealed class PlaylistDetailAdditional with _$PlaylistDetailAdditional {
  const PlaylistDetailAdditional._();
  const factory PlaylistDetailAdditional({
    @JsonKey(name: 'sharing_info') PlaylistSharingInfo? sharingInfo,
    List<Song>? songs,
    @JsonKey(name: 'songs_offset') required int songsOffset,
    @JsonKey(name: 'songs_total') required int songsTotal,
  }) = _PlaylistDetailAdditional;
  factory PlaylistDetailAdditional.fromJson(Map<String, dynamic> json) =>
      _$PlaylistDetailAdditionalFromJson(json);
}

@freezed
sealed class PlaylistDetailInfo with _$PlaylistDetailInfo {
  const PlaylistDetailInfo._();
  const factory PlaylistDetailInfo({
    required String id,
    required String library,
    required String name,
    @JsonKey(name: 'sharing_status') required String sharingStatus,
    required String type,
    PlaylistDetailAdditional? additional,
  }) = _PlaylistDetailInfo;
  factory PlaylistDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$PlaylistDetailInfoFromJson(json);
}

@freezed
sealed class PlaylistDetailData with _$PlaylistDetailData {
  const PlaylistDetailData._();
  const factory PlaylistDetailData({List<PlaylistDetailInfo>? playlists}) =
      _PlaylistDetailData;
  factory PlaylistDetailData.fromJson(Map<String, dynamic> json) =>
      _$PlaylistDetailDataFromJson(json);
}

@freezed
sealed class PlaylistDetailResponse with _$PlaylistDetailResponse {
  const PlaylistDetailResponse._();
  const factory PlaylistDetailResponse({
    required bool success,
    PlaylistDetailData? data,
    Map<String, dynamic>? error,
  }) = _PlaylistDetailResponse;
  factory PlaylistDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaylistDetailResponseFromJson(json);
}

@freezed
sealed class PlaylistDetailRequest with _$PlaylistDetailRequest {
  const PlaylistDetailRequest._();
  const factory PlaylistDetailRequest({
    required String api,
    required String method,
    required String id,
    required String library,
    required String additional,
    required int version,
    required int limit,
    required int offset,
    @JsonKey(name: 'sort_by') required String sortBy,
    @JsonKey(name: 'sort_direction') required String sortDirection,
  }) = _PlaylistDetailRequest;
  factory PlaylistDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaylistDetailRequestFromJson(json);
}

@freezed
sealed class PlaylistListRequest with _$PlaylistListRequest {
  const PlaylistListRequest._();
  const factory PlaylistListRequest({
    required String api,
    required String method,
    required int limit,
    required String library,
    required int offset,
    required String sortBy,
    required String sortDirection,
    required int version,
  }) = _PlaylistListRequest;
  factory PlaylistListRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaylistListRequestFromJson(json);
}

@freezed
sealed class PlaylistListData with _$PlaylistListData {
  const PlaylistListData._();
  const factory PlaylistListData({
    required int offset,
    List<PlaylistInfo>? playlists,
    required int total,
  }) = _PlaylistListData;
  factory PlaylistListData.fromJson(Map<String, dynamic> json) =>
      _$PlaylistListDataFromJson(json);
}

@freezed
sealed class PlaylistListResponse with _$PlaylistListResponse {
  const PlaylistListResponse._();
  const factory PlaylistListResponse({
    required bool success,
    PlaylistListData? data,
    Map<String, dynamic>? error,
  }) = _PlaylistListResponse;
  factory PlaylistListResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaylistListResponseFromJson(json);
}

@freezed
sealed class CreatePlaylistRequest with _$CreatePlaylistRequest {
  const CreatePlaylistRequest._();
  const factory CreatePlaylistRequest({
    required String api,
    required String method,
    required String name,
    required String library,
    required int version,
  }) = _CreatePlaylistRequest;
  factory CreatePlaylistRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePlaylistRequestFromJson(json);
}

@freezed
sealed class CreatePlaylistData with _$CreatePlaylistData {
  const CreatePlaylistData._();
  const factory CreatePlaylistData({required String id}) = _CreatePlaylistData;
  factory CreatePlaylistData.fromJson(Map<String, dynamic> json) =>
      _$CreatePlaylistDataFromJson(json);
}

@freezed
sealed class CreatePlaylistResponse with _$CreatePlaylistResponse {
  const CreatePlaylistResponse._();
  const factory CreatePlaylistResponse({
    required bool success,
    CreatePlaylistData? data,
  }) = _CreatePlaylistResponse;
  factory CreatePlaylistResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePlaylistResponseFromJson(json);
}

@freezed
sealed class RenamePlaylistRequest with _$RenamePlaylistRequest {
  const RenamePlaylistRequest._();
  const factory RenamePlaylistRequest({
    required String api,
    required String method,
    required String id,
    @JsonKey(name: 'new_name') required String newName,
    required int version,
  }) = _RenamePlaylistRequest;
  factory RenamePlaylistRequest.fromJson(Map<String, dynamic> json) =>
      _$RenamePlaylistRequestFromJson(json);
}

@freezed
sealed class RenamePlaylistData with _$RenamePlaylistData {
  const RenamePlaylistData._();
  const factory RenamePlaylistData({required String id}) = _RenamePlaylistData;
  factory RenamePlaylistData.fromJson(Map<String, dynamic> json) =>
      _$RenamePlaylistDataFromJson(json);
}

@freezed
sealed class RenamePlaylistResponse with _$RenamePlaylistResponse {
  const RenamePlaylistResponse._();
  const factory RenamePlaylistResponse({
    required bool success,
    RenamePlaylistData? data,
  }) = _RenamePlaylistResponse;
  factory RenamePlaylistResponse.fromJson(Map<String, dynamic> json) =>
      _$RenamePlaylistResponseFromJson(json);
}

@freezed
sealed class DeletePlaylistRequest with _$DeletePlaylistRequest {
  const DeletePlaylistRequest._();
  const factory DeletePlaylistRequest({
    required String api,
    required String method,
    required String id,
    required int version,
  }) = _DeletePlaylistRequest;
  factory DeletePlaylistRequest.fromJson(Map<String, dynamic> json) =>
      _$DeletePlaylistRequestFromJson(json);
}

@freezed
sealed class DeletePlaylistData with _$DeletePlaylistData {
  const DeletePlaylistData._();
  const factory DeletePlaylistData({List<dynamic>? errors}) =
      _DeletePlaylistData;
  factory DeletePlaylistData.fromJson(Map<String, dynamic> json) =>
      _$DeletePlaylistDataFromJson(json);
}

@freezed
sealed class DeletePlaylistResponse with _$DeletePlaylistResponse {
  const DeletePlaylistResponse._();
  const factory DeletePlaylistResponse({
    required bool success,
    DeletePlaylistData? data,
  }) = _DeletePlaylistResponse;
  factory DeletePlaylistResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePlaylistResponseFromJson(json);
}

@freezed
sealed class AddPlaylistSongsRequest with _$AddPlaylistSongsRequest {
  const AddPlaylistSongsRequest._();
  const factory AddPlaylistSongsRequest({
    required String api,
    required String method,
    required int offset,
    required int limit,
    required String id,
    required String songs,
    required int version,
    @JsonKey(name: 'skip_duplicate') bool? skipDuplicate,
  }) = _AddPlaylistSongsRequest;
  factory AddPlaylistSongsRequest.fromJson(Map<String, dynamic> json) =>
      _$AddPlaylistSongsRequestFromJson(json);
}

@freezed
sealed class AddPlaylistSongsResponse with _$AddPlaylistSongsResponse {
  const AddPlaylistSongsResponse._();
  const factory AddPlaylistSongsResponse({required bool success}) =
      _AddPlaylistSongsResponse;
  factory AddPlaylistSongsResponse.fromJson(Map<String, dynamic> json) =>
      _$AddPlaylistSongsResponseFromJson(json);
}

@freezed
sealed class RemoveMissingSongsRequest with _$RemoveMissingSongsRequest {
  const RemoveMissingSongsRequest._();
  const factory RemoveMissingSongsRequest({
    required String api,
    required String method,
    required String id,
    required int version,
  }) = _RemoveMissingSongsRequest;
  factory RemoveMissingSongsRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoveMissingSongsRequestFromJson(json);
}

@freezed
sealed class RemoveMissingSongsResponse with _$RemoveMissingSongsResponse {
  const RemoveMissingSongsResponse._();
  const factory RemoveMissingSongsResponse({required bool success}) =
      _RemoveMissingSongsResponse;
  factory RemoveMissingSongsResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveMissingSongsResponseFromJson(json);
}
