// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_music_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CloudMusicPlaylist _$CloudMusicPlaylistFromJson(Map<String, dynamic> json) =>
    _CloudMusicPlaylist(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      picUrl: json['picUrl'] as String?,
      coverImgUrl: json['coverImgUrl'] as String?,
      description: json['description'] as String?,
      playCount: (json['playCount'] as num?)?.toInt(),
      trackCount: (json['trackCount'] as num?)?.toInt(),
      updateFrequency: json['updateFrequency'] as String?,
      copywriter: json['copywriter'] as String?,
      privacy: (json['privacy'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CloudMusicPlaylistToJson(_CloudMusicPlaylist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'coverImgUrl': instance.coverImgUrl,
      'description': instance.description,
      'playCount': instance.playCount,
      'trackCount': instance.trackCount,
      'updateFrequency': instance.updateFrequency,
      'copywriter': instance.copywriter,
      'privacy': instance.privacy,
    };

_CloudMusicAlbum _$CloudMusicAlbumFromJson(Map<String, dynamic> json) =>
    _CloudMusicAlbum(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      picUrl: json['picUrl'] as String?,
      blurPicUrl: json['blurPicUrl'] as String?,
      artist: json['artist'] == null
          ? null
          : CloudMusicArtist.fromJson(json['artist'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => CloudMusicArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      publishTime: (json['publishTime'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      description: json['description'] as String?,
      company: json['company'] as String?,
      type: json['type'] as String?,
      mark: (json['mark'] as num?)?.toInt(),
      copyrightId: (json['copyrightId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CloudMusicAlbumToJson(_CloudMusicAlbum instance) =>
    <String, dynamic>{
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

_CloudMusicArtist _$CloudMusicArtistFromJson(Map<String, dynamic> json) =>
    _CloudMusicArtist(
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
      alias: (json['alias'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      transNames: (json['transNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CloudMusicArtistToJson(_CloudMusicArtist instance) =>
    <String, dynamic>{
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

_CloudMusicSong _$CloudMusicSongFromJson(Map<String, dynamic> json) =>
    _CloudMusicSong(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      ar: (json['ar'] as List<dynamic>?)
          ?.map((e) => CloudMusicArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      al: json['al'] == null
          ? null
          : CloudMusicAlbumSimple.fromJson(json['al'] as Map<String, dynamic>),
      dt: (json['dt'] as num?)?.toInt(),
      pop: (json['pop'] as num?)?.toInt(),
      no: (json['no'] as num?)?.toInt(),
      reason: (json['reason'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fee: (json['fee'] as num?)?.toInt(),
      copyright: (json['copyright'] as num?)?.toInt(),
      mark: (json['mark'] as num?)?.toInt(),
      mv: (json['mv'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CloudMusicSongToJson(_CloudMusicSong instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ar': instance.ar,
      'al': instance.al,
      'dt': instance.dt,
      'pop': instance.pop,
      'no': instance.no,
      'reason': instance.reason,
      'fee': instance.fee,
      'copyright': instance.copyright,
      'mark': instance.mark,
      'mv': instance.mv,
    };

_CloudMusicAlbumSimple _$CloudMusicAlbumSimpleFromJson(
  Map<String, dynamic> json,
) => _CloudMusicAlbumSimple(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  picUrl: json['picUrl'] as String?,
);

Map<String, dynamic> _$CloudMusicAlbumSimpleToJson(
  _CloudMusicAlbumSimple instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'picUrl': instance.picUrl,
};

_CloudMusicPlaylistDetailData _$CloudMusicPlaylistDetailDataFromJson(
  Map<String, dynamic> json,
) => _CloudMusicPlaylistDetailData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  coverImgUrl: json['coverImgUrl'] as String?,
  description: json['description'] as String?,
  playCount: (json['playCount'] as num?)?.toInt(),
  trackCount: (json['trackCount'] as num?)?.toInt(),
  tracks: (json['tracks'] as List<dynamic>?)
      ?.map((e) => CloudMusicSong.fromJson(e as Map<String, dynamic>))
      .toList(),
  trackIds: (json['trackIds'] as List<dynamic>?)
      ?.map((e) => CloudMusicTrackId.fromJson(e as Map<String, dynamic>))
      .toList(),
  creator: json['creator'] == null
      ? null
      : CloudMusicUser.fromJson(json['creator'] as Map<String, dynamic>),
  createTime: (json['createTime'] as num?)?.toInt(),
  updateTime: (json['updateTime'] as num?)?.toInt(),
  subscribedCount: (json['subscribedCount'] as num?)?.toInt(),
  commentCount: (json['commentCount'] as num?)?.toInt(),
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
  'playCount': instance.playCount,
  'trackCount': instance.trackCount,
  'tracks': instance.tracks,
  'trackIds': instance.trackIds,
  'creator': instance.creator,
  'createTime': instance.createTime,
  'updateTime': instance.updateTime,
  'subscribedCount': instance.subscribedCount,
  'commentCount': instance.commentCount,
  'tags': instance.tags,
  'privacy': instance.privacy,
  'subscribed': instance.subscribed,
};

_CloudMusicTrackId _$CloudMusicTrackIdFromJson(Map<String, dynamic> json) =>
    _CloudMusicTrackId(
      id: (json['id'] as num).toInt(),
      v: (json['v'] as num?)?.toInt(),
      alg: (json['alg'] as num?)?.toInt(),
      uid: (json['uid'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CloudMusicTrackIdToJson(_CloudMusicTrackId instance) =>
    <String, dynamic>{
      'id': instance.id,
      'v': instance.v,
      'alg': instance.alg,
      'uid': instance.uid,
    };

_CloudMusicSongDetailResponse _$CloudMusicSongDetailResponseFromJson(
  Map<String, dynamic> json,
) => _CloudMusicSongDetailResponse(
  songs: (json['songs'] as List<dynamic>)
      .map((e) => CloudMusicSong.fromJson(e as Map<String, dynamic>))
      .toList(),
  privileges: (json['privileges'] as List<dynamic>?)
      ?.map((e) => CloudMusicPrivilege.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CloudMusicSongDetailResponseToJson(
  _CloudMusicSongDetailResponse instance,
) => <String, dynamic>{
  'songs': instance.songs,
  'privileges': instance.privileges,
};

_CloudMusicPrivilege _$CloudMusicPrivilegeFromJson(Map<String, dynamic> json) =>
    _CloudMusicPrivilege(
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

Map<String, dynamic> _$CloudMusicPrivilegeToJson(
  _CloudMusicPrivilege instance,
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

_CloudMusicUser _$CloudMusicUserFromJson(Map<String, dynamic> json) =>
    _CloudMusicUser(
      userId: (json['userId'] as num).toInt(),
      nickname: json['nickname'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      vipType: (json['vipType'] as num?)?.toInt(),
      createTime: (json['createTime'] as num?)?.toInt(),
      signature: json['signature'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$CloudMusicUserToJson(_CloudMusicUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'vipType': instance.vipType,
      'createTime': instance.createTime,
      'signature': instance.signature,
      'userName': instance.userName,
    };
