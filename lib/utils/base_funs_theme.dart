part of 'base_funs.dart';

Future<bool> saveDefaultThemeIcon(WidgetRef ref) async {
  final iconBase64 = ref.read(songIconBase64Provider);

  if (iconBase64.isEmpty) {
    return false;
  }

  final appDocDir = await getApplicationDocumentsDirectory();
  final themeDir = Directory('${appDocDir.path}/theme');

  if (!await themeDir.exists()) {
    await themeDir.create(recursive: true);
  }

  final file = File('${themeDir.path}/default_icon.png');

  String imageData = iconBase64;
  if (iconBase64.startsWith('data:image/')) {
    final commaIndex = iconBase64.indexOf(',');
    if (commaIndex != -1) {
      imageData = iconBase64.substring(commaIndex + 1);
    } else {
      return false;
    }
  }

  try {
    final bytes = base64Decode(imageData);
    await file.writeAsBytes(bytes);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(defaultThemeIconKey, file.path);
    return true;
  } catch (e) {
    logger.e('Failed to save default theme icon: $e');
  }

  return false;
}

Future<ImageProvider?> _loadDefaultThemeIcon() async {
  final prefs = await SharedPreferences.getInstance();
  final savedPath = prefs.getString(defaultThemeIconKey);

  if (savedPath == null || savedPath.isEmpty) {
    return null;
  }

  try {
    final file = File(savedPath);
    if (!await file.exists()) {
      return null;
    }

    final bytes = await file.readAsBytes();
    return MemoryImage(bytes);
  } catch (e) {
    logger.e('Failed to load default theme icon: $e');
  }
  return null;
}

ImageProvider? _cachedDefaultThemeIcon;

Future<ImageProvider?> loadDefaultThemeIconWithCache() async {
  if (_cachedDefaultThemeIcon != null) {
    return _cachedDefaultThemeIcon;
  }

  final icon = await _loadDefaultThemeIcon();
  if (icon != null) {
    _cachedDefaultThemeIcon = icon;
  }
  return icon;
}

void clearDefaultThemeIconCache() {
  _cachedDefaultThemeIcon = null;
}
