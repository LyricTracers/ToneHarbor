import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'package:toneharbor/utils/base_utils.dart';

Future<List<CloudMusicArtist>> toplistOfArtists(
  Ref ref, {
  required int type,
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_toplistOfArtists:$type';
  final groupKey = 'cloud_toplistOfArtists';
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (cacheDuration != null) {
    final cached = await getFromCache<List<CloudMusicArtist>>(
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
            .map((item) => CloudMusicArtist.fromJson(item))
            .toList();
      },
    );
    if (cached != null && cached.isNotEmpty) {
      return cached;
    }
  }
  try {
    final query = <String, String>{
      'randomCNIP': 'true',
    };
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
        .map((item) => CloudMusicArtist.fromJson(item))
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
