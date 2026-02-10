part of 'base_funs.dart';

Future<double> getTrayFontSize() async {
  final prefs = await SharedPreferences.getInstance();
  final savedSize = prefs.getDouble(trayFontSizeKey);
  return savedSize?.clamp(12.0, 15.0) ?? 14.0;
}

Future<DynamicSchemeVariant> getDynamicSchemeVariant() async {
  final prefs = await SharedPreferences.getInstance();
  final savedValue = prefs.getInt(dynamicSchemeKey);
  final result = savedValue != null
      ? DynamicSchemeVariant.values[savedValue]
      : DynamicSchemeVariant.fruitSalad;
  return result;
}

Future<double> getContrastLevel() async {
  final prefs = await SharedPreferences.getInstance();
  final savedValue = prefs.getDouble(contrastLevelKey);
  final result = savedValue != null
      ? savedValue.toDouble().clamp(-1.0, 1.0)
      : 0.0;
  return result;
}

Future<bool> getSyncSongIcon() async {
  final prefs = await SharedPreferences.getInstance();
  final savedValue = prefs.getBool(syncSongIconKey);
  return savedValue ?? true;
}
