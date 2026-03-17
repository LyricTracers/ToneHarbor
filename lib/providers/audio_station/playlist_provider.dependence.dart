part of 'playlist_provider.dart';

Future<PlaylistListResponse> _sendPlaylistRequest<T>({
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
    return PlaylistListResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final params = Map<String, dynamic>.from(toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/playlist.cgi',
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

  final result = PlaylistListResponse.fromJson(jsonBody);
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

Future<PlaylistDetailResponse> _sendPlaylistDetailRequest<T>({
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
    return PlaylistDetailResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final params = Map<String, dynamic>.from(toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/playlist.cgi',
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

  final result = PlaylistDetailResponse.fromJson(jsonBody);
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

Future<PlaylistListResponse> _getPlaylists({
  required Ref ref,
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = '',
  String sortDirection = 'ASC',
  Duration? cacheDuration,
  String groupKey = 'playlist',
}) async {
  final cacheKey =
      'getPlaylists:$limit:$offset:$library:$sortBy:$sortDirection';

  if (cacheDuration != null) {
    final cached = await getFromCache<PlaylistListResponse>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) => PlaylistListResponse.fromJson(json),
    );

    if (cached != null && cached.success) {
      return cached;
    }
  }

  final request = PlaylistListRequest(
    api: 'SYNO.AudioStation.Playlist',
    method: 'list',
    version: 3,
    limit: limit,
    offset: offset,
    library: library,
    sortBy: sortBy,
    sortDirection: sortDirection,
  );

  final l10n = ref.read(l10nProvider);

  final result = await _sendPlaylistRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_getPlaylists_failed,
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

Future<PlaylistDetailResponse> _getPlaylistDetail({
  required Ref ref,
  required String id,
  String library = 'shared',
  String additional =
      'songs_song_tag,songs_song_audio,songs_song_rating,sharing_info',
  int limit = 100,
  int offset = 0,
  String sortBy = '',
  String sortDirection = 'ASC',
  Duration? cacheDuration,
  String groupKey = 'playlist',
}) async {
  final cacheKey =
      'getPlaylistDetail:$id:$library:$additional:$limit:$offset:$sortBy:$sortDirection';

  if (cacheDuration != null) {
    final cached = await getFromCache<PlaylistDetailResponse>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) => PlaylistDetailResponse.fromJson(json),
    );
    if (cached != null && cached.success) {
      return cached;
    }
  }

  final request = PlaylistDetailRequest(
    api: 'SYNO.AudioStation.Playlist',
    method: 'getinfo',
    version: 3,
    id: id,
    library: library,
    additional: additional,
    limit: limit,
    offset: offset,
    sortBy: sortBy,
    sortDirection: sortDirection,
  );

  final l10n = ref.read(l10nProvider);

  final result = await _sendPlaylistDetailRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_getPlaylistDetail_failed,
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

Future<PlaylistDetailResponse> _getPlaylistInfo({
  required Ref ref,
  required String id,
  String additional = 'songs',
  Duration? cacheDuration,
  String groupKey = 'playlist',
}) async {
  final cacheKey = 'getPlaylistInfo:$id:$additional';

  if (cacheDuration != null) {
    final cached = await getFromCache<PlaylistDetailResponse>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) => PlaylistDetailResponse.fromJson(json),
    );
    if (cached != null && cached.success) {
      return cached;
    }
  }

  final request = PlaylistDetailRequest(
    api: 'SYNO.AudioStation.Playlist',
    method: 'getinfo',
    version: 3,
    id: id,
    library: 'shared',
    additional: additional,
    limit: 1,
    offset: 0,
    sortBy: '',
    sortDirection: 'ASC',
  );

  final l10n = ref.read(l10nProvider);

  final result = await _sendPlaylistDetailRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_getPlaylistInfo_failed,
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

Future<CreatePlaylistResponse> _createPlaylist({
  required Ref ref,
  required String name,
}) async {
  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return CreatePlaylistResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final request = CreatePlaylistRequest(
    api: 'SYNO.AudioStation.Playlist',
    method: 'create',
    version: 3,
    name: name,
    library: 'personal',
  );

  final l10n = ref.read(l10nProvider);

  final params = Map<String, dynamic>.from(request.toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/playlist.cgi',
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
      message: l10n.error_createPlaylist_failed,
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

  final result = CreatePlaylistResponse.fromJson(jsonBody);
  if (!result.success) {
    final errorCode = jsonBody['error']?['code'];
    final errorMessage = errorCode is int
        ? getAudioReuqestErrorMessage(
            l10n,
            l10n.error_createPlaylist_failed,
            errorCode,
          )
        : l10n.error_createPlaylist_failed;
    logger.e('请求失败，错误码：$errorCode，错误信息：$errorMessage');
    throw AudioStationException(
      message: errorMessage,
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  return result;
}

Future<RenamePlaylistResponse> _renamePlaylist({
  required Ref ref,
  required String id,
  required String newName,
}) async {
  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return RenamePlaylistResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final request = RenamePlaylistRequest(
    api: 'SYNO.AudioStation.Playlist',
    method: 'rename',
    version: 1,
    id: id,
    newName: newName,
  );

  final l10n = ref.read(l10nProvider);

  final params = Map<String, dynamic>.from(request.toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/playlist.cgi',
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
      message: l10n.error_renamePlaylist_failed,
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

  final result = RenamePlaylistResponse.fromJson(jsonBody);
  if (!result.success) {
    final errorCode = jsonBody['error']?['code'];
    final errorMessage = errorCode is int
        ? getAudioReuqestErrorMessage(
            l10n,
            l10n.error_renamePlaylist_failed,
            errorCode,
          )
        : l10n.error_renamePlaylist_failed;
    logger.e('请求失败，错误码：$errorCode，错误信息：$errorMessage');
    throw AudioStationException(
      message: errorMessage,
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  return result;
}

Future<DeletePlaylistResponse> _deletePlaylist({
  required Ref ref,
  required String id,
}) async {
  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return DeletePlaylistResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final request = DeletePlaylistRequest(
    api: 'SYNO.AudioStation.Playlist',
    method: 'delete',
    version: 1,
    id: id,
  );

  final l10n = ref.read(l10nProvider);

  final params = Map<String, dynamic>.from(request.toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/playlist.cgi',
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
      message: l10n.error_deletePlaylist_failed,
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

  final result = DeletePlaylistResponse.fromJson(jsonBody);
  if (!result.success) {
    final errorCode = jsonBody['error']?['code'];
    final errorMessage = errorCode is int
        ? getAudioReuqestErrorMessage(
            l10n,
            l10n.error_deletePlaylist_failed,
            errorCode,
          )
        : l10n.error_deletePlaylist_failed;
    logger.e('请求失败，错误码：$errorCode，错误信息：$errorMessage');
    throw AudioStationException(
      message: errorMessage,
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  return result;
}

Future<AddPlaylistSongsResponse> _addSongToPlaylist({
  required Ref ref,
  required String id,
  required String songId,
  int offset = -1,
  int limit = 0,
  bool skipDuplicate = false,
}) async {
  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return AddPlaylistSongsResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final request = AddPlaylistSongsRequest(
    api: 'SYNO.AudioStation.Playlist',
    method: 'updatesongs',
    version: 3,
    id: id,
    offset: offset,
    limit: limit,
    songs: songId,
    skipDuplicate: skipDuplicate,
  );

  final l10n = ref.read(l10nProvider);

  final params = Map<String, dynamic>.from(request.toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/playlist.cgi',
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
      message: l10n.error_addSongToPlaylist_failed,
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

  final result = AddPlaylistSongsResponse.fromJson(jsonBody);
  if (!result.success) {
    final errorCode = jsonBody['error']?['code'];
    final errorMessage = errorCode is int
        ? getAudioReuqestErrorMessage(
            l10n,
            l10n.error_addSongToPlaylist_failed,
            errorCode,
          )
        : l10n.error_addSongToPlaylist_failed;
    logger.e('请求失败，错误码：$errorCode，错误信息：$errorMessage');
    throw AudioStationException(
      message: errorMessage,
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  return result;
}

Future<RemoveMissingSongsResponse> _removeMissingSongs({
  required Ref ref,
  required String id,
}) async {
  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return RemoveMissingSongsResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final request = RemoveMissingSongsRequest(
    api: 'SYNO.AudioStation.Playlist',
    method: 'removemissing',
    version: 3,
    id: id,
  );

  final l10n = ref.read(l10nProvider);

  final params = Map<String, dynamic>.from(request.toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/playlist.cgi',
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
      message: l10n.error_removeMissingSongs_failed,
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

  final result = RemoveMissingSongsResponse.fromJson(jsonBody);
  if (!result.success) {
    final errorCode = jsonBody['error']?['code'];
    final errorMessage = errorCode is int
        ? getAudioReuqestErrorMessage(
            l10n,
            l10n.error_removeMissingSongs_failed,
            errorCode,
          )
        : l10n.error_removeMissingSongs_failed;
    logger.e('请求失败，错误码：$errorCode，错误信息：$errorMessage');
    throw AudioStationException(
      message: errorMessage,
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  return result;
}
