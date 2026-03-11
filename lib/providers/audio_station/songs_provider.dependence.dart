part of 'songs_provider.dart';

/// 发送歌曲请求并处理响应
Future<SongListResponse> _sendSongRequest<T>({
  required Ref ref,
  required T request,
  required Map<String, dynamic> Function() toJson,
  required String defaultError,
  required AppLocalizations l10n,
}) async {
  final authHeaders = await ref.read(authHeadersProvider.future);
  logger.d('authHeaders: $authHeaders');
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      if (!ref.mounted) return;
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return SongListResponse(success: false);
  }
  logger.d('发送歌曲请求: $request');

  final baseUrl = await ref.read(baseUrlProvider.future);

  final params = Map<String, dynamic>.from(toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/song.cgi',
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

  final result = SongListResponse.fromJson(jsonBody);
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

/// 发送歌词请求并处理响应
Future<LyricsResponse> _sendLyricsRequest<T>({
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
      if (!ref.mounted) return;
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return LyricsResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final params = Map<String, dynamic>.from(toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/lyrics.cgi',
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

  final result = LyricsResponse.fromJson(jsonBody);
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

/// 发送搜索歌词请求并处理响应
Future<SearchLyricsResponse> _sendSearchLyricsRequest<T>({
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
      if (!ref.mounted) return;
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return SearchLyricsResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/lyrics_search.cgi',
      body: HttpBody.form(
        toJson().map((key, value) => MapEntry(key, value?.toString() ?? '')),
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

  final result = SearchLyricsResponse.fromJson(jsonBody);
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

/// 发送歌曲信息请求并处理响应
Future<SongInfoResponse> _sendSongInfoRequest<T>({
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
    return SongInfoResponse(success: false, data: SongData(songs: []));
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final params = Map<String, dynamic>.from(toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/song.cgi',
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

  final result = SongInfoResponse.fromJson(jsonBody);
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

/// 获取歌曲列表
///
/// [limit] 返回的歌曲数量，默认 100
/// [offset] 偏移量，默认 0
/// [library] 库类型，默认 'shared'，可选 'all','personal'
/// [sortBy] 排序字段，默认 'artist'
/// [sortDirection] 排序方向，默认 'ASC'，可选 'DESC'
/// [additional] 额外信息，默认 'song_tag,song_audio,song_rating'
/// [artist] 艺术家名称，可选
/// [songRatingMeq] 评分大于等于，可选，用于获取收藏歌曲
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<SongListResponse> _getSongs({
  required Ref ref,
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'artist',
  String sortDirection = 'ASC',
  String additional = 'song_tag,song_audio,song_rating',
  String? artist,
  int? songRatingMeq,
  Duration? cacheDuration,
  String group = 'song',
}) async {
  final cacheKey =
      'getSongs:$limit:$offset:$library:$sortBy:$sortDirection:$additional:$artist:$songRatingMeq';

  if (cacheDuration != null) {
    final cached = await getFromCache<SongListResponse>(
      cacheKey: cacheKey,
      group: group,
      fromJson: (json) => SongListResponse.fromJson(json),
    );
    if (cached != null) {
      return cached;
    }
  }

  final request = SongRequest(
    api: 'SYNO.AudioStation.Song',
    method: 'list',
    version: '3',
    limit: limit,
    offset: offset,
    library: library,
    additional: additional,
    sortBy: sortBy,
    sortDirection: sortDirection,
    artist: artist,
    songRatingMeq: songRatingMeq,
  );

  final l10n = ref.read(l10nProvider);

  final result = await _sendSongRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_getSongs_failed,
    l10n: l10n,
  );

  if (cacheDuration != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: group,
    );
  }

  return result;
}

/// 设置歌曲评分
///
/// [id] 歌曲 ID
/// [rating] 评分，默认 5
Future<SetRatingResponse> _setRating({
  required Ref ref,
  required String id,
  int rating = 5,
}) async {
  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      if (!ref.mounted) return;
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return SetRatingResponse(success: false);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final request = SetRatingRequest(
    api: 'SYNO.AudioStation.Song',
    method: 'setrating',
    id: id,
    rating: rating,
    version: 3,
  );

  final l10n = ref.read(l10nProvider);

  final params = Map<String, dynamic>.from(request.toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/music/webapi/AudioStation/song.cgi',
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
      message: l10n.error_setRating_failed,
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

  final result = SetRatingResponse.fromJson(jsonBody);
  if (!result.success) {
    final errorCode = jsonBody['error']?['code'];
    final errorMessage = errorCode is int
        ? getAudioReuqestErrorMessage(
            l10n,
            l10n.error_setRating_failed,
            errorCode,
          )
        : l10n.error_setRating_failed;
    logger.e('请求失败，错误码：$errorCode，错误信息：$errorMessage');
    throw AudioStationException(
      message: errorMessage,
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  return result;
}

/// 获取插件数量
///
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<GetNumberOfPlugInsResponse> _getNumberOfPlugIns({
  required Ref ref,
  Duration? cacheDuration,
}) async {
  final cacheKey = 'getNumberOfPlugIns';

  if (cacheDuration != null) {
    final cached = await getFromCache<GetNumberOfPlugInsResponse>(
      cacheKey: cacheKey,
      group: 'songPlugins',
      fromJson: (json) => GetNumberOfPlugInsResponse.fromJson(json),
    );
    if (cached != null) {
      return cached;
    }
  }

  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    logger.w('认证失败，返回空结果');
    Future.microtask(() async {
      if (!ref.mounted) return;
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return GetNumberOfPlugInsResponse(success: false, hasPlugIn: 0);
  }

  final baseUrl = await ref.read(baseUrlProvider.future);

  final request = GetNumberOfPlugInsRequest(action: 'getNumberOfPlugIns');

  final l10n = ref.read(l10nProvider);

  final params = Map<String, dynamic>.from(request.toJson())
    ..removeWhere((key, value) => value == null);

  late final HttpTextResponse response;
  try {
    response = await httpClientWrapper.post(
      '$baseUrl/webman/3rdparty/AudioStation/webUI/audio_search_lyrics.cgi',
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
      message: l10n.error_getNumberOfPlugIns_failed,
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

  final result = GetNumberOfPlugInsResponse.fromJson(jsonBody);
  if (!result.success) {
    logger.e('获取插件数量失败');
    throw AudioStationException(message: l10n.error_getNumberOfPlugIns_failed);
  }

  if (cacheDuration != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: 'songPlugins',
    );
  }

  return result;
}

/// 获取专辑歌曲列表
///
/// [album] 专辑名称
/// [albumArtist] 专辑艺术家
/// [limit] 返回的歌曲数量，默认 100
/// [offset] 偏移量，默认 0
/// [library] 库类型，默认 'shared'
/// [sortBy] 排序字段，默认 'song_rating'
/// [sortDirection] 排序方向，默认 'DESC'
/// [additional] 额外信息，默认 'song_tag,song_audio,song_rating'
/// [artist] 艺术家
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<SongListResponse> _getAlbumSongs({
  required Ref ref,
  required String album,
  required String albumArtist,
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'song_rating',
  String sortDirection = 'DESC',
  String additional = 'song_tag,song_audio,song_rating',
  String? artist,
  Duration? cacheDuration,
  String groupKey = 'albumSongs',
}) async {
  final cacheKey =
      'getAlbumSongs:$album:$albumArtist:$limit:$offset:$library:$sortBy:$sortDirection:$additional:$artist';

  if (cacheDuration != null) {
    final cached = await getFromCache<SongListResponse>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) => SongListResponse.fromJson(json),
    );
    if (cached != null) {
      return cached;
    }
  }

  final request = AlbumSongsRequest(
    api: 'SYNO.AudioStation.Song',
    method: 'list',
    version: '3',
    limit: limit,
    offset: offset,
    library: library,
    additional: additional,
    sortBy: sortBy,
    sortDirection: sortDirection,
    album: album,
    albumArtist: albumArtist,
    artist: artist,
  );

  final l10n = ref.read(l10nProvider);

  final result = await _sendSongRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_getAlbumSongs_failed,
    l10n: l10n,
  );

  if (cacheDuration != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }

  return result;
}

/// 搜索歌曲
///
/// [title] 歌曲标题，必填
/// [library] 库类型，默认 'all'，可选 'shared', 'personal'
/// [limit] 返回的歌曲数量，默认 5000
/// [offset] 偏移量，默认 0
/// [sortDirection] 排序方向，默认 'asc'
/// [additional] 额外信息，默认 'song_tag,song_audio,song_rating'
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<SongListResponse> _searchSongs({
  required Ref ref,
  required String title,
  String library = 'all',
  int limit = 5000,
  int offset = 0,
  String sortDirection = 'asc',
  String additional = 'song_tag,song_audio,song_rating',
  Duration? cacheDuration,
  String groupKey = 'search',
}) async {
  final cacheKey =
      'searchSongs:$title:$library:$limit:$offset:$sortDirection:$additional';

  if (cacheDuration != null) {
    final cached = await getFromCache<SongListResponse>(
      cacheKey: cacheKey,
      group: groupKey,
      fromJson: (json) => SongListResponse.fromJson(json),
    );
    if (cached != null) {
      return cached;
    }
  }

  final request = SearchSongRequest(
    api: 'SYNO.AudioStation.Song',
    method: 'search',
    version: '3',
    additional: additional,
    library: library,
    limit: limit,
    offset: offset,
    sortDirection: sortDirection,
    title: title,
  );

  final l10n = ref.read(l10nProvider);

  final result = await _sendSongRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_search_failed.replaceFirst('%s', title),
    l10n: l10n,
  );

  if (cacheDuration != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: groupKey,
    );
  }

  return result;
}

/// 获取歌词
///
/// [id] 歌曲 ID，例如 'music_785331'
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<LyricsResponse> _getLyrics({
  required Ref ref,
  required String id,
  Duration? cacheDuration,
}) async {
  final cacheKey = 'getLyrics:$id';

  if (cacheDuration != null) {
    final cached = await getFromCache<LyricsResponse>(
      cacheKey: cacheKey,
      group: 'lyrics',
      fromJson: (json) => LyricsResponse.fromJson(json),
    );
    if (cached != null) {
      return cached;
    }
  }

  final request = LyricsRequest(
    api: 'SYNO.AudioStation.Lyrics',
    method: 'getlyrics',
    id: id,
    version: 2,
  );

  final l10n = ref.read(l10nProvider);

  final result = await _sendLyricsRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_getLyrics_failed,
    l10n: l10n,
  );

  if (cacheDuration != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: 'lyrics',
    );
  }

  return result;
}

/// 搜索歌词
///
/// [title] 歌曲标题
/// [artist] 艺术家
/// [limit] 返回的数量，默认 10
/// [additional] 额外信息，默认 'full_lyrics'
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<SearchLyricsResponse> _searchLyrics({
  required Ref ref,
  required String title,
  String? artist,
  int limit = 10,
  String additional = 'full_lyrics',
  Duration? cacheDuration,
}) async {
  final cacheKey = 'searchLyrics:$title:$artist:$limit:$additional';

  if (cacheDuration != null) {
    final cached = await getFromCache<SearchLyricsResponse>(
      cacheKey: cacheKey,
      group: 'lyrics',
      fromJson: (json) => SearchLyricsResponse.fromJson(json),
    );
    if (cached != null) {
      return cached;
    }
  }

  final request = SearchLyricsRequest(
    api: 'SYNO.AudioStation.LyricsSearch',
    method: 'searchlyrics',
    version: '2',
    title: title,
    artist: artist,
    limit: limit,
    additional: additional,
  );

  final l10n = ref.read(l10nProvider);

  final result = await _sendSearchLyricsRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_searchLyrics_failed,
    l10n: l10n,
  );

  if (cacheDuration != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: 'lyrics',
    );
  }

  return result;
}

/// 获取歌曲信息
///
/// [id] 歌曲 ID
/// [additional] 额外信息，默认 'song_rating'
/// [cacheDuration] 缓存时长，不传则不使用缓存
Future<SongInfoResponse> _getSongInfo({
  required Ref ref,
  required String id,
  String additional = 'song_rating',
  Duration? cacheDuration,
}) async {
  final cacheKey = 'getSongInfo:$id:$additional';

  if (cacheDuration != null) {
    final cached = await getFromCache<SongInfoResponse>(
      cacheKey: cacheKey,
      group: 'songInfo',
      fromJson: (json) => SongInfoResponse.fromJson(json),
    );
    if (cached != null) {
      return cached;
    }
  }

  final request = SongInfoRequest(
    api: 'SYNO.AudioStation.Song',
    method: 'getinfo',
    version: '2',
    id: id,
    additional: additional,
  );

  final l10n = ref.read(l10nProvider);

  final result = await _sendSongInfoRequest(
    ref: ref,
    request: request,
    toJson: () => request.toJson(),
    defaultError: l10n.error_getSongInfo_failed,
    l10n: l10n,
  );

  if (cacheDuration != null) {
    await saveToCache(
      cacheKey: cacheKey,
      jsonBody: result.toJson(),
      cacheDuration: cacheDuration,
      group: 'songInfo',
    );
  }

  return result;
}
