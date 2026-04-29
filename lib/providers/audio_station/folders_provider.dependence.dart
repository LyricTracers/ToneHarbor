part of 'folders_provider.dart';

/// 发送文件夹请求并处理响应
Future<FolderResponse> _sendFolderRequest<T>({
  required Ref ref,
  required T request,
  required Map<String, dynamic> Function() toJson,
  required String defaultError,
  required AppLocalizations l10n,
}) async {
  final authHeaders = ref.read(authHeadersProvider);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      // ref.invalidate(authTokenProvider);
    });
    return FolderResponse(success: false);
  }

  final baseUrl = ref.read(baseUrlProvider());

  final params = Map<String, dynamic>.from(toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/webapi/AudioStation/folder.cgi',
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

  final result = FolderResponse.fromJson(jsonBody);
  if (!result.success) {
    final errorCode = jsonBody['error']?['code'];
    if (errorCode == 105 ||
        errorCode == 106 ||
        errorCode == 107 ||
        errorCode == 150) {
      ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
    }
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

/// 获取文件夹列表
///
/// [id] 文件夹 ID，可选
/// [limit] 返回的文件夹数量，默认 1000
/// [offset] 偏移量，默认 0
/// [library] 库类型，默认 'shared'
/// [sortBy] 排序字段，默认 'song_rating'
/// [sortDirection] 排序方向，默认 'DESC'
/// [additional] 额外信息，默认 'song_tag,song_audio,song_rating'
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<FolderResponse> _getFolders({
  required Ref ref,
  String? id,
  int limit = 1000,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'song_rating',
  String sortDirection = 'DESC',
  String additional = 'song_tag,song_audio,song_rating',
  Duration? cacheDuration,
  String groupKey = 'folders',
}) async {
  final baseUrl = ref.read(baseUrlProvider());
  final cacheKey =
      'getFolders:$id:$limit:$offset:$library:$sortBy:$sortDirection:$additional:${baseUrl.hashCode}';

  if (cacheDuration != null) {
    final cached = await getFromCache<FolderResponse>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) => FolderResponse.fromJson(json),
    );
    if (cached != null && cached.success) {
      return cached;
    }
  }

  final request = FolderRequest(
    api: 'SYNO.AudioStation.Folder',
    method: 'list',
    version: 2,
    id: id,
    limit: limit,
    offset: offset,
    library: library,
    additional: additional,
    sortBy: sortBy,
    sortDirection: sortDirection,
  );

  final l10n = ref.read(l10nProvider);

  final result = await _sendFolderRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_getFolders_failed,
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
