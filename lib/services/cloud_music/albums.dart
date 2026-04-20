import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'package:toneharbor/utils/base_utils.dart';

Future<CloudMusicAlbumDetailData?> cloudAlbumDetail(
  Ref ref, {
  required int albumId,
  Duration? cacheDuration = const Duration(days: 30),
}) async {
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_albums:$albumId';
  final groupKey = 'cloud_albumDetail';
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (cacheDuration != null) {
    final cached = await getFromCache<CloudMusicAlbumDetailData?>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return null;
        }
        return CloudMusicAlbumDetailData.fromJson(json);
      },
    );
    if (cached != null && cached.songs != null) {
      return cached;
    }
  }

  final query = <String, String>{
    'randomCNIP': 'true',
    'id': albumId.toString(),
  };

  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    query.addAll(cookieParams);
  }

  final response = await httpClientWrapper.get(
    '${apiState.defaultUrl}/album',
    query: query,
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

  var albumDetail = CloudMusicAlbumDetailData.fromJson(jsonBody);
  if (cacheDuration != null && albumDetail.songs != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: jsonBody,
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }
  return albumDetail;
}

Future<CloudAlbumListData> cloudAlbumNew(
  Ref ref, {
  required int offset,
  required int limit,
  required String area,
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final apiState = ref.read(cloudMusicApiUrlsProvider);

  if (apiState.defaultUrl.isEmpty) {
    return CloudAlbumListData();
  }

  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_albums_new:$offset:$limit:$area';
  final groupKey = 'cloud_albumNew';
  if (cacheDuration != null) {
    final cached = await getFromCache<CloudAlbumListData?>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return null;
        }
        return CloudAlbumListData.fromJson(json);
      },
    );
    if (cached != null && cached.albums != null) {
      return cached;
    }
  }

  final query = <String, String>{
    'randomCNIP': 'true',
    'offset': offset.toString(),
    'limit': limit.toString(),
    'area': area,
  };

  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    query.addAll(cookieParams);
  }

  final response = await httpClientWrapper.post(
    '${apiState.defaultUrl}/album/new',
    query: query,
    cancelToken: ref.cancelToken(),
  );

  if (response.statusCode != 200) {
    logger.e('请求失败，响应体：${response.body}');
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
  var albumNew = CloudAlbumListData.fromJson(jsonBody);
  if (cacheDuration != null && albumNew.albums != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: jsonBody,
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }
  return albumNew;
}
