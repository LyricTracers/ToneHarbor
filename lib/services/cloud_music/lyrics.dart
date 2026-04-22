import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';

Future<Lyrics?> getNetLyrics({
  required Ref ref,
  required String id,
  Duration? cacheDuration,
}) async {
  final cacheKey = 'getCloudLyrics:$id';

  if (cacheDuration != null) {
    final cached = await getFromCache<Map<String, dynamic>>(
      cacheKey: cacheKey,
      group: 'lyrics',
      fromJson: (json) {
        return json;
      },
    );
    if (cached != null && cached.containsKey('code') && cached['code'] == 200) {
      return Lyrics.fromNeteaseResponse(cached);
    }
  }
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (apiState.defaultUrl.isEmpty) {
    return null;
  }
  try {
    final response = await httpClientWrapper.get(
      '${apiState.defaultUrl}/lyric/new',
      query: {'id': id},
      cancelToken: ref.cancelToken(),
    );
    if (response.statusCode != 200) {
      logger.e('请求失败，状态码：${response.statusCode}');
      return null;
    }
    late final Map<String, dynamic> jsonBody;
    jsonBody = parseJsonResponse(response.body);
    final result = CloudMusicLyricData.fromJson(jsonBody);

    if (result.code == 200) {
      try {
        final lyrics = Lyrics.fromNeteaseResponse(jsonBody);
        if (lyrics != null && cacheDuration != null) {
          await saveToCache(
            cacheKey: cacheKey,
            jsonBody: jsonBody,
            cacheDuration: cacheDuration,
            group: 'lyrics',
          );
        }
        return lyrics;
      } catch (e) {
        logger.e('从歌词响应中提取歌词失败：$e');
        return null;
      }
    }
  } catch (e) {
    logger.e('请求歌词失败：$e');
    return null;
  }
  return null;
}
