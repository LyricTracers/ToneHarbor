// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongRequest _$SongRequestFromJson(Map<String, dynamic> json) => _SongRequest(
  api: json['api'] as String,
  method: json['method'] as String,
  version: json['version'] as String,
  limit: (json['limit'] as num).toInt(),
  library: json['library'] as String,
  additional: json['additional'] as String,
  sortBy: json['sort_by'] as String,
  sortDirection: json['sort_direction'] as String,
  offset: (json['offset'] as num).toInt(),
  artist: json['artist'] as String?,
  songRatingMeq: (json['song_rating_meq'] as num?)?.toInt(),
);

Map<String, dynamic> _$SongRequestToJson(_SongRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'method': instance.method,
      'version': instance.version,
      'limit': instance.limit,
      'library': instance.library,
      'additional': instance.additional,
      'sort_by': instance.sortBy,
      'sort_direction': instance.sortDirection,
      'offset': instance.offset,
      'artist': instance.artist,
      'song_rating_meq': instance.songRatingMeq,
    };

_SongAudio _$SongAudioFromJson(Map<String, dynamic> json) => _SongAudio(
  bitrate: (json['bitrate'] as num).toInt(),
  channel: (json['channel'] as num).toInt(),
  codec: json['codec'] as String,
  container: json['container'] as String,
  duration: (json['duration'] as num).toInt(),
  filesize: (json['filesize'] as num).toInt(),
  frequency: (json['frequency'] as num).toInt(),
);

Map<String, dynamic> _$SongAudioToJson(_SongAudio instance) =>
    <String, dynamic>{
      'bitrate': instance.bitrate,
      'channel': instance.channel,
      'codec': instance.codec,
      'container': instance.container,
      'duration': instance.duration,
      'filesize': instance.filesize,
      'frequency': instance.frequency,
    };

_SongRating _$SongRatingFromJson(Map<String, dynamic> json) =>
    _SongRating(rating: (json['rating'] as num).toInt());

Map<String, dynamic> _$SongRatingToJson(_SongRating instance) =>
    <String, dynamic>{'rating': instance.rating};

_SongTag _$SongTagFromJson(Map<String, dynamic> json) => _SongTag(
  album: json['album'] as String?,
  albumArtist: json['album_artist'] as String?,
  artist: json['artist'] as String?,
  comment: json['comment'] as String?,
  composer: json['composer'] as String?,
  disc: (json['disc'] as num).toInt(),
  genre: json['genre'] as String?,
  track: (json['track'] as num).toInt(),
  year: (json['year'] as num).toInt(),
);

Map<String, dynamic> _$SongTagToJson(_SongTag instance) => <String, dynamic>{
  'album': instance.album,
  'album_artist': instance.albumArtist,
  'artist': instance.artist,
  'comment': instance.comment,
  'composer': instance.composer,
  'disc': instance.disc,
  'genre': instance.genre,
  'track': instance.track,
  'year': instance.year,
};

_SongAdditional _$SongAdditionalFromJson(Map<String, dynamic> json) =>
    _SongAdditional(
      songAudio: json['song_audio'] == null
          ? null
          : SongAudio.fromJson(json['song_audio'] as Map<String, dynamic>),
      songRating: json['song_rating'] == null
          ? null
          : SongRating.fromJson(json['song_rating'] as Map<String, dynamic>),
      songTag: json['song_tag'] == null
          ? null
          : SongTag.fromJson(json['song_tag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SongAdditionalToJson(_SongAdditional instance) =>
    <String, dynamic>{
      'song_audio': instance.songAudio,
      'song_rating': instance.songRating,
      'song_tag': instance.songTag,
    };

_Song _$SongFromJson(Map<String, dynamic> json) => _Song(
  id: json['id'] as String,
  path: json['path'] as String,
  title: json['title'] as String,
  type: json['type'] as String,
  additional: json['additional'] == null
      ? null
      : SongAdditional.fromJson(json['additional'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SongToJson(_Song instance) => <String, dynamic>{
  'id': instance.id,
  'path': instance.path,
  'title': instance.title,
  'type': instance.type,
  'additional': instance.additional,
};

_SongData _$SongDataFromJson(Map<String, dynamic> json) => _SongData(
  songs: (json['songs'] as List<dynamic>)
      .map((e) => Song.fromJson(e as Map<String, dynamic>))
      .toList(),
  offset: (json['offset'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$SongDataToJson(_SongData instance) => <String, dynamic>{
  'songs': instance.songs,
  'offset': instance.offset,
  'total': instance.total,
};

_SongListResponse _$SongListResponseFromJson(Map<String, dynamic> json) =>
    _SongListResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : SongData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SongListResponseToJson(_SongListResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

_SetRatingRequest _$SetRatingRequestFromJson(Map<String, dynamic> json) =>
    _SetRatingRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      id: json['id'] as String,
      rating: (json['rating'] as num).toInt(),
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$SetRatingRequestToJson(_SetRatingRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'method': instance.method,
      'id': instance.id,
      'rating': instance.rating,
      'version': instance.version,
    };

_SetRatingResponse _$SetRatingResponseFromJson(Map<String, dynamic> json) =>
    _SetRatingResponse(success: json['success'] as bool);

Map<String, dynamic> _$SetRatingResponseToJson(_SetRatingResponse instance) =>
    <String, dynamic>{'success': instance.success};

_AlbumSongsRequest _$AlbumSongsRequestFromJson(Map<String, dynamic> json) =>
    _AlbumSongsRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      version: json['version'] as String,
      limit: (json['limit'] as num).toInt(),
      library: json['library'] as String,
      additional: json['additional'] as String,
      sortBy: json['sort_by'] as String,
      sortDirection: json['sort_direction'] as String,
      offset: (json['offset'] as num).toInt(),
      album: json['album'] as String,
      albumArtist: json['album_artist'] as String,
      artist: json['artist'] as String?,
    );

Map<String, dynamic> _$AlbumSongsRequestToJson(_AlbumSongsRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'method': instance.method,
      'version': instance.version,
      'limit': instance.limit,
      'library': instance.library,
      'additional': instance.additional,
      'sort_by': instance.sortBy,
      'sort_direction': instance.sortDirection,
      'offset': instance.offset,
      'album': instance.album,
      'album_artist': instance.albumArtist,
      'artist': instance.artist,
    };

_BatchDownloadRequest _$BatchDownloadRequestFromJson(
  Map<String, dynamic> json,
) => _BatchDownloadRequest(
  api: json['api'] as String,
  method: json['method'] as String,
  version: json['version'] as String,
  songs: json['songs'] as String,
  library: json['library'] as String,
  filename: json['filename'] as String?,
);

Map<String, dynamic> _$BatchDownloadRequestToJson(
  _BatchDownloadRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'version': instance.version,
  'songs': instance.songs,
  'library': instance.library,
  'filename': instance.filename,
};

_LyricsRequest _$LyricsRequestFromJson(Map<String, dynamic> json) =>
    _LyricsRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      id: json['id'] as String,
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$LyricsRequestToJson(_LyricsRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'method': instance.method,
      'id': instance.id,
      'version': instance.version,
    };

_LyricsData _$LyricsDataFromJson(Map<String, dynamic> json) =>
    _LyricsData(lyrics: json['lyrics'] as String);

Map<String, dynamic> _$LyricsDataToJson(_LyricsData instance) =>
    <String, dynamic>{'lyrics': instance.lyrics};

_LyricsResponse _$LyricsResponseFromJson(Map<String, dynamic> json) =>
    _LyricsResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : LyricsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LyricsResponseToJson(_LyricsResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

_SearchLyricsRequest _$SearchLyricsRequestFromJson(Map<String, dynamic> json) =>
    _SearchLyricsRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      version: json['version'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String?,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      additional: json['additional'] as String? ?? 'full_lyrics',
    );

Map<String, dynamic> _$SearchLyricsRequestToJson(
  _SearchLyricsRequest instance,
) => <String, dynamic>{
  'api': instance.api,
  'method': instance.method,
  'version': instance.version,
  'title': instance.title,
  'artist': instance.artist,
  'limit': instance.limit,
  'additional': instance.additional,
};

_LyricsSearchAdditional _$LyricsSearchAdditionalFromJson(
  Map<String, dynamic> json,
) => _LyricsSearchAdditional(full_lyrics: json['full_lyrics'] as String);

Map<String, dynamic> _$LyricsSearchAdditionalToJson(
  _LyricsSearchAdditional instance,
) => <String, dynamic>{'full_lyrics': instance.full_lyrics};

_LyricsSearchResult _$LyricsSearchResultFromJson(Map<String, dynamic> json) =>
    _LyricsSearchResult(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      partial_lyrics: json['partial_lyrics'] as String,
      plugin: json['plugin'] as String,
      additional: json['additional'] == null
          ? null
          : LyricsSearchAdditional.fromJson(
              json['additional'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$LyricsSearchResultToJson(_LyricsSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'partial_lyrics': instance.partial_lyrics,
      'plugin': instance.plugin,
      'additional': instance.additional,
    };

_SearchLyricsData _$SearchLyricsDataFromJson(Map<String, dynamic> json) =>
    _SearchLyricsData(
      lyrics: (json['lyrics'] as List<dynamic>)
          .map((e) => LyricsSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchLyricsDataToJson(_SearchLyricsData instance) =>
    <String, dynamic>{'lyrics': instance.lyrics};

_SearchLyricsResponse _$SearchLyricsResponseFromJson(
  Map<String, dynamic> json,
) => _SearchLyricsResponse(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : SearchLyricsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SearchLyricsResponseToJson(
  _SearchLyricsResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

_GetNumberOfPlugInsRequest _$GetNumberOfPlugInsRequestFromJson(
  Map<String, dynamic> json,
) => _GetNumberOfPlugInsRequest(action: json['action'] as String);

Map<String, dynamic> _$GetNumberOfPlugInsRequestToJson(
  _GetNumberOfPlugInsRequest instance,
) => <String, dynamic>{'action': instance.action};

_GetNumberOfPlugInsResponse _$GetNumberOfPlugInsResponseFromJson(
  Map<String, dynamic> json,
) => _GetNumberOfPlugInsResponse(
  success: json['success'] as bool,
  hasPlugIn: (json['hasPlugIn'] as num).toInt(),
);

Map<String, dynamic> _$GetNumberOfPlugInsResponseToJson(
  _GetNumberOfPlugInsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'hasPlugIn': instance.hasPlugIn,
};

_SongInfoRequest _$SongInfoRequestFromJson(Map<String, dynamic> json) =>
    _SongInfoRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      version: json['version'] as String,
      id: json['id'] as String,
      additional: json['additional'] as String,
    );

Map<String, dynamic> _$SongInfoRequestToJson(_SongInfoRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'method': instance.method,
      'version': instance.version,
      'id': instance.id,
      'additional': instance.additional,
    };

_SongInfoResponse _$SongInfoResponseFromJson(Map<String, dynamic> json) =>
    _SongInfoResponse(
      success: json['success'] as bool,
      data: SongData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SongInfoResponseToJson(_SongInfoResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

_SearchSongRequest _$SearchSongRequestFromJson(Map<String, dynamic> json) =>
    _SearchSongRequest(
      api: json['api'] as String,
      method: json['method'] as String,
      version: json['version'] as String,
      additional: json['additional'] as String,
      library: json['library'] as String,
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      sortDirection: json['sort_direction'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$SearchSongRequestToJson(_SearchSongRequest instance) =>
    <String, dynamic>{
      'api': instance.api,
      'method': instance.method,
      'version': instance.version,
      'additional': instance.additional,
      'library': instance.library,
      'limit': instance.limit,
      'offset': instance.offset,
      'sort_direction': instance.sortDirection,
      'title': instance.title,
    };
