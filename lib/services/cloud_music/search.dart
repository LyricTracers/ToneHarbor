import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'package:toneharbor/services/cloud_music/playlists.dart';
import 'package:toneharbor/utils/base_utils.dart';

Future<CloudSearchData> searchSuggest(
  Ref ref, {
  required String query,
  Duration? cacheDuration = const Duration(days: 30),
}) async {
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (apiState.defaultUrl.isEmpty) {
    return CloudSearchData();
  }
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_search_suggest:$query';
  final groupKey = 'cloud_search';
  if (cacheDuration != null) {
    final cached = await getFromCache<CloudSearchData>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        return CloudSearchData.fromJson(json);
      },
    );

    if (cached != null &&
        (cached.songs != null && cached.songs!.isNotEmpty ||
            cached.artists != null && cached.artists!.isNotEmpty ||
            cached.albums != null && cached.albums!.isNotEmpty)) {
      return cached;
    }
  }
  final queryParams = <String, String>{'randomCNIP': 'true', 'keywords': query};
  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    queryParams.addAll(cookieParams);
  }
  final response = await httpClientWrapper.get(
    '${apiState.defaultUrl}/search/suggest',
    query: queryParams,
    cancelToken: ref.cancelToken(),
  );
  if (response.statusCode != 200) {
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

  var searchData = CloudSearchData.fromJson(jsonBody['result']);
  if (searchData.songs != null && searchData.songs!.isNotEmpty) {
    try {
      final tracks = await getTrackDetail(
        ref,
        ids: searchData.songs!.map((e) => e.songId).toList(),
      );
      searchData = searchData.copyWith(songs: tracks);
    } catch (e) {
      logger.e('获取歌曲详情失败: $e');
    }
  }

  if (cacheDuration != null &&
      (searchData.artists != null && searchData.artists!.isNotEmpty ||
          searchData.albums != null && searchData.albums!.isNotEmpty ||
          searchData.songs != null && searchData.songs!.isNotEmpty)) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: searchData.toJson(),
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }
  return searchData;
}

Future<List<String>?> searchHot(
  Ref ref, {
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (apiState.defaultUrl.isEmpty) {
    return [];
  }
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_search_hot';
  final groupKey = 'cloud_search';
  if (cacheDuration != null) {
    final cached = await getFromCache<List<String>?>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (jsonData) {
        if (jsonData['data'] == null) {
          return [];
        }
        var t = jsonData['data'] as List? ?? [];
        return t.map((e) => e['searchWord'] as String).toList();
      },
    );

    if (cached != null && cached.isNotEmpty) {
      return cached;
    }
  }

  final queryParams = <String, String>{'randomCNIP': 'true'};

  final response = await httpClientWrapper.get(
    '${apiState.defaultUrl}/search/hot/detail',
    query: queryParams,
    cancelToken: ref.cancelToken(),
  );
  if (response.statusCode != 200) {
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
  if (jsonBody['data'] == null) {
    return [];
  }
  var t = jsonBody['data'] as List? ?? [];
  var result = t.map((e) => e['searchWord'] as String).toList();

  if (cacheDuration != null && result.isNotEmpty) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: jsonBody,
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }
  return result;
}
