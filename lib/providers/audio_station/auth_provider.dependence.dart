part of 'auth_provider.dart';

String _getLoginErrorMessage(AppLocalizations l10n, int? errorCode) {
  switch (errorCode) {
    case 400:
      return l10n.error_syno_login_400;
    case 401:
      return l10n.error_syno_login_401;
    case 402:
      return l10n.error_syno_login_402;
    case 403:
      return l10n.error_syno_login_403;
    case 404:
      return l10n.error_syno_login_404;
    case 406:
      return l10n.error_syno_login_406;
    case 407:
      return l10n.error_syno_login_407;
    case 408:
      return l10n.error_syno_login_408;
    case 409:
      return l10n.error_syno_login_409;
    case 410:
      return l10n.error_syno_login_410;
    default:
      return l10n.error_login_failed;
  }
}

Future<AuthResponse> _fullLogin(
  WidgetRef ref,
  Account account,
  AppLocalizations l10n,
) async {
  final baseUrl = ref.read(baseUrlProvider);

  final request = AuthRequest(
    api: 'SYNO.API.Auth',
    version: '7',
    method: 'login',
    session: 'webui',
    account: account.account,
    passwd: account.passwd,
    otpCode: null,
    enableSynoToken: 'no',
    ikMessage: null,
    tabid: null,
    logintype: 'local',
    enableDeviceToken: 'no',
    timezone: '+08:00',
    rememberme: '1',
    client: 'browser',
    fid: null,
  );

  final response = await httpClientWrapper.post(
    '$baseUrl/music/webapi/entry.cgi?api=SYNO.API.Auth',
    body: HttpBody.form(
      request.toJson().map(
        (key, value) => MapEntry(key, value?.toString() ?? ''),
      ),
    ),
    headers: HttpHeaders.rawMap({
      'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'x-requested-with': 'XMLHttpRequest',
      'accept': '*/*',
      'accept-language': 'zh-CN,zh;q=0.9',
      'origin': baseUrl,
      'referer': '$baseUrl/music/',
    }),
  );

  if (response.statusCode != 200) {
    Future.microtask(() {
      ref
          .read(audioStationCookiesInfoProvider.notifier)
          .setCookies(
            AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
          );
    });
    throw AudioStationException(
      message: _getLoginErrorMessage(l10n, null),
      statusCode: response.statusCode,
    );
  }

  final jsonBody = jsonDecode(response.body);
  final result = AuthResponse.fromJson(jsonBody);
  logger.i("result:$result");
  if (!result.success) {
    Future.microtask(() {
      ref
          .read(audioStationCookiesInfoProvider.notifier)
          .setCookies(
            AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
          );
    });
    final errorCode = result.error?['code'];
    throw AudioStationException(
      message: _getLoginErrorMessage(l10n, errorCode is int ? errorCode : null),
      statusCode: errorCode is int ? errorCode : null,
    );
  }
  String id = "";
  int idExpires = 0;
  String did = "";
  int didExpires = 0;
  final format = DateFormat("EEE, dd-MMM-yyyy HH:mm:ss zzz", "en_US");

  for (var v in response.headers) {
    var key = v.$1;
    var value = v.$2;

    if (key.toLowerCase() == 'set-cookie') {
      logger.i('收到Set-Cookie头: $value');
      var parts = value.split(';');
      if (parts.length > 2) {
        if (parts[0].startsWith("id=") && parts[1].startsWith("expires=")) {
          id = parts[0].substring(3);
          idExpires = format
              .parse(parts[1].substring(8))
              .millisecondsSinceEpoch;
        } else if (parts[0].startsWith("did=") &&
            parts[1].startsWith("expires=")) {
          did = parts[0].substring(4);
          didExpires = format
              .parse(parts[1].substring(8))
              .millisecondsSinceEpoch;
        }
      }
    }
  }
  Future.microtask(() {
    ref
        .read(audioStationCookiesInfoProvider.notifier)
        .setCookies(
          AudioStationCookies(
            id: id,
            idExpires: idExpires,
            did: did,
            didExpires: didExpires,
          ),
        );

    if (result.data?.synotoken != null) {
      ref.read(authTokenProvider.notifier).setAuthToken(result.data!.synotoken);
    }
  });

  return result;
}

Future<AuthResponse> _refreshToken(
  Ref ref,
  AudioStationCookies cookies,
  AppLocalizations l10n,
) async {
  // 直接使用传入的 serverUrl 构建 baseUrl，而不是通过 ref 获取
  final baseUrl = ref.read(baseUrlProvider);
  logger.d('刷新Token，使用baseUrl: $baseUrl');
  final cookieString = 'did=${cookies.did}; id=${cookies.id}';

  final response = await httpClientWrapper.post(
    '$baseUrl/music/webapi/entry.cgi?api=SYNO.API.Auth',
    body: HttpBody.form({
      'method': 'token',
      'version': '6',
      'updateSynoToken': 'true',
    }),
    headers: HttpHeaders.rawMap({
      'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'x-requested-with': 'XMLHttpRequest',
      'accept': '*/*',
      'accept-language': 'zh-CN,zh;q=0.9',
      'origin': baseUrl,
      'referer': '$baseUrl/music/',
      'Cookie': cookieString,
    }),
  );

  if (response.statusCode != 200) {
    // 延迟修改状态，避免在构建过程中修改
    Future.microtask(() {
      ref
          .read(audioStationCookiesInfoProvider.notifier)
          .setCookies(
            AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
          );
    });
    throw AudioStationException(
      message: _getLoginErrorMessage(l10n, null),
      statusCode: response.statusCode,
    );
  }

  final jsonBody = jsonDecode(response.body);
  final result = AuthResponse.fromJson(jsonBody);

  if (!result.success) {
    // 延迟修改状态，避免在构建过程中修改
    Future.microtask(() {
      ref
          .read(audioStationCookiesInfoProvider.notifier)
          .setCookies(
            AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
          );
    });
    final errorCode = result.error?['code'];
    throw AudioStationException(
      message: _getLoginErrorMessage(l10n, errorCode is int ? errorCode : null),
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  return result;
}

Future<AuthResponse> _refreshTokenWithWidgetRef(
  WidgetRef ref,
  AudioStationCookies cookies,
  AppLocalizations l10n,
) async {
  final baseUrl = ref.read(baseUrlProvider);
  logger.d('刷新Token，使用baseUrl: $baseUrl');
  final cookieString = 'did=${cookies.did}; id=${cookies.id}';

  final response = await httpClientWrapper.post(
    '$baseUrl/music/webapi/entry.cgi?api=SYNO.API.Auth',
    body: HttpBody.form({
      'method': 'token',
      'version': '6',
      'updateSynoToken': 'true',
    }),
    headers: HttpHeaders.rawMap({
      'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'x-requested-with': 'XMLHttpRequest',
      'accept': '*/*',
      'accept-language': 'zh-CN,zh;q=0.9',
      'origin': baseUrl,
      'referer': '$baseUrl/music/',
      'Cookie': cookieString,
    }),
  );

  if (response.statusCode != 200) {
    Future.microtask(() {
      ref
          .read(audioStationCookiesInfoProvider.notifier)
          .setCookies(
            AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
          );
    });
    throw AudioStationException(
      message: _getLoginErrorMessage(l10n, null),
      statusCode: response.statusCode,
    );
  }

  final jsonBody = jsonDecode(response.body);
  final result = AuthResponse.fromJson(jsonBody);

  if (!result.success) {
    Future.microtask(() {
      ref
          .read(audioStationCookiesInfoProvider.notifier)
          .setCookies(
            AudioStationCookies(id: '', idExpires: 0, did: '', didExpires: 0),
          );
    });
    final errorCode = result.error?['code'];
    throw AudioStationException(
      message: _getLoginErrorMessage(l10n, errorCode is int ? errorCode : null),
      statusCode: errorCode is int ? errorCode : null,
    );
  }

  Future.microtask(() {
    if (result.data?.synotoken != null) {
      ref.read(authTokenProvider.notifier).setAuthToken(result.data!.synotoken);
    }
  });

  return result;
}
