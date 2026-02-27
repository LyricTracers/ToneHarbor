part of 'artists_provider.dart';

Future<ArtistResponse> getArtists({
  required Ref ref,
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'name',
  String sortDirection = 'ASC',
  String additional = 'avg_rating',
  Duration? cacheDuration,
}) async {
  // 生成缓存键
  final cacheKey =
      'getArtists:$limit:$offset:$library:$sortBy:$sortDirection:$additional';

  // 尝试从缓存读取
  if (cacheDuration != null) {
    try {
      final cachedJson = await audioStationRequestCache.get(
        cacheKey,
        group: 'artist',
      );
      if (cachedJson != null) {
        logger.i('从缓存读取艺术家列表');
        return ArtistResponse.fromJson(cachedJson);
      }
    } catch (e) {
      logger.w('读取缓存失败: $e');
      // 缓存失败不影响主流程，继续执行
    }
  }

  // 准备请求参数
  final request = ArtistRequest(
    api: 'SYNO.AudioStation.Artist',
    method: 'list',
    version: 4,
    limit: limit,
    offset: offset,
    library: library,
    additional: additional,
    sortBy: sortBy,
    sortDirection: sortDirection,
  );

  // 获取认证 headers
  final authHeaders = await getAuthHeaders(ref);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    return ArtistResponse(success: false);
  }

  // 获取 baseUrl
  final baseUrl = await ref.read(baseUrlProvider.future);
  final l10n = lookupAppLocalizations(
    getValueWhenReadyWithRef(ref, localeProvider, const Locale('zh')),
  );

  // 发送请求
  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/artist.cgi',
      body: HttpBody.form(
        request.toJson().map(
          (key, value) => MapEntry(key, value?.toString() ?? ''),
        ),
      ),
      headers: HttpHeaders.rawMap({
        'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
        ...authHeaders,
      }),
    );
  } catch (e) {
    logger.e('发送请求失败: $e');
    throw AudioStationException(message: l10n.error_network_error);
  }

  // 处理响应
  if (response.statusCode != 200) {
    logger.e('获取艺术家列表失败，状态码：${response.statusCode}');
    throw AudioStationException(
      message: l10n.error_getArtists_failed,
      statusCode: response.statusCode,
    );
  }

  // 解析响应
  late final Map<String, dynamic> jsonBody;
  try {
    jsonBody = parseJsonResponse(response.body);
  } catch (e) {
    logger.e('解析响应失败: $e');
    throw AudioStationException(message: l10n.error_response_parse_failed);
  }

  // 检查响应状态
  final result = ArtistResponse.fromJson(jsonBody);
  if (!result.success) {
    final errorCode = jsonBody['error']?['code'];
    final errorMessage = errorCode is int
        ? getAudioReuqestErrorMessage(
            l10n,
            l10n.error_getArtists_failed,
            errorCode,
          )
        : l10n.error_getArtists_failed;
    logger.e('获取艺术家列表失败，错误码：$errorCode，错误信息：$errorMessage');
    throw AudioStationException(
      message: errorMessage,
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  // 缓存结果
  if (cacheDuration != null) {
    try {
      await audioStationRequestCache.set(
        cacheKey,
        jsonBody,
        duration: cacheDuration,
        group: 'artist',
      );
      logger.d('艺术家列表已缓存');
    } catch (e) {
      logger.w('缓存失败: $e');
      // 缓存失败不影响主流程
    }
  }

  return result;
}
