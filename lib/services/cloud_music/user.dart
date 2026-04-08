import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'package:toneharbor/utils/base_utils.dart';

Future<CloudMusicUser?> getUserInfo(
  Ref ref, {
  Duration? cacheDuration = const Duration(minutes: 60),
}) async {
  final l10n = ref.read(l10nProvider);
  final apiState = ref.read(cloudMusicApiUrlsProvider);
  final cookieParams = CloudMusicAuth.getApiCookieParams();
  if (cookieParams.isEmpty) {
    return null;
  }
  final cacheKey = 'cloud_userInfo';
  final groupKey = 'cloud_user';
  if (cacheDuration != null) {
    final cached = await getFromCache<CloudMusicUser?>(
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

        return CloudMusicUser.fromJson(recommendList);
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
    final userInfo = CloudMusicUser.fromJson(recommendList);
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
