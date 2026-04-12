import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'package:toneharbor/utils/base_utils.dart';

Future<List<CloudMusicPlaylistData>> dailyRecommendPlaylist(
  Ref ref, {
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_dailyRecommendPlaylist';
  final groupKey = 'cloud_recommendPlaylist';
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (cacheDuration != null) {
    final cached = await getFromCache<List<CloudMusicPlaylistData>>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return [];
        }
        final resultList = json['recommend'] as List? ?? [];
        if (resultList.isEmpty) {
          return [];
        }
        return resultList
            .map((item) => CloudMusicPlaylistData.fromJson(item))
            .toList();
      },
    );
    if (cached != null && cached.isNotEmpty) {
      return cached;
    }
  }
  try {
    final query = <String, String>{
      'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
    };

    final cookieParams = CloudMusicAuth.getApiCookieParams();
    if (cookieParams.isNotEmpty) {
      query.addAll(cookieParams);
    }

    final response = await httpClientWrapper.get(
      '${apiState.defaultUrl}/recommend/resource',
      query: query,
      cancelToken: ref.cancelToken(),
    );
    if (response.statusCode != 200) {
      if (response.statusCode == 301) {
        ref.read(cloudMusicAuthStateProvider.notifier).logout();
      }
      logger.e('请求失败，状态码：${response.statusCode}');
      throw CloudMusicException(
        message: l10n.error_getPlaylists_failed,
        statusCode: response.statusCode,
      );
    }
    late final Map<String, dynamic> jsonBody;
    try {
      jsonBody = parseJsonResponse(response.body);
    } catch (e) {
      logger.e('解析响应失败: $e');
      throw CloudMusicException(message: l10n.error_response_parse_failed);
    }
    if (jsonBody['code'] != 200) {
      throw CloudMusicException(
        message: l10n.error_getPlaylists_failed,
        statusCode: jsonBody['code'],
      );
    }
    final recommendList = jsonBody['recommend'] as List? ?? [];
    if (recommendList.isEmpty) {
      return [];
    }
    var playlists = recommendList
        .map((item) => CloudMusicPlaylistData.fromJson(item))
        .toList();
    if (cacheDuration != null && playlists.isNotEmpty) {
      await saveToCache(
        cacheKey: cacheKey,
        jsonBody: jsonBody,
        cacheDuration: cacheDuration,
        group: groupKey,
      );
    }
    return playlists;
  } catch (e) {
    logger.e('发送请求失败: $e');
    throw CloudMusicException(message: l10n.error_network_error);
  }
}

Future<CloudMusicPlaylistDetailData> getPlaylistDetail(
  Ref ref, {
  required int id,
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final l10n = ref.read(l10nProvider);
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  final cacheKey = 'cloud_playlistDetail:$id';
  final groupKey = 'cloud_playlistDetail';

  Map<String, dynamic>? jsonBody;

  if (cacheDuration != null) {
    final cached = await getFromCache<Map<String, dynamic>?>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) => json,
    );
    if (cached != null) {
      return _parsePlaylistWithPrivileges(cached);
    }
  }

  jsonBody = await _fetchPlaylistDetailJson(ref, apiState, id, l10n);

  if (cacheDuration != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: jsonBody,
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }

  return _parsePlaylistWithPrivileges(jsonBody);
}

Future<Map<String, dynamic>> _fetchPlaylistDetailJson(
  Ref ref,
  CloudMusicApiState apiState,
  int id,
  AppLocalizations l10n,
) async {
  final query = <String, String>{
    'id': id.toString(),
    'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
  };

  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    query.addAll(cookieParams);
  }

  final response = await httpClientWrapper.get(
    '${apiState.defaultUrl}/playlist/detail',
    query: query,
    cancelToken: ref.cancelToken(),
  );

  if (response.statusCode == 301) {
    ref.read(cloudMusicAuthStateProvider.notifier).logout();
  }
  if (response.statusCode != 200) {
    throw CloudMusicException(
      message: l10n.error_getPlaylists_failed,
      statusCode: response.statusCode,
    );
  }

  try {
    return parseJsonResponse(response.body);
  } catch (e) {
    throw CloudMusicException(message: l10n.error_response_parse_failed);
  }
}

CloudMusicPlaylistDetailData _parsePlaylistWithPrivileges(
  Map<String, dynamic> jsonBody,
) {
  final playlistJson = jsonBody['playlist'] as Map<String, dynamic>?;
  if (playlistJson == null) {
    throw CloudMusicException(message: 'Invalid playlist data');
  }

  final privileges =
      (jsonBody['privileges'] as List?)
          ?.map(
            (e) => CloudMusicPrivilegeData.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [];
  final privilegeMap = {for (final p in privileges) p.id: p};

  final playlistData = CloudMusicPlaylistDetailData.fromJson(playlistJson);
  final tracks = playlistData.tracks?.map((track) {
    final privilege = privilegeMap[track.id];
    return privilege != null ? track.copyWith(privilege: privilege) : track;
  }).toList();

  return playlistData.copyWith(tracks: tracks);
}

Future<List<CloudMusicSongData>> getTrackDetail(
  Ref ref, {
  required List<int> ids,
}) async {
  final l10n = ref.read(l10nProvider);
  final apiState = ref.read(cloudMusicApiUrlsProvider);

  if (ids.isEmpty) {
    return [];
  }

  try {
    final query = <String, String>{'ids': ids.join(',')};

    final cookieParams = CloudMusicAuth.getApiCookieParams();
    if (cookieParams.isNotEmpty) {
      query.addAll(cookieParams);
    }

    final response = await httpClientWrapper.get(
      '${apiState.defaultUrl}/song/detail',
      query: query,
      cancelToken: ref.cancelToken(),
    );

    if (response.statusCode != 200) {
      if (response.statusCode == 301) {
        ref.read(cloudMusicAuthStateProvider.notifier).logout();
      }
      logger.e('请求失败，状态码：${response.statusCode}');
      throw CloudMusicException(
        message: l10n.error_getPlaylists_failed,
        statusCode: response.statusCode,
      );
    }

    late final Map<String, dynamic> jsonBody;
    try {
      jsonBody = parseJsonResponse(response.body);
    } catch (e) {
      logger.e('解析响应失败: $e');
      throw CloudMusicException(message: l10n.error_response_parse_failed);
    }

    if (jsonBody['code'] != 200) {
      throw CloudMusicException(
        message: l10n.error_getPlaylists_failed,
        statusCode: jsonBody['code'],
      );
    }

    final songs =
        (jsonBody['songs'] as List?)
            ?.map((e) => CloudMusicSongData.fromJson(e))
            .toList() ??
        [];
    final privileges =
        (jsonBody['privileges'] as List?)
            ?.map((e) => CloudMusicPrivilegeData.fromJson(e))
            .toList() ??
        [];

    final privilegeMap = {for (var p in privileges) p.id: p};
    final songsWithPrivilege = songs.map((song) {
      final privilege = privilegeMap[song.id];
      if (privilege != null) {
        return song.copyWith(privilege: privilege);
      }
      return song;
    }).toList();

    return songsWithPrivilege;
  } catch (e) {
    logger.e('获取歌曲详情失败: $e');
    throw CloudMusicException(message: l10n.error_network_error);
  }
}

Future<List<CloudMusicPlaylistData>> recommendPlaylist(
  Ref ref, {
  int limit = 10,
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_recommendPlaylist:$limit';
  final groupKey = 'cloud_recommendPlaylist';
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (cacheDuration != null) {
    final cached = await getFromCache<List<CloudMusicPlaylistData>>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return [];
        }
        final resultList = json['result'] as List? ?? [];
        if (resultList.isEmpty) {
          return [];
        }
        return resultList
            .map((item) => CloudMusicPlaylistData.fromJson(item))
            .toList();
      },
    );
    if (cached != null && cached.isNotEmpty) {
      return cached;
    }
  }
  try {
    final response = await httpClientWrapper.get(
      '${apiState.defaultUrl}/personalized',
      query: {'limit': limit.toString(), 'randomCNIP': 'true'},
      cancelToken: ref.cancelToken(),
    );

    if (response.statusCode != 200) {
      logger.e('请求失败，状态码：${response.statusCode}');
      throw CloudMusicException(
        message: l10n.error_getPlaylists_failed,
        statusCode: response.statusCode,
      );
    }
    late final Map<String, dynamic> jsonBody;
    try {
      jsonBody = parseJsonResponse(response.body);
    } catch (e) {
      logger.e('解析响应失败: $e');
      throw CloudMusicException(message: l10n.error_response_parse_failed);
    }
    if (jsonBody['code'] != 200) {
      throw CloudMusicException(
        message: l10n.error_getPlaylists_failed,
        statusCode: jsonBody['code'],
      );
    }
    final resultList = jsonBody['result'] as List? ?? [];
    if (resultList.isEmpty) {
      return [];
    }
    var playlists = resultList
        .map((item) => CloudMusicPlaylistData.fromJson(item))
        .toList();
    if (cacheDuration != null && playlists.isNotEmpty) {
      await saveToCache(
        cacheKey: cacheKey,
        jsonBody: jsonBody,
        cacheDuration: cacheDuration,
        group: groupKey,
      );
    }
    return playlists;
  } catch (e) {
    logger.e('发送请求失败: $e');
    throw CloudMusicException(message: l10n.error_network_error);
  }
}

Future<CloudMusicPlaylistDataList> getPlaylistCatlist(
  Ref ref, {
  required String cat,
  int limit = 50,
  int offset = 0,
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_playlistCat:$cat$limit$offset';
  final groupKey = 'cloud_playlistCat';
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (cacheDuration != null) {
    final cached = await getFromCache<CloudMusicPlaylistDataList>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return CloudMusicPlaylistDataList(playlists: [], total: 0);
        }
        return CloudMusicPlaylistDataList.fromJson(json);
      },
    );
    if (cached != null && cached.playlists.isNotEmpty) {
      logger.i(
        'getPlaylistCatlist, cat: $cat, limit: $limit, offset: $offset, total: ${cached.total}, playlists.length: ${cached.playlists.length}',
      );
      return cached;
    }
  }

  final query = <String, String>{
    'limit': limit.toString(),
    'offset': offset.toString(),
  };
  if (cat != "精品歌单") {
    query['cat'] = cat;
  }

  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    query.addAll(cookieParams);
  }

  final response = await httpClientWrapper.get(
    cat == "精品歌单"
        ? '${apiState.defaultUrl}/top/playlist/highquality'
        : '${apiState.defaultUrl}/top/playlist',
    query: query,
    cancelToken: ref.cancelToken(),
  );
  if (response.statusCode != 200) {
    logger.e('请求失败，状态码：${response.statusCode}');
    throw CloudMusicException(
      message: l10n.error_getPlaylists_failed,
      statusCode: response.statusCode,
    );
  }
  late final Map<String, dynamic> jsonBody;
  try {
    jsonBody = parseJsonResponse(response.body);
  } catch (e) {
    logger.e('解析响应失败: $e');
    throw CloudMusicException(message: l10n.error_response_parse_failed);
  }
  if (jsonBody['code'] != 200) {
    throw CloudMusicException(
      message: l10n.error_getPlaylists_failed,
      statusCode: jsonBody['code'],
    );
  }
  final playDatalists = CloudMusicPlaylistDataList.fromJson(jsonBody);
  if (cacheDuration != null && playDatalists.playlists.isNotEmpty) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: jsonBody,
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }
  logger.i(
    'getPlaylistCatlist, cat: $cat, limit: $limit, offset: $offset, total: ${playDatalists.total}, playlists.length: ${playDatalists.playlists.length}',
  );
  return playDatalists;
}
