// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_music_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CloudMusicAlbumDetailData _$CloudMusicAlbumDetailDataFromJson(
  Map<String, dynamic> json,
) => _CloudMusicAlbumDetailData(
  songs: (json['songs'] as List<dynamic>?)
      ?.map((e) => CloudMusicSongData.fromJson(e as Map<String, dynamic>))
      .toList(),
  album: CloudMusicAlbumData.fromJson(json['album'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CloudMusicAlbumDetailDataToJson(
  _CloudMusicAlbumDetailData instance,
) => <String, dynamic>{'songs': instance.songs, 'album': instance.album};

_CloudMusicAristDetailData _$CloudMusicAristDetailDataFromJson(
  Map<String, dynamic> json,
) => _CloudMusicAristDetailData(
  artist: CloudMusicArtistData.fromJson(json['artist'] as Map<String, dynamic>),
  similarArtists: (json['similarArtists'] as List<dynamic>?)
      ?.map((e) => CloudMusicArtistData.fromJson(e as Map<String, dynamic>))
      .toList(),
  hotAlbums: (json['hotAlbums'] as List<dynamic>?)
      ?.map((e) => CloudMusicAlbumData.fromJson(e as Map<String, dynamic>))
      .toList(),
  hotSongs: (json['hotSongs'] as List<dynamic>?)
      ?.map((e) => CloudMusicSongData.fromJson(e as Map<String, dynamic>))
      .toList(),
  hotAlbumsFlag: (json['hotAlbumsFlag'] as num?)?.toInt(),
  hotSongFlag: (json['hotSongFlag'] as num?)?.toInt(),
  similarArtistsFlag: (json['similarArtistsFlag'] as num?)?.toInt(),
);

Map<String, dynamic> _$CloudMusicAristDetailDataToJson(
  _CloudMusicAristDetailData instance,
) => <String, dynamic>{
  'artist': instance.artist,
  'similarArtists': instance.similarArtists,
  'hotAlbums': instance.hotAlbums,
  'hotSongs': instance.hotSongs,
  'hotAlbumsFlag': instance.hotAlbumsFlag,
  'hotSongFlag': instance.hotSongFlag,
  'similarArtistsFlag': instance.similarArtistsFlag,
};

_CloudMusicPlaylistDataList _$CloudMusicPlaylistDataListFromJson(
  Map<String, dynamic> json,
) => _CloudMusicPlaylistDataList(
  playlists: (json['playlists'] as List<dynamic>)
      .map((e) => CloudMusicPlaylistData.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$CloudMusicPlaylistDataListToJson(
  _CloudMusicPlaylistDataList instance,
) => <String, dynamic>{
  'playlists': instance.playlists,
  'total': instance.total,
};

_CloudMusicPlaylistData _$CloudMusicPlaylistDataFromJson(
  Map<String, dynamic> json,
) => _CloudMusicPlaylistData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  picUrl: json['picUrl'] as String?,
  creator: json['creator'] == null
      ? null
      : CloudMusicUserData.fromJson(json['creator'] as Map<String, dynamic>),
  coverImgUrl: json['coverImgUrl'] as String?,
  description: json['description'] as String?,
  playCount: (json['playCount'] as num?)?.toInt(),
  trackCount: (json['trackCount'] as num?)?.toInt(),
  createTime: (json['createTime'] as num?)?.toInt(),
  updateTime: (json['updateTime'] as num?)?.toInt(),
  updateFrequency: json['updateFrequency'] as String?,
  copywriter: json['copywriter'] as String?,
  privacy: (json['privacy'] as num?)?.toInt(),
  totalDuration: (json['totalDuration'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CloudMusicPlaylistDataToJson(
  _CloudMusicPlaylistData instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'picUrl': instance.picUrl,
  'creator': instance.creator,
  'coverImgUrl': instance.coverImgUrl,
  'description': instance.description,
  'playCount': instance.playCount,
  'trackCount': instance.trackCount,
  'createTime': instance.createTime,
  'updateTime': instance.updateTime,
  'updateFrequency': instance.updateFrequency,
  'copywriter': instance.copywriter,
  'privacy': instance.privacy,
  'totalDuration': instance.totalDuration,
};

_CloudMusicAlbumData _$CloudMusicAlbumDataFromJson(Map<String, dynamic> json) =>
    _CloudMusicAlbumData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      picUrl: json['picUrl'] as String?,
      blurPicUrl: json['blurPicUrl'] as String?,
      artist: json['artist'] == null
          ? null
          : CloudMusicArtistData.fromJson(
              json['artist'] as Map<String, dynamic>,
            ),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => CloudMusicArtistData.fromJson(e as Map<String, dynamic>))
          .toList(),
      publishTime: (json['publishTime'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      description: json['description'] as String?,
      company: json['company'] as String?,
      type: json['type'] as String?,
      mark: (json['mark'] as num?)?.toInt(),
      copyrightId: (json['copyrightId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CloudMusicAlbumDataToJson(
  _CloudMusicAlbumData instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'picUrl': instance.picUrl,
  'blurPicUrl': instance.blurPicUrl,
  'artist': instance.artist,
  'artists': instance.artists,
  'publishTime': instance.publishTime,
  'size': instance.size,
  'description': instance.description,
  'company': instance.company,
  'type': instance.type,
  'mark': instance.mark,
  'copyrightId': instance.copyrightId,
};

_CloudMusicArtistData _$CloudMusicArtistDataFromJson(
  Map<String, dynamic> json,
) => _CloudMusicArtistData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  picId: (json['picId'] as num?)?.toInt(),
  img1v1Id: (json['img1v1Id'] as num?)?.toInt(),
  picUrl: json['picUrl'] as String?,
  img1v1Url: json['img1v1Url'] as String?,
  musicSize: (json['musicSize'] as num?)?.toInt(),
  albumSize: (json['albumSize'] as num?)?.toInt(),
  briefDesc: json['briefDesc'] as String?,
  trans: json['trans'] as String?,
  alias: (json['alias'] as List<dynamic>?)?.map((e) => e as String).toList(),
  transNames: (json['transNames'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CloudMusicArtistDataToJson(
  _CloudMusicArtistData instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'picId': instance.picId,
  'img1v1Id': instance.img1v1Id,
  'picUrl': instance.picUrl,
  'img1v1Url': instance.img1v1Url,
  'musicSize': instance.musicSize,
  'albumSize': instance.albumSize,
  'briefDesc': instance.briefDesc,
  'trans': instance.trans,
  'alias': instance.alias,
  'transNames': instance.transNames,
};

_CloudMusicSongData _$CloudMusicSongDataFromJson(Map<String, dynamic> json) =>
    _CloudMusicSongData(
      songId: (json['id'] as num).toInt(),
      name: json['name'] as String,
      ar: (json['ar'] as List<dynamic>?)
          ?.map((e) => CloudMusicArtistData.fromJson(e as Map<String, dynamic>))
          .toList(),
      al: json['al'] == null
          ? null
          : CloudMusicAlbumData.fromJson(json['al'] as Map<String, dynamic>),
      privilege: json['privilege'] == null
          ? null
          : CloudMusicPrivilegeData.fromJson(
              json['privilege'] as Map<String, dynamic>,
            ),
      dt: (json['dt'] as num?)?.toInt(),
      pop: (json['pop'] as num?)?.toInt(),
      no: (json['no'] as num?)?.toInt(),
      fee: (json['fee'] as num?)?.toInt(),
      copyright: (json['copyright'] as num?)?.toInt(),
      mark: (json['mark'] as num?)?.toInt(),
      mv: (json['mv'] as num?)?.toInt(),
      noCopyrightRcmd: json['noCopyrightRcmd'],
    );

Map<String, dynamic> _$CloudMusicSongDataToJson(_CloudMusicSongData instance) =>
    <String, dynamic>{
      'id': instance.songId,
      'name': instance.name,
      'ar': instance.ar,
      'al': instance.al,
      'privilege': instance.privilege,
      'dt': instance.dt,
      'pop': instance.pop,
      'no': instance.no,
      'fee': instance.fee,
      'copyright': instance.copyright,
      'mark': instance.mark,
      'mv': instance.mv,
      'noCopyrightRcmd': instance.noCopyrightRcmd,
    };

_CloudMusicPlaylistDetailData _$CloudMusicPlaylistDetailDataFromJson(
  Map<String, dynamic> json,
) => _CloudMusicPlaylistDetailData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  coverImgUrl: json['coverImgUrl'] as String?,
  description: json['description'] as String?,
  trackCount: (json['trackCount'] as num?)?.toInt(),
  tracks: (json['tracks'] as List<dynamic>?)
      ?.map((e) => CloudMusicSongData.fromJson(e as Map<String, dynamic>))
      .toList(),
  trackIds: (json['trackIds'] as List<dynamic>?)
      ?.map((e) => CloudMusicTrackIdData.fromJson(e as Map<String, dynamic>))
      .toList(),
  creator: json['creator'] == null
      ? null
      : CloudMusicUserData.fromJson(json['creator'] as Map<String, dynamic>),
  createTime: (json['createTime'] as num?)?.toInt(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  privacy: (json['privacy'] as num?)?.toInt(),
  subscribed: json['subscribed'] as bool?,
);

Map<String, dynamic> _$CloudMusicPlaylistDetailDataToJson(
  _CloudMusicPlaylistDetailData instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coverImgUrl': instance.coverImgUrl,
  'description': instance.description,
  'trackCount': instance.trackCount,
  'tracks': instance.tracks,
  'trackIds': instance.trackIds,
  'creator': instance.creator,
  'createTime': instance.createTime,
  'tags': instance.tags,
  'privacy': instance.privacy,
  'subscribed': instance.subscribed,
};

_CloudMusicTrackIdData _$CloudMusicTrackIdDataFromJson(
  Map<String, dynamic> json,
) => _CloudMusicTrackIdData(
  id: (json['id'] as num).toInt(),
  v: (json['v'] as num?)?.toInt(),
  alg: json['alg'] as String?,
  uid: (json['uid'] as num?)?.toInt(),
);

Map<String, dynamic> _$CloudMusicTrackIdDataToJson(
  _CloudMusicTrackIdData instance,
) => <String, dynamic>{
  'id': instance.id,
  'v': instance.v,
  'alg': instance.alg,
  'uid': instance.uid,
};

_CloudMusicPrivilegeData _$CloudMusicPrivilegeDataFromJson(
  Map<String, dynamic> json,
) => _CloudMusicPrivilegeData(
  id: (json['id'] as num).toInt(),
  fee: (json['fee'] as num?)?.toInt(),
  payed: (json['payed'] as num?)?.toInt(),
  st: (json['st'] as num?)?.toInt(),
  pl: (json['pl'] as num?)?.toInt(),
  dl: (json['dl'] as num?)?.toInt(),
  sp: (json['sp'] as num?)?.toInt(),
  cp: (json['cp'] as num?)?.toInt(),
  subp: (json['subp'] as num?)?.toInt(),
  cs: json['cs'] as bool?,
  maxbr: (json['maxbr'] as num?)?.toInt(),
  fl: (json['fl'] as num?)?.toInt(),
  toast: json['toast'] as bool?,
  flag: (json['flag'] as num?)?.toInt(),
);

Map<String, dynamic> _$CloudMusicPrivilegeDataToJson(
  _CloudMusicPrivilegeData instance,
) => <String, dynamic>{
  'id': instance.id,
  'fee': instance.fee,
  'payed': instance.payed,
  'st': instance.st,
  'pl': instance.pl,
  'dl': instance.dl,
  'sp': instance.sp,
  'cp': instance.cp,
  'subp': instance.subp,
  'cs': instance.cs,
  'maxbr': instance.maxbr,
  'fl': instance.fl,
  'toast': instance.toast,
  'flag': instance.flag,
};

_CloudMusicUserData _$CloudMusicUserDataFromJson(Map<String, dynamic> json) =>
    _CloudMusicUserData(
      userId: (json['userId'] as num).toInt(),
      nickname: json['nickname'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      backgroundUrl: json['backgroundUrl'] as String?,
      vipType: (json['vipType'] as num?)?.toInt(),
      createTime: (json['createTime'] as num?)?.toInt(),
      signature: json['signature'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$CloudMusicUserDataToJson(_CloudMusicUserData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'backgroundUrl': instance.backgroundUrl,
      'vipType': instance.vipType,
      'createTime': instance.createTime,
      'signature': instance.signature,
      'userName': instance.userName,
    };

_CloudMusicLyricModel _$CloudMusicLyricModelFromJson(
  Map<String, dynamic> json,
) => _CloudMusicLyricModel(
  lyric: json['lyric'] as String?,
  version: (json['version'] as num?)?.toInt(),
);

Map<String, dynamic> _$CloudMusicLyricModelToJson(
  _CloudMusicLyricModel instance,
) => <String, dynamic>{'lyric': instance.lyric, 'version': instance.version};

_CloudMusicLyricData _$CloudMusicLyricDataFromJson(
  Map<String, dynamic> json,
) => _CloudMusicLyricData(
  lrc: json['lrc'] == null
      ? null
      : CloudMusicLyricModel.fromJson(json['lrc'] as Map<String, dynamic>),
  klyric: json['klyric'] == null
      ? null
      : CloudMusicLyricModel.fromJson(json['klyric'] as Map<String, dynamic>),
  tlyric: json['tlyric'] == null
      ? null
      : CloudMusicLyricModel.fromJson(json['tlyric'] as Map<String, dynamic>),
  ytlrc: json['ytlrc'] == null
      ? null
      : CloudMusicLyricModel.fromJson(json['ytlrc'] as Map<String, dynamic>),
  romalrc: json['romalrc'] == null
      ? null
      : CloudMusicLyricModel.fromJson(json['romalrc'] as Map<String, dynamic>),
  yrc: json['yrc'] == null
      ? null
      : CloudMusicLyricModel.fromJson(json['yrc'] as Map<String, dynamic>),
  code: (json['code'] as num).toInt(),
);

Map<String, dynamic> _$CloudMusicLyricDataToJson(
  _CloudMusicLyricData instance,
) => <String, dynamic>{
  'lrc': instance.lrc,
  'klyric': instance.klyric,
  'tlyric': instance.tlyric,
  'ytlrc': instance.ytlrc,
  'romalrc': instance.romalrc,
  'yrc': instance.yrc,
  'code': instance.code,
};

_CloudSearchData _$CloudSearchDataFromJson(Map<String, dynamic> json) =>
    _CloudSearchData(
      songs: (json['songs'] as List<dynamic>?)
          ?.map((e) => CloudMusicSongData.fromJson(e as Map<String, dynamic>))
          .toList(),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => CloudMusicArtistData.fromJson(e as Map<String, dynamic>))
          .toList(),
      albums: (json['albums'] as List<dynamic>?)
          ?.map((e) => CloudMusicAlbumData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CloudSearchDataToJson(_CloudSearchData instance) =>
    <String, dynamic>{
      'songs': instance.songs,
      'artists': instance.artists,
      'albums': instance.albums,
    };
