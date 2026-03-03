part of 'base_funs.dart';

SharedPreferences? _sharedPreferences;

Future<SharedPreferences> getSharedPreferences() async {
  _sharedPreferences ??= await SharedPreferences.getInstance();
  return _sharedPreferences!;
}

Future<double> getTrayFontSize() async {
  final prefs = await getSharedPreferences();
  final savedSize = prefs.getDouble(trayFontSizeKey);
  return savedSize?.clamp(12.0, 15.0) ?? 14.0;
}

Future<DynamicSchemeVariant> getDynamicSchemeVariant() async {
  final prefs = await getSharedPreferences();
  final savedValue = prefs.getInt(dynamicSchemeKey);
  final result = savedValue != null
      ? DynamicSchemeVariant.values[savedValue]
      : DynamicSchemeVariant.fruitSalad;
  return result;
}

Future<double> getContrastLevel() async {
  final prefs = await getSharedPreferences();
  final savedValue = prefs.getDouble(contrastLevelKey);
  final result = savedValue != null
      ? savedValue.toDouble().clamp(-1.0, 1.0)
      : 0.0;
  return result;
}

Future<bool> getSyncSongIcon() async {
  final prefs = await getSharedPreferences();
  final savedValue = prefs.getBool(syncSongIconKey);
  return savedValue ?? true;
}

Future<bool> getUseHttp() async {
  final prefs = await getSharedPreferences();
  final useHttp = prefs.getBool(useHttpKey);
  return useHttp ?? true;
}
