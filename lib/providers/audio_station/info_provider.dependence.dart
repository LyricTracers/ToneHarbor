part of 'info_provider.dart';

/// 发送 Audio Station 信息请求并处理响应
Future<AudioStationInfoResponse> _sendAudioStationInfoRequest({
  required Ref ref,
  required AudioStationInfoRequest request,
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
    return AudioStationInfoResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final params = Map<String, dynamic>.from(request.toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/info.cgi',
      body: HttpBody.form(
        params.map((key, value) => MapEntry(key, value.toString())),
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

  final result = AudioStationInfoResponse.fromJson(jsonBody);
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

/// 发送 DSM 信息请求并处理响应
Future<DSMInfoResponse> _sendDSMInfoRequest({
  required Ref ref,
  required DSMInfoRequest request,
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
    return DSMInfoResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final params = Map<String, dynamic>.from(request.toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.get(
      '$baseUrl/webapi/entry.cgi',
      query: params.map((key, value) => MapEntry(key, value.toString())),
      headers: HttpHeaders.rawMap({'accept': '*/*', ...authHeaders}),
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

  final result = DSMInfoResponse.fromJson(jsonBody);
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

/// 获取 Audio Station 服务器信息
///
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<AudioStationInfoResponse> _getAudioStationInfo({
  required Ref ref,
  Duration? cacheDuration,
}) async {
  final cacheKey = 'getAudioStationInfo';

  if (cacheDuration != null) {
    final cached = await getFromCache<AudioStationInfoResponse>(
      cacheKey: cacheKey,
      group: 'info',
      fromJson: (json) => AudioStationInfoResponse.fromJson(json),
    );
    if (cached != null) {
      return cached;
    }
  }

  final request = AudioStationInfoRequest(
    api: 'SYNO.AudioStation.Info',
    method: 'getinfo',
    version: '6',
  );

  final l10n = lookupAppLocalizations(
    getValueWhenReadyWithRef(ref, localeProvider, const Locale('zh')),
  );

  final result = await _sendAudioStationInfoRequest(
    ref: ref,
    request: request,
    defaultError: l10n.error_getServerInfo_failed,
    l10n: l10n,
  );

  if (cacheDuration != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: 'info',
    );
  }

  return result;
}

/// 获取 DSM 信息
///
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<DSMInfoResponse> _getDSMInfo({
  required Ref ref,
  Duration? cacheDuration,
}) async {
  final cacheKey = 'getDSMInfo';

  if (cacheDuration != null) {
    final cached = await getFromCache<DSMInfoResponse>(
      cacheKey: cacheKey,
      group: 'info',
      fromJson: (json) => DSMInfoResponse.fromJson(json),
    );
    if (cached != null) {
      return cached;
    }
  }

  final request = DSMInfoRequest(
    api: 'SYNO.DSM.Info',
    method: 'getinfo',
    version: '2',
  );

  final l10n = lookupAppLocalizations(
    getValueWhenReadyWithRef(ref, localeProvider, const Locale('zh')),
  );

  final result = await _sendDSMInfoRequest(
    ref: ref,
    request: request,
    defaultError: l10n.error_getDSMInfo_failed,
    l10n: l10n,
  );

  if (cacheDuration != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: 'info',
    );
  }

  return result;
}
