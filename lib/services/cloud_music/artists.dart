import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'package:toneharbor/services/cloud_music/playlists.dart';
import 'package:toneharbor/utils/base_utils.dart';

Future<CloudMusicAristDetailData> cloudArtistDetail(
  Ref ref, {
  required CloudMusicArtistData artistData,
  Duration? cacheDuration = const Duration(days: 30),
}) async {
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_artists:${artistData.id}';
  final groupKey = 'cloud_artistDetail';
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (cacheDuration != null) {
    final cached = await getFromCache<CloudMusicAristDetailData>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return CloudMusicAristDetailData(artist: artistData);
        }
        return CloudMusicAristDetailData.fromJson(json);
      },
    );
    if (cached != null && cached.hotSongs != null) {
      return cached;
    }
  }

  final query = <String, String>{
    'randomCNIP': 'true',
    'id': artistData.id.toString(),
  };

  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    query.addAll(cookieParams);
  }

  final response = await httpClientWrapper.get(
    '${apiState.defaultUrl}/artists',
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

  var artistDetail = CloudMusicAristDetailData.fromJson(jsonBody);
  if (cacheDuration != null && artistDetail.hotSongs != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: jsonBody,
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }
  return artistDetail;
}

Future<CloudMusicAristDetailData> cloudArtistAlbums(
  Ref ref, {
  required CloudMusicArtistData artistData,
  Duration? cacheDuration = const Duration(days: 30),
}) async {
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_artists_albums:${artistData.id}';
  final groupKey = 'cloud_artistDetail';
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (cacheDuration != null) {
    final cached = await getFromCache<CloudMusicAristDetailData>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return CloudMusicAristDetailData(artist: artistData);
        }

        return CloudMusicAristDetailData.fromJson(json);
      },
    );
    if (cached != null && cached.hotAlbums != null) {
      return cached;
    }
  }

  final query = <String, String>{
    'randomCNIP': 'true',
    'limit': '200',
    'id': artistData.id.toString(),
  };

  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    query.addAll(cookieParams);
  }

  final response = await httpClientWrapper.get(
    '${apiState.defaultUrl}/artist/album',
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
  var artistDetail = CloudMusicAristDetailData.fromJson(jsonBody);
  if (cacheDuration != null && artistDetail.hotAlbums != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: jsonBody,
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }
  return artistDetail;
}

Future<List<CloudMusicArtistData>> toplistOfArtists(
  Ref ref, {
  required int type,
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_toplistOfArtists:$type';
  final groupKey = 'cloud_toplistOfArtists';
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (cacheDuration != null) {
    final cached = await getFromCache<List<CloudMusicArtistData>>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return [];
        }
        final resultList = json['list']?['artists'] as List? ?? [];
        if (resultList.isEmpty) {
          return [];
        }
        return resultList
            .map((item) => CloudMusicArtistData.fromJson(item))
            .toList();
      },
    );
    if (cached != null && cached.isNotEmpty) {
      return cached;
    }
  }
  try {
    final query = <String, String>{'randomCNIP': 'true'};
    if (type != 0) query['type'] = type.toString();

    final cookieParams = CloudMusicAuth.getApiCookieParams();
    if (cookieParams.isNotEmpty) {
      query.addAll(cookieParams);
    }

    final response = await httpClientWrapper.get(
      '${apiState.defaultUrl}/toplist/artist',
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
    final resultList = jsonBody['list']?['artists'] as List? ?? [];
    if (resultList.isEmpty) {
      return [];
    }
    var artists = resultList
        .map((item) => CloudMusicArtistData.fromJson(item))
        .toList();
    if (cacheDuration != null && artists.isNotEmpty) {
      await saveToCache(
        cacheKey: cacheKey,
        jsonBody: jsonBody,
        cacheDuration: cacheDuration,
        group: groupKey,
      );
    }
    return artists;
  } catch (e) {
    logger.e('发送请求失败: $e');
    throw CloudMusicException(message: l10n.error_network_error);
  }
}

Future<List<CloudMusicArtistData>> similarArtists(
  Ref ref, {
  required int artistId,
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_similarArtists:$artistId';
  final groupKey = 'cloud_similarArtists';
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  final useInfo = ref.watch(cloudUserInfoProvider);

  if (useInfo.value == null || apiState.defaultUrl.isEmpty) {
    return [];
  }
  if (cacheDuration != null) {
    final cached = await getFromCache<List<CloudMusicArtistData>>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) {
        if (json['code'] != 200) {
          return <CloudMusicArtistData>[];
        }
        final resultList = json['artists'] as List? ?? [];
        if (resultList.isEmpty) {
          return <CloudMusicArtistData>[];
        }
        return resultList
            .map((item) => CloudMusicArtistData.fromJson(item))
            .toList();
      },
    );
    if (cached != null && cached.isNotEmpty) {
      return cached;
    }
  }

  final query = <String, String>{'randomCNIP': 'true'};
  query['id'] = artistId.toString();

  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    query.addAll(cookieParams);
  }

  final response = await httpClientWrapper.post(
    '${apiState.defaultUrl}/simi/artist',
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
  final resultList = jsonBody['artists'] as List? ?? [];
  if (resultList.isEmpty) {
    return <CloudMusicArtistData>[];
  }
  var artists = resultList
      .map((item) => CloudMusicArtistData.fromJson(item))
      .toList();
  if (cacheDuration != null && artists.isNotEmpty) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: jsonBody,
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }
  return artists;
}

Future<ToneHarborTrackObjectList> cloudLikeList(Ref ref) async {
  final useInfo = ref.watch(cloudUserInfoProvider);
  if (useInfo.value == null) {
    return ToneHarborTrackObjectListEmpty();
  }

  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (apiState.defaultUrl.isEmpty) {
    logger.e('API URL为空');
    return ToneHarborTrackObjectListEmpty();
  }
  final l10n = ref.read(l10nProvider);
  final query = <String, String>{};
  query['uid'] = useInfo.value!.userId.toString();

  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    query.addAll(cookieParams);
  }

  final response = await httpClientWrapper.post(
    '${apiState.defaultUrl}/likelist',
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

  final ids = jsonBody['ids'] as List?;
  final resultList = ids?.map((e) => e as int).toList() ?? <int>[];
  if (resultList.isEmpty) {
    return ToneHarborTrackObjectListEmpty();
  }

  final tracks = await getTrackDetail(ref, ids: resultList);
  final trackObjects = tracks.map((track) => track.asTrack()).toList();
  return ToneHarborTrackObjectList.data(songs: trackObjects);
}

Future<bool> cloudLikeTrack(String trackId, bool isLike, Ref ref) async {
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (apiState.defaultUrl.isEmpty) {
    return false;
  }
  final query = <String, String>{};

  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    query.addAll(cookieParams);
  }
  query['id'] = trackId;
  query['like'] = isLike ? 'true' : 'false';

  final response = await httpClientWrapper.post(
    '${apiState.defaultUrl}/like',
    query: query,
    cancelToken: ref.cancelToken(),
  );
  if (response.statusCode != 200) {
    logger.e('请求失败，状态码：${response.statusCode}');
    return false;
  }
  late final Map<String, dynamic> jsonBody;
  try {
    jsonBody = parseJsonResponse(response.body);
  } catch (e) {
    logger.e('解析响应失败: $e');
    return false;
  }
  if (jsonBody['code'] != 200) {
    return false;
  }
  return true;
}
