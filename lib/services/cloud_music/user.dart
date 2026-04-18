import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'package:toneharbor/utils/base_utils.dart';

Future<CloudMusicUserData?> getUserInfo(
  Ref ref, {
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final l10n = ref.read(l10nProvider);
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isEmpty || apiState.defaultUrl.isEmpty) {
    return null;
  }
  final cacheKey = 'cloud_userInfo';
  final groupKey = 'cloud_user';
  if (cacheDuration != null) {
    final cached = await getFromCache<CloudMusicUserData?>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return null;
        }
        final recommendList = json['profile'] as Map<String, dynamic>?;
        if (recommendList == null) {
          return null;
        }

        return CloudMusicUserData.fromJson(recommendList);
      },
    );
    if (cached != null) {
      return cached;
    }
  }
  try {
    final response = await httpClientWrapper.get(
      '${apiState.defaultUrl}/user/account',
      query: cookieParams,
      cancelToken: ref.cancelToken(),
    );
    if (response.statusCode != 200) {
      if (response.statusCode == 301) {
        ref.read(cloudMusicAuthStateProvider.notifier).logout();
      }
      logger.e('请求失败，状态码：${response.statusCode}');
      throw CloudMusicException(
        message: l10n.error_network_error,
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
        message: l10n.error_network_error,
        statusCode: jsonBody['code'],
      );
    }
    final recommendList = jsonBody['profile'] as Map<String, dynamic>?;
    if (recommendList == null) {
      throw CloudMusicException(message: l10n.error_network_error);
    }
    final userInfo = CloudMusicUserData.fromJson(recommendList);
    if (cacheDuration != null && recommendList.isNotEmpty) {
      await saveToCache(
        cacheKey: cacheKey,
        jsonBody: jsonBody,
        cacheDuration: cacheDuration,
        group: groupKey,
      );
    }
    return userInfo;
  } catch (e) {
    logger.e('获取用户信息失败: $e');
    throw CloudMusicException(message: l10n.error_network_error);
  }
}

Future<CloudMusicPlaylistDataList> getUserPlaylist(
  Ref ref, {
  int limit = 30,
  int offset = 0,
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final useInfo = ref.watch(cloudUserInfoProvider);
  if (useInfo.value == null) {
    return CloudMusicPlaylistDataList(playlists: [], total: 0);
  }
  final l10n = ref.read(l10nProvider);
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  final uid = useInfo.value!.userId;
  final cacheKey = 'cloud_userPlaylist_$uid';
  final groupKey = 'cloud_userPlaylist';

  if (cacheDuration != null) {
    final cached = await getFromCache<CloudMusicPlaylistDataList>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return CloudMusicPlaylistDataList(playlists: [], total: 0);
        }
        final resultList = json['playlist'] as List? ?? [];
        if (resultList.isEmpty) {
          return CloudMusicPlaylistDataList(playlists: [], total: 0);
        }
        logger.i('json: $json');
        return CloudMusicPlaylistDataList(
          playlists: resultList
              .map((item) => CloudMusicPlaylistData.fromJson(item))
              .toList(),
          total: resultList.length,
        );
      },
    );
    if (cached != null && cached.playlists.isNotEmpty) {
      return cached;
    }
  }

  try {
    final query = <String, String>{
      'uid': uid.toString(),
      'limit': limit.toString(),
      'offset': offset.toString(),
      'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
    };

    final cookieParams = CloudMusicAuth.getApiCookieParams();
    if (cookieParams.isNotEmpty) {
      query.addAll(cookieParams);
    }

    final response = await httpClientWrapper.get(
      '${apiState.defaultUrl}/user/playlist',
      query: query,
      cancelToken: ref.cancelToken(),
    );

    if (response.statusCode != 200) {
      logger.e('getUserPlaylist failed: ${response.statusCode}');
      throw CloudMusicException(
        message: l10n.error_network_error,
        statusCode: response.statusCode,
      );
    }

    late final Map<String, dynamic> jsonBody;
    try {
      jsonBody = parseJsonResponse(response.body);
    } catch (e) {
      logger.e('Parse response failed: $e');
      throw CloudMusicException(message: l10n.error_response_parse_failed);
    }

    if (jsonBody['code'] != 200) {
      throw CloudMusicException(
        message:
            jsonBody['message'] as String? ??
            jsonBody['msg'] as String? ??
            l10n.error_network_error,
        statusCode: jsonBody['code'] as int? ?? -1,
      );
    }

    final resultList = jsonBody['playlist'] as List? ?? [];
    final playlistDataList = CloudMusicPlaylistDataList(
      playlists: resultList
          .map((item) => CloudMusicPlaylistData.fromJson(item))
          .toList(),
      total: resultList.length,
    );

    if (cacheDuration != null && playlistDataList.playlists.isNotEmpty) {
      await saveToCache(
        cacheKey: cacheKey,
        jsonBody: jsonBody,
        cacheDuration: cacheDuration,
        group: groupKey,
      );
    }

    return playlistDataList;
  } catch (e) {
    logger.e('获取用户歌单失败: $e');
    throw CloudMusicException(message: l10n.error_network_error);
  }
}
