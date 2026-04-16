import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';

part 'cloud_music_models.freezed.dart';
part 'cloud_music_models.g.dart';

@freezed
sealed class CloudMusicAlbumDetailData with _$CloudMusicAlbumDetailData {
  const CloudMusicAlbumDetailData._();
  factory CloudMusicAlbumDetailData({
    List<CloudMusicSongData>? songs,
    required CloudMusicAlbumData album,
  }) = _CloudMusicAlbumDetailData;
  factory CloudMusicAlbumDetailData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicAlbumDetailDataFromJson(json);
}

@freezed
sealed class CloudMusicAristDetailData with _$CloudMusicAristDetailData {
  const CloudMusicAristDetailData._();
  factory CloudMusicAristDetailData({
    required CloudMusicArtistData artist,
    List<CloudMusicArtistData>? similarArtists,
    List<CloudMusicAlbumData>? hotAlbums,
    List<CloudMusicSongData>? hotSongs,
    int? hotAlbumsFlag,
    int? hotSongFlag,
    int? similarArtistsFlag,
  }) = _CloudMusicAristDetailData;
  factory CloudMusicAristDetailData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicAristDetailDataFromJson(json);
}

@freezed
sealed class CloudMusicPlaylistDataList with _$CloudMusicPlaylistDataList {
  const CloudMusicPlaylistDataList._();
  const factory CloudMusicPlaylistDataList({
    required List<CloudMusicPlaylistData> playlists,
    required int total,
  }) = _CloudMusicPlaylistDataList;
  factory CloudMusicPlaylistDataList.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicPlaylistDataListFromJson(json);
}

@freezed
sealed class CloudMusicPlaylistData with _$CloudMusicPlaylistData {
  const CloudMusicPlaylistData._();
  const factory CloudMusicPlaylistData({
    required int id,
    required String name,
    String? picUrl,
    CloudMusicUserData? creator,
    String? coverImgUrl,
    String? description,
    int? playCount,
    int? trackCount,
    int? createTime,
    int? updateTime,
    String? updateFrequency,
    String? copywriter,
    int? privacy,
    double? totalDuration,
  }) = _CloudMusicPlaylistData;

  factory CloudMusicPlaylistData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicPlaylistDataFromJson(json);

  String get cover {
    if (picUrl != null && picUrl!.isNotEmpty) return picUrl!;
    return coverImgUrl ?? '';
  }

  String coverUrl({int size = 200}) {
    if (cover.isNotEmpty) {
      return '${cover.replaceAll('http://', 'https://')}?param=${size}y$size';
    }
    return '';
  }
}

@freezed
sealed class CloudMusicAlbumData with _$CloudMusicAlbumData {
  const CloudMusicAlbumData._();
  const factory CloudMusicAlbumData({
    required int id,
    required String name,
    String? picUrl,
    String? blurPicUrl,
    CloudMusicArtistData? artist,
    List<CloudMusicArtistData>? artists,
    int? publishTime,
    int? size,
    String? description,
    String? company,
    String? type,
    int? mark,
    int? copyrightId,
  }) = _CloudMusicAlbumData;

  factory CloudMusicAlbumData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicAlbumDataFromJson(json);

  String get cover {
    if (picUrl != null && picUrl!.isNotEmpty) return picUrl!;
    return blurPicUrl ?? '';
  }

  String coverUrl({int size = 200}) {
    if (cover.isNotEmpty) {
      return '${cover.replaceAll('http://', 'https://')}?param=${size}y$size';
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
sealed class CloudMusicArtistData with _$CloudMusicArtistData {
  const CloudMusicArtistData._();
  const factory CloudMusicArtistData({
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
  }) = _CloudMusicArtistData;

  factory CloudMusicArtistData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicArtistDataFromJson(json);

  String coverUrl({int size = 200}) {
    final img = picUrl != null && picUrl!.isNotEmpty
        ? picUrl!
        : img1v1Url ?? '';
    if (img1v1Url != null && img1v1Url!.isNotEmpty) {
      final img1v1ID = img.split('/').last;
      if (img1v1ID == '5639395138885805.jpg') {
        // return 'https://p2.music.126.net/VnZiScyynLG7atLIZ2YPkw==/18686200114669622.jpg?param=512y512';
        return '';
      }
    }
    if (img.isEmpty) return '';

    return '${img.replaceAll('http://', 'https://')}?param=${size}y$size';
  }
}

@freezed
sealed class CloudMusicSongData with _$CloudMusicSongData, AsTrack {
  const CloudMusicSongData._();
  const factory CloudMusicSongData({
    @JsonKey(name: 'id') required int songId,
    required String name,
    List<CloudMusicArtistData>? ar,
    CloudMusicAlbumData? al,
    CloudMusicPrivilegeData? privilege,
    int? dt,
    int? pop,
    int? no,
    int? fee,
    int? copyright,
    int? mark,
    int? mv,
    dynamic noCopyrightRcmd,
  }) = _CloudMusicSongData;

  factory CloudMusicSongData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicSongDataFromJson(json);

  @override
  String get id => songId.toString();

  String get artistName => ar?.map((e) => e.name).join('/') ?? '';
  String coverUrl({int size = 200, CloudMusicAlbumData? album}) {
    if (al != null && al!.cover.isNotEmpty) {
      return '${al!.cover.replaceAll('http://', 'https://')}?param=${size}y$size';
    }
    if (album != null && album.cover.isNotEmpty) {
      return '${album.cover.replaceAll('http://', 'https://')}?param=${size}y$size';
    }
    return '';
  }

  @override
  ToneHarborTrackObjectCloudMusic asTrack({CloudMusicAlbumData? album}) {
    return ToneHarborTrackObjectCloudMusic(
      id: id,
      title: name,
      artist: artistName,
      album: album?.name ?? al?.name ?? '',
      duration: Duration(milliseconds: dt ?? 0),
      coverUrl: coverUrl(album: album),
      fee: fee,
      noCopyrightRcmd: noCopyrightRcmd != null ? '1' : null,
      ar: ar,
      al: al,
      privilege: privilege,
    );
  }
}

@freezed
sealed class CloudMusicPlaylistDetailData with _$CloudMusicPlaylistDetailData {
  const CloudMusicPlaylistDetailData._();
  const factory CloudMusicPlaylistDetailData({
    required int id,
    required String name,
    String? coverImgUrl,
    String? description,
    int? trackCount,
    List<CloudMusicSongData>? tracks,
    List<CloudMusicTrackIdData>? trackIds,
    CloudMusicUserData? creator,
    int? createTime,
    List<String>? tags,
    int? privacy,
    bool? subscribed,
  }) = _CloudMusicPlaylistDetailData;

  factory CloudMusicPlaylistDetailData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicPlaylistDetailDataFromJson(json);
}

@freezed
sealed class CloudMusicTrackIdData with _$CloudMusicTrackIdData {
  const CloudMusicTrackIdData._();
  const factory CloudMusicTrackIdData({
    required int id,
    int? v,
    String? alg,
    int? uid,
  }) = _CloudMusicTrackIdData;

  factory CloudMusicTrackIdData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicTrackIdDataFromJson(json);
}

// @freezed
// sealed class CloudMusicSongDetailResponse with _$CloudMusicSongDetailResponse {
//   const CloudMusicSongDetailResponse._();
//   const factory CloudMusicSongDetailResponse({
//     required List<CloudMusicSongData> songs,
//     List<CloudMusicPrivilegeData>? privileges,
//   }) = _CloudMusicSongDetailResponse;

//   factory CloudMusicSongDetailResponse.fromJson(Map<String, dynamic> json) =>
//       _$CloudMusicSongDetailResponseFromJson(json);
// }

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
sealed class CloudMusicPrivilegeData with _$CloudMusicPrivilegeData {
  const CloudMusicPrivilegeData._();
  const factory CloudMusicPrivilegeData({
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
  }) = _CloudMusicPrivilegeData;

  factory CloudMusicPrivilegeData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicPrivilegeDataFromJson(json);
}

@freezed
sealed class CloudMusicUserData with _$CloudMusicUserData {
  const factory CloudMusicUserData({
    required int userId,
    required String nickname,
    String? avatarUrl,
    String? backgroundUrl,
    int? vipType,
    int? createTime,
    String? signature,
    String? userName,
  }) = _CloudMusicUserData;

  factory CloudMusicUserData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicUserDataFromJson(json);
}

@freezed
sealed class CloudMusicLyricModel with _$CloudMusicLyricModel {
  const CloudMusicLyricModel._();
  const factory CloudMusicLyricModel({String? lyric, int? version}) =
      _CloudMusicLyricModel;

  factory CloudMusicLyricModel.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicLyricModelFromJson(json);
}

@freezed
sealed class CloudMusicLyricData with _$CloudMusicLyricData {
  const CloudMusicLyricData._();

  const factory CloudMusicLyricData({
    CloudMusicLyricModel? lrc,
    CloudMusicLyricModel? klyric,
    CloudMusicLyricModel? tlyric,
    CloudMusicLyricModel? ytlrc,
    CloudMusicLyricModel? romalrc,
    CloudMusicLyricModel? yrc,
    required int code,
  }) = _CloudMusicLyricData;

  factory CloudMusicLyricData.fromJson(Map<String, dynamic> json) =>
      _$CloudMusicLyricDataFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return {
      'lrc': lrc?.toJson(),
      'klyric': klyric?.toJson(),
      'tlyric': tlyric?.toJson(),
      'ytlrc': ytlrc?.toJson(),
      'romalrc': romalrc?.toJson(),
      'yrc': yrc?.toJson(),
      'code': code,
    };
  }
}

@freezed
sealed class CloudSearchData with _$CloudSearchData {
  const CloudSearchData._();
  const factory CloudSearchData({
    List<CloudMusicSongData>? songs,
    List<CloudMusicArtistData>? artists,
    List<CloudMusicAlbumData>? albums,
  }) = _CloudSearchData;
  factory CloudSearchData.fromJson(Map<String, dynamic> json) =>
      _$CloudSearchDataFromJson(json);
}
