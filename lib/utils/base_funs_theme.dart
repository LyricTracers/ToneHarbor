part of 'base_funs.dart';

Future<bool> saveDefaultThemeIcon(WidgetRef ref, List<int> bytes) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final themeDir = Directory('${appDocDir.path}/theme');

  if (!await themeDir.exists()) {
    await themeDir.create(recursive: true);
  }

  final file = File('${themeDir.path}/default_icon.png');

  try {
    await file.writeAsBytes(bytes);
    logger.i('Saved default theme icon to: ${file.path}');

    final prefs = await getSharedPreferences();
    await prefs.setString(defaultThemeIconKey, file.path);

    ref.invalidate(loadDefaultThemeIconProvider);
    return true;
  } catch (e) {
    logger.e('Failed to save default theme icon: $e');
  }

  return false;
}
