import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

Future<List<CloudMusicPlaylist>> recommendPlaylist(
  Ref ref, {
  int limit = 10,
  Duration? cacheDuration = const Duration(minutes: 30),
}) async {
  final l10n = ref.read(l10nProvider);
  final cacheKey = 'cloud_recommendPlaylist:$limit';
  final groupKey = 'cloud_recommendPlaylist';
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (cacheDuration != null) {
    final cached = await getFromCache<List<CloudMusicPlaylist>>(
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
            .map((item) => CloudMusicPlaylist.fromJson(item))
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
        .map((item) => CloudMusicPlaylist.fromJson(item))
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
