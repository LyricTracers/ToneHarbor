import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/song.dart';
part 'folder.freezed.dart';
part 'folder.g.dart';

@freezed
sealed class FolderRequest with _$FolderRequest {
  const FolderRequest._();
  const factory FolderRequest({
    required String api,
    required String method,
    required int limit,
    required String library,
    required String additional,
    @JsonKey(name: 'sort_by') required String sortBy,
    @JsonKey(name: 'sort_direction') required String sortDirection,
    required int offset,
    required int version,
    String? id,
  }) = _FolderRequest;
  factory FolderRequest.fromJson(Map<String, dynamic> json) =>
      _$FolderRequestFromJson(json);
}

@freezed
sealed class FolderItem with _$FolderItem, AsTrack {
  const FolderItem._();
  const factory FolderItem({
    required String id,
    @JsonKey(name: 'is_personal') bool? isPersonal,
    required String path,
    required String title,
    required String type,
    // 暂时留空，需要根据实际的 SongAdditional 结构来定义
    SongAdditional? additional,
  }) = _FolderItem;
  factory FolderItem.fromJson(Map<String, dynamic> json) =>
      _$FolderItemFromJson(json);

  @override
  bool isSong() {
    return type != "folder";
  }

  @override
  ToneHarborTrackObject asTrack() {
    if (type == "folder") {
      return ToneHarborTrackObject.folder(id: id, title: title);
    }
    var artist = additional?.songTag?.artist;
    if (artist == null || artist.isEmpty) {
      artist = additional?.songTag?.albumArtist;
    }
    if (artist == null || artist.isEmpty) {
      artist = 'Unknown Artist';
    }
    var album = additional?.songTag?.album;
    if (album == null || album.isEmpty) {
      album = 'Unknown Album';
    }
    var container = additional?.songAudio?.container;
    if (container == null || container.isEmpty) {
      container = 'mp3';
    }

    var codec = additional?.songAudio?.codec;
    if (codec == null || codec.isEmpty) {
      codec = 'mp3';
    }
    return ToneHarborTrackObject.full(
      id: id,
      title: title,
      artist: artist,
      album: album,
      externalUri: "",
      duration: Duration(seconds: additional?.songAudio?.duration.toInt() ?? 0),
      rating: additional?.songRating?.rating ?? 0,
      filesize: additional?.songAudio?.filesize ?? 0,
      bitrate: additional?.songAudio?.bitrate ?? 0,
      channel: additional?.songAudio?.channel ?? 0,
      codec: codec,
      container: container,
      frequency: additional?.songAudio?.frequency ?? 0,
      platform: ToneHarborTrackPlatform.synology,
    );
  }
}

@freezed
sealed class FolderData with _$FolderData {
  const FolderData._();
  const factory FolderData({
    @JsonKey(name: 'folder_total') required int folderTotal,
    required String id,
    required List<FolderItem> items,
    required int offset,
    required int total,
  }) = _FolderData;
  factory FolderData.fromJson(Map<String, dynamic> json) =>
      _$FolderDataFromJson(json);
}

@freezed
sealed class FolderResponse with _$FolderResponse {
  const FolderResponse._();
  const factory FolderResponse({
    required bool success,
    FolderData? data,
    Map<String, dynamic>? error,
  }) = _FolderResponse;
  factory FolderResponse.fromJson(Map<String, dynamic> json) =>
      _$FolderResponseFromJson(json);
}
