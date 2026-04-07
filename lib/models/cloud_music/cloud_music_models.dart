import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_music_models.freezed.dart';
part 'cloud_music_models.g.dart';

@freezed
sealed class CloudMusicPlaylist with _$CloudMusicPlaylist {
  const CloudMusicPlaylist._();
  const factory CloudMusicPlaylist({
    required int id,
    required String name,
    String? picUrl,
    String? coverImgUrl,
    String? description,
    int? playCount,
    int? trackCount,
    String? updateFrequency,
    String? copywriter,
    int? privacy,
  }) = _CloudMusicPlaylist;

  factory CloudMusicPlaylist.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicPlaylistFromJson(json);

  String get cover {
    if (picUrl != null && picUrl!.isNotEmpty) return picUrl!;
    return coverImgUrl ?? '';
  }

  String get coverUrl {
    if (cover.isNotEmpty) {
      return '${cover.replaceAll('http://', 'https://')}?param=512y512';
    }
    return '';
  }
}

@freezed
sealed class CloudMusicAlbum with _$CloudMusicAlbum {
  const CloudMusicAlbum._();
  const factory CloudMusicAlbum({
    required int id,
    required String name,
    String? picUrl,
    String? blurPicUrl,
    CloudMusicArtist? artist,
    List<CloudMusicArtist>? artists,
    int? publishTime,
    int? size,
    String? description,
    String? company,
    String? type,
    int? mark,
    int? copyrightId,
  }) = _CloudMusicAlbum;

  factory CloudMusicAlbum.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicAlbumFromJson(json);

  String get cover {
    if (picUrl != null && picUrl!.isNotEmpty) return picUrl!;
    return blurPicUrl ?? '';
  }

  String get coverUrl {
    if (cover.isNotEmpty) {
      return '${cover.replaceAll('http://', 'https://')}?param=512y512';
    }
    return '';
  }

  String get artistName {
    if (artist != null) return artist!.name;
    if (artists != null && artists!.isNotEmpty) return artists!.first.name;
    return '';
  }
}

@freezed
sealed class CloudMusicArtist with _$CloudMusicArtist {
  const CloudMusicArtist._();
  const factory CloudMusicArtist({
    required int id,
    required String name,
    required int picId,
    required int img1v1Id,
    required String picUrl,
    required String img1v1Url,
    required int musicSize,
    required int albumSize,
    required String briefDesc,
    required String trans,
    List<String>? alias,
    List<String>? transNames,
  }) = _CloudMusicArtist;

  factory CloudMusicArtist.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicArtistFromJson(json);

  String get cover {
    if (img1v1Url.isNotEmpty) {
      final img1v1ID = img1v1Url.split('/').last;
      if (img1v1ID == '5639395138885805.jpg') {
        // return 'https://p2.music.126.net/VnZiScyynLG7atLIZ2YPkw==/18686200114669622.jpg?param=512y512';
        return '';
      }
    }
    final img = img1v1Url.isNotEmpty ? img1v1Url : picUrl;
    return '${img.replaceAll('http://', 'https://')}?param=512y512';
  }
}

@freezed
sealed class CloudMusicSong with _$CloudMusicSong {
  const CloudMusicSong._();
  const factory CloudMusicSong({
    required int id,
    required String name,
    List<CloudMusicArtist>? ar,
    CloudMusicAlbumSimple? al,
    int? dt,
    int? pop,
    int? no,
    List<String>? reason,
    int? fee,
    int? copyright,
    int? mark,
    int? mv,
  }) = _CloudMusicSong;

  factory CloudMusicSong.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicSongFromJson(json);

  String get artistName => ar?.map((e) => e.name).join('/') ?? '';
  String get cover => al?.cover ?? '';
}

@freezed
sealed class CloudMusicAlbumSimple with _$CloudMusicAlbumSimple {
  const CloudMusicAlbumSimple._();
  const factory CloudMusicAlbumSimple({
    required int id,
    required String name,
    String? picUrl,
  }) = _CloudMusicAlbumSimple;

  factory CloudMusicAlbumSimple.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicAlbumSimpleFromJson(json);

  String get cover => picUrl ?? '';
}

@freezed
sealed class CloudMusicPlaylistDetail with _$CloudMusicPlaylistDetail {
  const CloudMusicPlaylistDetail._();
  const factory CloudMusicPlaylistDetail({
    required int id,
    required String name,
    String? coverImgUrl,
    String? description,
    int? playCount,
    int? trackCount,
    List<CloudMusicSong>? tracks,
    CloudMusicUser? creator,
    int? createTime,
    int? updateTime,
    int? subscribedCount,
    int? commentCount,
    List<String>? tags,
    int? privacy,
  }) = _CloudMusicPlaylistDetail;

  factory CloudMusicPlaylistDetail.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicPlaylistDetailFromJson(json);
}

@freezed
sealed class CloudMusicUser with _$CloudMusicUser {
  const factory CloudMusicUser({
    int? userId,
    String? nickname,
    String? avatarUrl,
    String? signature,
    String? backgroundUrl,
  }) = _CloudMusicUser;

  factory CloudMusicUser.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicUserFromJson(json);
}

@freezed
sealed class CloudMusicTopArtistsResponse with _$CloudMusicTopArtistsResponse {
  const factory CloudMusicTopArtistsResponse({
    required CloudMusicArtistList list,
  }) = _CloudMusicTopArtistsResponse;

  factory CloudMusicTopArtistsResponse.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicTopArtistsResponseFromJson(json);
}

@freezed
sealed class CloudMusicArtistList with _$CloudMusicArtistList {
  const factory CloudMusicArtistList({
    required List<CloudMusicArtist> artists,
  }) = _CloudMusicArtistList;

  factory CloudMusicArtistList.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicArtistListFromJson(json);
}

@freezed
sealed class CloudMusicNewAlbumsResponse with _$CloudMusicNewAlbumsResponse {
  const factory CloudMusicNewAlbumsResponse({
    required List<CloudMusicAlbum> albums,
  }) = _CloudMusicNewAlbumsResponse;

  factory CloudMusicNewAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicNewAlbumsResponseFromJson(json);
}

@freezed
sealed class CloudMusicHomeData with _$CloudMusicHomeData {
  const factory CloudMusicHomeData({
    @Default([]) List<CloudMusicPlaylist> recommendPlaylists,
    @Default([]) List<CloudMusicAlbum> newAlbums,
    @Default([]) List<CloudMusicPlaylist> topLists,
    @Default([]) List<CloudMusicArtist> topArtists,
  }) = _CloudMusicHomeData;

  factory CloudMusicHomeData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicHomeDataFromJson(json);
}
