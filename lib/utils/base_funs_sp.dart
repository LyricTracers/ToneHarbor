part of 'base_funs.dart';

abstract class SharedPreferencesUtils {
  static SharedPreferences? _sharedPreferences;
  static SharedPreferences get sharedPreferences => _sharedPreferences!;
  static Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
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
      sharedPreferences.getBool(syncSongIconKey) ?? false;

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
        : AudioQuality.high;
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

  static String? getZhipuApiKey() => sharedPreferences.getString(zhipuApiKey);

  static Future<void> setZhipuApiKey(String key) async {
    await sharedPreferences.setString(zhipuApiKey, key);
  }

  static int? getZhipuModel() => sharedPreferences.getInt(zhipuModelKey);

  static Future<void> setZhipuModel(int index) async {
    await sharedPreferences.setInt(zhipuModelKey, index);
  }

  static String? getAICustomModel() =>
      sharedPreferences.getString(aiCustomModelKey);

  static Future<void> setAICustomModel(String model) async {
    await sharedPreferences.setString(aiCustomModelKey, model);
  }

  static String? getZhipuEndpoint() =>
      sharedPreferences.getString(zhipuEndpointKey);

  static Future<void> setZhipuEndpoint(String endpoint) async {
    await sharedPreferences.setString(zhipuEndpointKey, endpoint);
  }

  static double? getZhipuTemperature() =>
      sharedPreferences.getDouble(zhipuTemperatureKey);

  static Future<void> setZhipuTemperature(double temperature) async {
    await sharedPreferences.setDouble(zhipuTemperatureKey, temperature);
  }

  static int? getZhipuTargetLanguage() =>
      sharedPreferences.getInt(zhipuTargetLanguageKey);

  static Future<void> setZhipuTargetLanguage(int index) async {
    await sharedPreferences.setInt(zhipuTargetLanguageKey, index);
  }
}
