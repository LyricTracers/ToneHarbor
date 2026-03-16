part of 'artists_provider.dart';

/// 发送艺术家请求并处理响应
Future<ArtistResponse> _sendArtistRequest<T>({
  required Ref ref,
  required T request,
  required Map<String, dynamic> Function() toJson,
  required String defaultError,
  required AppLocalizations l10n,
}) async {
  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return ArtistResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final params = Map<String, dynamic>.from(toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/artist.cgi',
      body: HttpBody.form(
        params.map((key, value) => MapEntry(key, value.toString())),
      ),
      headers: HttpHeaders.rawMap({
        'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
        ...authHeaders,
      }),
      cancelToken: ref.cancelToken(),
    );
  } catch (e) {
    logger.e('发送请求失败: $e');
    throw AudioStationException(message: l10n.error_network_error);
  }

  if (response.statusCode != 200) {
    logger.e('请求失败，状态码：${response.statusCode}');
    throw AudioStationException(
      message: defaultError,
      statusCode: response.statusCode,
    );
  }

  late final Map<String, dynamic> jsonBody;
  try {
    jsonBody = parseJsonResponse(response.body);
  } catch (e) {
    logger.e('解析响应失败: $e');
    throw AudioStationException(message: l10n.error_response_parse_failed);
  }

  final result = ArtistResponse.fromJson(jsonBody);
  if (!result.success) {
    final errorCode = jsonBody['error']?['code'];
    final errorMessage = errorCode is int
        ? getAudioReuqestErrorMessage(l10n, defaultError, errorCode)
        : defaultError;
    logger.e('请求失败，错误码：$errorCode，错误信息：$errorMessage');
    throw AudioStationException(
      message: errorMessage,
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  return result;
}

/// 获取艺术家列表
///
/// [limit] 返回的艺术家数量，默认 100
/// [offset] 偏移量，默认 0
/// [library] 库类型，默认 'shared'
/// [sortBy] 排序字段，默认 'name'
/// [sortDirection] 排序方向，默认 'ASC'
/// [additional] 额外信息，默认 'avg_rating'
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<ArtistResponse> _getArtists({
  required Ref ref,
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'name',
  String sortDirection = 'ASC',
  String additional = 'avg_rating',
  Duration? cacheDuration,
  String groupKey = "artist",
}) async {
  final cacheKey =
      'getArtists:$limit:$offset:$library:$sortBy:$sortDirection:$additional';

  if (cacheDuration != null) {
    final cached = await getFromCache<ArtistResponse>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) => ArtistResponse.fromJson(json),
    );
    if (cached != null && cached.success) {
      return cached;
    }
  }

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

  final l10n = ref.read(l10nProvider);

  final result = await _sendArtistRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_getArtists_failed,
    l10n: l10n,
  );

  if (cacheDuration != null && result.success) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }

  return result;
}

/// 搜索艺术家
///
/// [filter] 艺术家名称，必填
/// [library] 库类型，默认 'all'，可选 'shared', 'personal'
/// [limit] 返回的艺术家数量，默认 5000
/// [offset] 偏移量，默认 0
/// [sortBy] 排序字段，默认 'name'
/// [sortDirection] 排序方向，默认 'asc'
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<ArtistResponse> _searchArtists({
  required Ref ref,
  required String filter,
  String library = 'all',
  int limit = 5000,
  int offset = 0,
  String sortBy = 'name',
  String sortDirection = 'asc',
  Duration? cacheDuration,
  String groupKey = "artist",
}) async {
  final cacheKey =
      'searchArtists:$filter:$library:$limit:$offset:$sortBy:$sortDirection';

  if (cacheDuration != null) {
    final cached = await getFromCache<ArtistResponse>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) => ArtistResponse.fromJson(json),
    );
    if (cached != null && cached.success) {
      return cached;
    }
  }

  final request = SearchArtistRequest(
    api: 'SYNO.AudioStation.Artist',
    method: 'list',
    version: '1',
    filter: filter,
    library: library,
    limit: limit,
    offset: offset,
    sortBy: sortBy,
    sortDirection: sortDirection,
  );
  final l10n = ref.read(l10nProvider);
  final result = await _sendArtistRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_search_failed.replaceFirst('%s', filter),
    l10n: l10n,
  );

  if (cacheDuration != null && result.success) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }

  return result;
}
