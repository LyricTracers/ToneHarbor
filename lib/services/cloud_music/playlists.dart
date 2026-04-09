import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
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
  if (cacheDuration != null) {
    final cached = await getFromCache<CloudMusicPlaylistDetailData?>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        final playlist = json['playlist'] as Map<String, dynamic>?;
        if (playlist == null) {
          return null;
        }
        return CloudMusicPlaylistDetailData.fromJson(playlist);
      },
    );
    if (cached != null) {
      return cached;
    }
  }

  try {
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

    final playlist = jsonBody['playlist'] as Map<String, dynamic>?;
    if (playlist == null) {
      throw CloudMusicException(message: l10n.error_getPlaylists_failed);
    }

    if (cacheDuration != null) {
      await saveToCache(
        cacheKey: cacheKey,
        jsonBody: jsonBody,
        cacheDuration: cacheDuration,
        group: groupKey,
      );
    }
    return CloudMusicPlaylistDetailData.fromJson(playlist);
  } catch (e) {
    logger.e('获取歌单详情失败: $e');
    throw CloudMusicException(message: l10n.error_network_error);
  }
}

Future<CloudMusicSongDetailResponse> getTrackDetail(
  Ref ref, {
  required List<int> ids,
}) async {
  final l10n = ref.read(l10nProvider);
  final apiState = ref.read(cloudMusicApiUrlsProvider);

  if (ids.isEmpty) {
    return const CloudMusicSongDetailResponse(songs: []);
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
    final privileges = (jsonBody['privileges'] as List?)
        ?.map((e) => CloudMusicPrivilegeData.fromJson(e))
        .toList();

    return CloudMusicSongDetailResponse(songs: songs, privileges: privileges);
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
