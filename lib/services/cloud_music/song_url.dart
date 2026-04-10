import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'song_url.g.dart';

enum CloudMusicQuality {
  standard('standard', 128000),
  higher('higher', 192000),
  exhigh('exhigh', 320000),
  lossless('lossless', 999000),
  hires('hires', 350000);

  const CloudMusicQuality(this.level, this.bitrate);
  final String level;
  final int bitrate;
}

class CloudMusicSongUrlData {
  final String url;
  final int bitrate;
  final String? extension;
  final bool isFreeTrial;

  CloudMusicSongUrlData({
    required this.url,
    required this.bitrate,
    this.extension,
    this.isFreeTrial = false,
  });

  String get fileExtension {
    if (extension != null && extension!.isNotEmpty) {
      return extension!;
    }
    if (url.contains('.flac')) {
      return 'flac';
    }
    if (url.contains('.wav')) {
      return 'wav';
    }
    if (url.contains('.m4a')) {
      return 'm4a';
    }
    if (url.contains('.ogg')) {
      return 'ogg';
    }
    return 'mp3';
  }
}

Future<CloudMusicSongUrlData?> getSongUrl(
  Ref ref, {
  required int songId,
  CloudMusicQuality quality = CloudMusicQuality.exhigh,
  bool unblock = false,
  bool skipFreeTrial = true,
}) async {
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  if (apiState.defaultUrl.isEmpty) {
    logger.w('[CloudMusicSongUrl] API URL is empty');
    final isLoggedIn = CloudMusicAuth.isLoggedIn();
    if (!isLoggedIn) {
      final fallbackUrl =
          'https://music.163.com/song/media/outer/url?id=$songId';
      logger.i(
        '[CloudMusicSongUrl] Using fallback URL for unauthenticated user',
      );
      return CloudMusicSongUrlData(
        url: fallbackUrl,
        bitrate: 128000,
        extension: 'mp3',
        isFreeTrial: false,
      );
    }
    return null;
  }

  final query = <String, String>{
    'id': songId.toString(),
    'level': quality.level,
  };

  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isNotEmpty) {
    query.addAll(cookieParams);
  }

  if (unblock) {
    query['unblock'] = 'true';
  }

  query['timestamp'] = DateTime.now().millisecondsSinceEpoch.toString();

  try {
    final response = await httpClientWrapper.get(
      '${apiState.defaultUrl}/song/url/v1',
      query: query,
      cancelToken: ref.cancelToken(),
    );

    final json = parseJsonResponse(response.body);
    if (json['code'] != 200) {
      logger.w('[CloudMusicSongUrl] API returned error: ${json['code']}');
      if (!unblock) {
        logger.i('[CloudMusicSongUrl] API error, trying unblock');
        return getSongUrl(ref, songId: songId, quality: quality, unblock: true);
      }
      return null;
    }

    final dataList = json['data'] as List?;
    if (dataList == null || dataList.isEmpty) {
      logger.w('[CloudMusicSongUrl] No data returned');
      if (!unblock) {
        logger.i('[CloudMusicSongUrl] No data, trying unblock');
        return getSongUrl(ref, songId: songId, quality: quality, unblock: true);
      }
      return null;
    }

    final songData = dataList.first as Map<String, dynamic>;
    final url = songData['url'] as String?;

    if (url == null || url.isEmpty) {
      if (!unblock) {
        logger.i('[CloudMusicSongUrl] URL is empty, trying unblock');
        return getSongUrl(ref, songId: songId, quality: quality, unblock: true);
      }
      logger.w('[CloudMusicSongUrl] URL is empty after unblock');
      return null;
    }

    final freeTrialInfo = songData['freeTrialInfo'];
    final isFreeTrial = freeTrialInfo != null;

    if (isFreeTrial && skipFreeTrial) {
      logger.w('[CloudMusicSongUrl] Song is free trial only, skipping');
      if (!unblock) {
        logger.i('[CloudMusicSongUrl] Free trial, trying unblock');
        return getSongUrl(ref, songId: songId, quality: quality, unblock: true);
      }
      return null;
    }

    final bitrate = songData['br'] as int? ?? quality.bitrate;

    String? extension;
    final encodeType = songData['type'] as String?;
    if (encodeType != null && encodeType.isNotEmpty) {
      extension = encodeType.toLowerCase();
    } else {
      final urlPath = Uri.parse(url).path;
      if (urlPath.contains('.')) {
        extension = urlPath.split('.').last.toLowerCase();
      }
    }

    return CloudMusicSongUrlData(
      url: url.replaceAll('http://', 'https://'),
      bitrate: bitrate,
      extension: extension,
      isFreeTrial: isFreeTrial,
    );
  } catch (e, stack) {
    logger.e(
      '[CloudMusicSongUrl] Error getting song URL',
      error: e,
      stackTrace: stack,
    );
    if (!unblock) {
      logger.i('[CloudMusicSongUrl] Error occurred, trying unblock');
      return getSongUrl(ref, songId: songId, quality: quality, unblock: true);
    }
    return null;
  }
}

@riverpod
Future<CloudMusicSongUrlData?> cloudMusicSongUrl(
  Ref ref, {
  required int songId,
  CloudMusicQuality quality = CloudMusicQuality.exhigh,
}) async {
  return getSongUrl(ref, songId: songId, quality: quality);
}
