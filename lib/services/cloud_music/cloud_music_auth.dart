import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/utils/base_funs.dart';

class CloudMusicAuth {
  static const String loginUrl = 'https://music.163.com/#/login';
  static const String _successUrlPattern = 'music.163.com';
  static const String _musicUKey = 'MUSIC_U';
  static const String _csrfKey = '__csrf';

  static const List<String> _cloudMusicDomains = [
    'https://music.163.com',
    'https://163.com',
    'https://www.music.163.com',
  ];

  static Future<String?> getCookiesFromWebView() async {
    try {
      final cookieManager = CookieManager.instance();
      final allCookies = <Cookie>[];

      for (final domain in _cloudMusicDomains) {
        try {
          final cookies = await cookieManager.getCookies(url: WebUri(domain));
          allCookies.addAll(cookies);
        } catch (e) {
          logger.d('从 $domain 获取 cookies 失败: $e');
        }
      }

      if (allCookies.isEmpty) {
        return null;
      }

      final cookieMap = <String, String>{};
      for (final cookie in allCookies) {
        if (cookie.name == _musicUKey || cookie.name == _csrfKey) {
          cookieMap[cookie.name] = cookie.value;
          logger.d('从 WebView 获取 cookies: ${cookie.name}=${cookie.value}');
        }
      }

      if (!cookieMap.containsKey(_musicUKey)) {
        return null;
      }

      return cookiesMapToString(cookieMap);
    } catch (e) {
      logger.e('从 WebView 获取云音乐 cookies 失败: $e');
      return null;
    }
  }

  static String? getCookies() {
    try {
      return SharedPreferencesUtils.getCloudMusicCookies();
    } catch (e) {
      logger.e('获取云音乐 cookies 失败: $e');
      return null;
    }
  }

  static Future<void> saveCookies(String cookies) async {
    try {
      final normalizedCookies = normalizeCookies(cookies);
      await SharedPreferencesUtils.setCloudMusicCookies(normalizedCookies);
      logger.i(
        '云音乐 cookies 已保存, MUSIC_U 长度: ${getMusicU(normalizedCookies)?.length ?? 0}',
      );
    } catch (e) {
      logger.e('保存云音乐 cookies 失败: $e');
    }
  }

  static Future<void> clearCookies() async {
    try {
      await SharedPreferencesUtils.clearCloudMusicCookies();
      logger.i('云音乐 cookies 已清除');
    } catch (e) {
      logger.e('清除云音乐 cookies 失败: $e');
    }
  }

  static bool isLoggedIn([String? cookies]) {
    final cookieString =
        cookies ?? SharedPreferencesUtils.getCloudMusicCookies();
    if (cookieString == null || cookieString.isEmpty) return false;
    final musicU = extractCookieValue(cookieString, _musicUKey);
    return musicU != null && musicU.isNotEmpty;
  }

  static String? getMusicU([String? cookies]) {
    final cookieString =
        cookies ?? SharedPreferencesUtils.getCloudMusicCookies();
    if (cookieString == null || cookieString.isEmpty) return null;
    return extractCookieValue(cookieString, _musicUKey);
  }

  static String? getCsrf([String? cookies]) {
    final cookieString =
        cookies ?? SharedPreferencesUtils.getCloudMusicCookies();
    if (cookieString == null || cookieString.isEmpty) return null;
    return extractCookieValue(cookieString, _csrfKey);
  }

  static String? extractCookieValue(String cookies, String key) {
    final targetKey = '$key=';
    var searchStr = cookies;

    if (cookies.contains(';;')) {
      final parts = cookies.split(';;');
      for (final part in parts) {
        final trimmed = part.trim();
        if (trimmed.startsWith(targetKey)) {
          var endIdx = trimmed.indexOf(';');
          return endIdx > 0
              ? trimmed.substring(targetKey.length, endIdx).trim()
              : trimmed.substring(targetKey.length).trim();
        }
      }
    }

    final parts = searchStr.split(';');
    for (final part in parts) {
      final trimmed = part.trim();
      if (trimmed.startsWith(targetKey)) {
        return trimmed.substring(targetKey.length);
      }
    }

    return null;
  }

  static Map<String, String> getApiCookieParams([String? cookies]) {
    final cookieString =
        cookies ?? SharedPreferencesUtils.getCloudMusicCookies();
    if (cookieString == null || cookieString.isEmpty) {
      return {};
    }

    final musicU = getMusicU(cookieString);
    if (musicU == null || musicU.isEmpty) {
      return {};
    }

    return {'cookie': '$_musicUKey=$musicU;'};
  }

  static String? getApiCookieString([String? cookies]) {
    final cookieString =
        cookies ?? SharedPreferencesUtils.getCloudMusicCookies();
    if (cookieString == null || cookieString.isEmpty) {
      return null;
    }

    final musicU = getMusicU(cookieString);
    if (musicU == null || musicU.isEmpty) {
      return null;
    }

    return '$_musicUKey=$musicU;';
  }

  static bool isLoginSuccessUrl(String url) {
    if (!url.contains(_successUrlPattern)) return false;
    if (url.contains('/#/login') || url.contains('/login')) return false;

    final loginPatterns = ['/login', '/register', '/signup'];
    for (final pattern in loginPatterns) {
      if (url.toLowerCase().contains(pattern)) return false;
    }

    return true;
  }

  static String normalizeCookies(String cookies) {
    if (cookies.isEmpty) return '';

    final cookieMap = <String, String>{};

    var separators = [';;', ';'];
    var found = false;
    for (final sep in separators) {
      if (cookies.contains(sep)) {
        found = true;
        final cookieList = cookies
            .split(sep)
            .map((c) => c.trim())
            .where((c) => c.isNotEmpty)
            .toList();

        for (final cookie in cookieList) {
          final eqIndex = cookie.indexOf('=');
          if (eqIndex > 0) {
            final key = cookie.substring(0, eqIndex).trim();
            var value = cookie.substring(eqIndex + 1).trim();

            final semiIndex = value.indexOf(';');
            if (semiIndex > 0) {
              value = value.substring(0, semiIndex).trim();
            }

            if (key.isNotEmpty && value.isNotEmpty) {
              cookieMap[key] = value;
            }
          }
        }
        break;
      }
    }

    if (!found && cookies.contains('=')) {
      final eqIndex = cookies.indexOf('=');
      if (eqIndex > 0) {
        final key = cookies.substring(0, eqIndex).trim();
        var value = cookies.substring(eqIndex + 1).trim();
        final semiIndex = value.indexOf(';');
        if (semiIndex > 0) {
          value = value.substring(0, semiIndex).trim();
        }
        if (key.isNotEmpty && value.isNotEmpty) {
          cookieMap[key] = value;
        }
      }
    }

    final orderedKeys = [_musicUKey, _csrfKey, '__remember_me', 'NMTID'];

    final orderedCookies = <String>[];
    for (final key in orderedKeys) {
      if (cookieMap.containsKey(key)) {
        orderedCookies.add('$key=${cookieMap[key]}');
        cookieMap.remove(key);
      }
    }

    cookieMap.forEach((key, value) {
      orderedCookies.add('$key=$value');
    });

    return orderedCookies.join('; ');
  }

  static Map<String, String> parseCookiesToMap(String cookies) {
    final result = <String, String>{};

    var separators = [';;', ';'];
    for (final sep in separators) {
      if (cookies.contains(sep)) {
        final parts = cookies.split(sep);
        for (final part in parts) {
          final trimmed = part.trim();
          final eqIndex = trimmed.indexOf('=');
          if (eqIndex > 0) {
            var key = trimmed.substring(0, eqIndex).trim();
            var value = trimmed.substring(eqIndex + 1).trim();
            final semiIndex = value.indexOf(';');
            if (semiIndex > 0) {
              value = value.substring(0, semiIndex).trim();
            }
            if (key.isNotEmpty && value.isNotEmpty) {
              result[key] = value;
            }
          }
        }
        break;
      }
    }

    return result;
  }

  static String cookiesMapToString(Map<String, String> cookies) {
    return cookies.entries.map((e) => '${e.key}=${e.value}').join('; ');
  }
}
