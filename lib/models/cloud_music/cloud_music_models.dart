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
    int? picId,
    int? img1v1Id,
    String? picUrl,
    String? img1v1Url,
    int? musicSize,
    int? albumSize,
    String? briefDesc,
    String? trans,
    List<String>? alias,
    List<String>? transNames,
  }) = _CloudMusicArtist;

  factory CloudMusicArtist.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicArtistFromJson(json);

  String get cover {
    if (img1v1Url != null && img1v1Url!.isNotEmpty) {
      final img1v1ID = img1v1Url!.split('/').last;
      if (img1v1ID == '5639395138885805.jpg') {
        // return 'https://p2.music.126.net/VnZiScyynLG7atLIZ2YPkw==/18686200114669622.jpg?param=512y512';
        return '';
      }
    }
    final img = img1v1Url != null && img1v1Url!.isNotEmpty
        ? img1v1Url!
        : picUrl ?? '';
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
sealed class CloudMusicPlaylistDetailData with _$CloudMusicPlaylistDetailData {
  const CloudMusicPlaylistDetailData._();
  const factory CloudMusicPlaylistDetailData({
    required int id,
    required String name,
    String? coverImgUrl,
    String? description,
    int? playCount,
    int? trackCount,
    List<CloudMusicSong>? tracks,
    List<CloudMusicTrackId>? trackIds,
    CloudMusicUser? creator,
    int? createTime,
    int? updateTime,
    int? subscribedCount,
    int? commentCount,
    List<String>? tags,
    int? privacy,
    bool? subscribed,
  }) = _CloudMusicPlaylistDetailData;

  factory CloudMusicPlaylistDetailData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicPlaylistDetailDataFromJson(json);
}

@freezed
sealed class CloudMusicTrackId with _$CloudMusicTrackId {
  const CloudMusicTrackId._();
  const factory CloudMusicTrackId({
    required int id,
    int? v,
    int? alg,
    int? uid,
  }) = _CloudMusicTrackId;

  factory CloudMusicTrackId.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicTrackIdFromJson(json);
}

@freezed
sealed class CloudMusicSongDetailResponse with _$CloudMusicSongDetailResponse {
  const CloudMusicSongDetailResponse._();
  const factory CloudMusicSongDetailResponse({
    required List<CloudMusicSong> songs,
    List<CloudMusicPrivilege>? privileges,
  }) = _CloudMusicSongDetailResponse;

  factory CloudMusicSongDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicSongDetailResponseFromJson(json);
}

// id 歌曲 ID 用于匹配歌曲和权限
// fee 费用标志 1 =VIP专享, 4 =付费专辑, 0 =免费
//payed 是否已付费 0 =未付费, 1 =已付费
//st 状态 < 0 表示已下架（需登录）
//pl 播放等级 > 0 表示可播放（320kbps等）
//dl 下载等级 表示可下载的音质
//sp 最高音质等级 最高可播放音质
// cp 版权标志 1 =有版权
//subp 订阅标志 订阅用户专属
//cs 云盘歌曲 true =云盘存储的音乐
//maxbr 最大比特率 最大可播放比特率(如 320000=320kbps)
//fl 当前音质 当前可用音质
//toast 是否提示 是否有提示信息
//flag 综合标志 其他状态标志
@freezed
sealed class CloudMusicPrivilege with _$CloudMusicPrivilege {
  const factory CloudMusicPrivilege({
    required int id,
    int? fee,
    int? payed,
    int? st,
    int? pl,
    int? dl,
    int? sp,
    int? cp,
    int? subp,
    bool? cs,
    int? maxbr,
    int? fl,
    bool? toast,
    int? flag,
  }) = _CloudMusicPrivilege;

  factory CloudMusicPrivilege.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicPrivilegeFromJson(json);
}

@freezed
sealed class CloudMusicUser with _$CloudMusicUser {
  const factory CloudMusicUser({
    required int userId,
    required String nickname,
    String? avatarUrl,
    int? vipType,
    int? createTime,
    String? signature,
    String? userName,
  }) = _CloudMusicUser;

  factory CloudMusicUser.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicUserFromJson(json);
}
