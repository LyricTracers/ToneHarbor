part of 'base_funs.dart';

abstract class SharedPreferencesUtils {
  static SharedPreferencesWithCache? _sharedPreferences;
  static SharedPreferencesWithCache get sharedPreferences =>
      _sharedPreferences!;
  static Future<void> initialize() async {
    _sharedPreferences = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
  }

  static double getTrayFontSize() {
    final savedSize = sharedPreferences.getDouble(trayFontSizeKey);
    return savedSize?.clamp(12.0, 15.0) ?? 14.0;
  }

  static Future<void> setTrayFontSize(double size) async {
    await sharedPreferences.setDouble(trayFontSizeKey, size);
  }

  static DynamicSchemeVariant getDynamicSchemeVariant() {
    final savedValue = sharedPreferences.getInt(dynamicSchemeKey);
    final result = savedValue != null
        ? DynamicSchemeVariant.values[savedValue]
        : DynamicSchemeVariant.fruitSalad;
    return result;
  }

  static Future<void> setDynamicSchemeVariant(
    DynamicSchemeVariant scheme,
  ) async {
    await sharedPreferences.setInt(dynamicSchemeKey, scheme.index);
  }

  static double getContrastLevel() {
    final savedValue = sharedPreferences.getDouble(contrastLevelKey);
    final result = savedValue != null
        ? savedValue.toDouble().clamp(-1.0, 1.0)
        : 0.0;
    return result;
  }

  static Future<void> setContrastLevel(double level) async {
    await sharedPreferences.setDouble(contrastLevelKey, level);
  }

  static bool getSyncSongIcon() =>
      sharedPreferences.getBool(syncSongIconKey) ?? true;

  static Future<void> setSyncSongIcon(bool value) async {
    await sharedPreferences.setBool(syncSongIconKey, value);
  }

  static Future<void> setUseHttp(bool value) async {
    await sharedPreferences.setBool(useHttpKey, value);
  }

  static bool getUseHttp() => sharedPreferences.getBool(useHttpKey) ?? true;

  static String getDefaultThemeIcon() =>
      sharedPreferences.getString(defaultThemeIconKey) ?? '';

  static Future<void> setDefaultThemeIcon(String path) async {
    await sharedPreferences.setString(defaultThemeIconKey, path);
  }

  static Locale getLocale() =>
      Locale(sharedPreferences.getString(localeKey) ?? 'zh');

  static Future<void> setLocale(Locale locale) async {
    await sharedPreferences.setString(localeKey, locale.languageCode);
  }

  static List<String> getSearchHistory() =>
      sharedPreferences.getStringList(searchHistoryKey) ?? [];

  static Future<void> setSearchHistory(List<String> history) async {
    await sharedPreferences.setStringList(searchHistoryKey, history);
  }

  static double getVolume() => sharedPreferences.getDouble(volumeKey) ?? 0.5;

  static Future<void> setVolume(double value) async {
    await sharedPreferences.setDouble(volumeKey, value);
  }

  static String getServerUrl() =>
      sharedPreferences.getString(serverUrlKey) ?? '';

  static Future<void> setServerUrl(String value) async {
    await sharedPreferences.setString(serverUrlKey, value);
  }

  static String? getAccount() => sharedPreferences.getString(accountKey);

  static Future<void> setAccount(String value) async {
    await sharedPreferences.setString(accountKey, value);
  }

  static String? getCookie() => sharedPreferences.getString(cookieKey);

  static Future<void> setCookie(String value) async {
    await sharedPreferences.setString(cookieKey, value);
  }

  static AudioQuality getAudioQuality() {
    final savedValue = sharedPreferences.getInt(audioQualityKey);
    return savedValue != null
        ? AudioQuality.values[savedValue]
        : AudioQuality.medium;
  }

  static Future<void> setAudioQuality(AudioQuality quality) async {
    await sharedPreferences.setInt(audioQualityKey, quality.index);
  }

  static LyricsDoubleClickAction getDoubleLyricAction() {
    final savedValue = sharedPreferences.getInt(doubleLyricActionKey);
    return savedValue != null
        ? LyricsDoubleClickAction.values[savedValue]
        : LyricsDoubleClickAction.seek;
  }

  static Future<void> setDoubleLyricAction(
    LyricsDoubleClickAction action,
  ) async {
    await sharedPreferences.setInt(doubleLyricActionKey, action.index);
  }

  static bool getStatusBarLyric() =>
      sharedPreferences.getBool(statusBarKey) ?? true;

  static Future<void> setStatusStatusBarLyric(bool value) async {
    await sharedPreferences.setBool(statusBarKey, value);
  }

  static bool getNormalizeAudio() =>
      sharedPreferences.getBool(normalizeAudioKey) ?? true;

  static Future<void> setNormalizeAudio(bool value) async {
    await sharedPreferences.setBool(normalizeAudioKey, value);
  }

  static int? getServerPort() => sharedPreferences.getInt(serverPortKey);

  static Future<void> setServerPort(int port) async {
    await sharedPreferences.setInt(serverPortKey, port);
  }

  static int? getAIPlatform() => sharedPreferences.getInt(aiPlatformKey);

  static Future<void> setAIPlatform(int index) async {
    await sharedPreferences.setInt(aiPlatformKey, index);
  }

  static String? getAIApiKey() => sharedPreferences.getString(aiApiKeyKey);

  static Future<void> setAIApiKey(String key) async {
    await sharedPreferences.setString(aiApiKeyKey, key);
  }

  static int? getAIModel() => sharedPreferences.getInt(aiModelKey);

  static Future<void> setAIModel(int index) async {
    await sharedPreferences.setInt(aiModelKey, index);
  }

  static String? getAICustomModel() =>
      sharedPreferences.getString(aiCustomModelKey);

  static Future<void> setAICustomModel(String model) async {
    await sharedPreferences.setString(aiCustomModelKey, model);
  }

  static String? getAIEndpoint() => sharedPreferences.getString(aiEndpointKey);

  static Future<void> setAIEndpoint(String endpoint) async {
    await sharedPreferences.setString(aiEndpointKey, endpoint);
  }

  static double? getAITemperature() =>
      sharedPreferences.getDouble(aiTemperatureKey);

  static Future<void> setAITemperature(double temperature) async {
    await sharedPreferences.setDouble(aiTemperatureKey, temperature);
  }

  static int? getAITargetLanguage() =>
      sharedPreferences.getInt(aiTargetLanguageKey);

  static Future<void> setAITargetLanguage(int index) async {
    await sharedPreferences.setInt(aiTargetLanguageKey, index);
  }

  static List<String> getCloudMusicApiUrls() =>
      sharedPreferences.getStringList(cloudMusicApiUrlsKey) ?? [];

  static Future<void> setCloudMusicApiUrls(List<String> urls) async {
    await sharedPreferences.setStringList(cloudMusicApiUrlsKey, urls);
  }

  static String getCloudMusicApiDefaultUrl() =>
      sharedPreferences.getString(cloudMusicApiDefaultUrlKey) ?? '';

  static Future<void> setCloudMusicApiDefaultUrl(String url) async {
    await sharedPreferences.setString(cloudMusicApiDefaultUrlKey, url);
  }

  static bool getUseCloudMusicApiAsHome() =>
      sharedPreferences.getBool(useCloudMusicApiAsHomeKey) ?? true;

  static Future<void> setUseCloudMusicApiAsHome(bool value) async {
    await sharedPreferences.setBool(useCloudMusicApiAsHomeKey, value);
  }

  static int getCloudMusicLanguage() =>
      sharedPreferences.getInt(cloudMusicLanguageKey) ?? 0;

  static Future<void> setCloudMusicLanguage(int value) async {
    await sharedPreferences.setInt(cloudMusicLanguageKey, value);
  }

  static CloudMusicQuality getCloudMusicQuality() {
    final savedValue = sharedPreferences.getInt(cloudMusicQualityKey);
    return CloudMusicQuality.fromIndex(savedValue ?? 2);
  }

  static Future<void> setCloudMusicQuality(CloudMusicQuality quality) async {
    await sharedPreferences.setInt(cloudMusicQualityKey, quality.index);
  }

  static String? getCloudMusicCookies() =>
      sharedPreferences.getString(cloudMusicCookiesKey);

  static Future<void> setCloudMusicCookies(String cookies) async {
    await sharedPreferences.setString(cloudMusicCookiesKey, cookies);
  }

  static Future<void> clearCloudMusicCookies() async {
    await sharedPreferences.remove(cloudMusicCookiesKey);
  }

  static List<String> getCloudMusicCategory() =>
      sharedPreferences.getStringList(cloudMusicCategoryKey) ??
      ['华语', '欧美', '流行', '民谣', '治愈', '影视原声'];

  static Future<void> setCloudMusicCategory(List<String> categories) async {
    await sharedPreferences.setStringList(cloudMusicCategoryKey, categories);
  }

  static bool getAria2Enabled() =>
      sharedPreferences.getBool(aria2EnabledKey) ?? false;

  static Future<void> setAria2Enabled(bool value) async {
    await sharedPreferences.setBool(aria2EnabledKey, value);
  }

  static String getAria2Host() =>
      sharedPreferences.getString(aria2HostKey) ?? 'localhost';

  static Future<void> setAria2Host(String value) async {
    await sharedPreferences.setString(aria2HostKey, value);
  }

  static int getAria2Port() => sharedPreferences.getInt(aria2PortKey) ?? 6800;

  static Future<void> setAria2Port(int value) async {
    await sharedPreferences.setInt(aria2PortKey, value);
  }

  static String? getAria2Secret() =>
      sharedPreferences.getString(aria2SecretKey);

  static Future<void> setAria2Secret(String? value) async {
    if (value == null || value.isEmpty) {
      await sharedPreferences.remove(aria2SecretKey);
    } else {
      await sharedPreferences.setString(aria2SecretKey, value);
    }
  }

  static bool getAria2UseHttps() =>
      sharedPreferences.getBool(aria2UseHttpsKey) ?? false;

  static Future<void> setAria2UseHttps(bool value) async {
    await sharedPreferences.setBool(aria2UseHttpsKey, value);
  }

  static String? getAria2DownloadDir() =>
      sharedPreferences.getString(aria2DownloadDirKey);

  static Future<void> setAria2DownloadDir(String? value) async {
    if (value == null) {
      await sharedPreferences.remove(aria2DownloadDirKey);
    } else {
      await sharedPreferences.setString(aria2DownloadDirKey, value);
    }
  }

  // QuickConnect settings
  static String? getRemoteBaseUrl() =>
      sharedPreferences.getString(remoteBaseUrlKey);

  static Future<void> setRemoteBaseUrl(String? value) async {
    if (value == null || value.isEmpty) {
      await sharedPreferences.remove(remoteBaseUrlKey);
    } else {
      await sharedPreferences.setString(remoteBaseUrlKey, value);
    }
  }

  static String? getLocalBaseUrl() =>
      sharedPreferences.getString(localBaseUrlKey);

  static Future<void> setLocalBaseUrl(String? value) async {
    if (value == null || value.isEmpty) {
      await sharedPreferences.remove(localBaseUrlKey);
    } else {
      await sharedPreferences.setString(localBaseUrlKey, value);
    }
  }

  static bool getUseLANIP() => sharedPreferences.getBool(useLANIPKey) ?? false;

  static Future<void> setUseLANIP(bool value) async {
    await sharedPreferences.setBool(useLANIPKey, value);
  }
}
