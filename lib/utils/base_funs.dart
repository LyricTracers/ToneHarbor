import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/misc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:open_file/open_file.dart';
import 'package:tray_manager/tray_manager.dart';
part 'base_funs_sp.dart';
part 'base_funs_theme.dart';

extension CancelTokenX on Ref {
  CancelToken cancelToken() {
    final cancelToken = CancelToken();
    onDispose(() {
      cancelToken.cancel();
    });
    return cancelToken;
  }

  KeepAliveLink keepAliveFor(Duration? duration) {
    final link = this.keepAlive();
    if (duration != null) {
      final timer = Timer(duration, () {
        if (mounted) {
          link.close();
        }
      });
      onDispose(() {
        timer.cancel();
      });
    }
    return link;
  }
}

T getValueWhenReadyWithWidgetRef<T>(
  WidgetRef ref,
  ProviderListenable<AsyncValue<T>> provider,
  T defaultValue,
) {
  final asyncValue = ref.watch(provider);
  return asyncValue.when(
    data: (value) => value,
    loading: () => defaultValue,
    error: (_, __) => defaultValue,
  );
}

T getValueWhenReadyWithRef<T>(
  Ref ref,
  ProviderListenable<AsyncValue<T>> provider,
  T defaultValue,
) {
  final asyncValue = ref.watch(provider);
  return asyncValue.when(
    data: (value) => value,
    loading: () => defaultValue,
    error: (_, __) => defaultValue,
  );
}

ColorScheme getColorSchemeWhenReady(WidgetRef ref) {
  return getValueWhenReadyWithWidgetRef(
    ref,
    getColorSchemeProvider,
    defaultColorScheme,
  );
}

void showSnackBarError(Object e, BuildContext context, Color color) {
  if (e is AudioStationException) {
    showSnackBar(e.message, context, color);
  } else if (e is Exception) {
    showSnackBar(e.toString(), context, color);
  }
}

void showSnackBar(String text, BuildContext context, Color color) {
  if (text.isEmpty) return;
  if (!context.mounted) return;

  try {
    Overlay.of(context);
  } catch (e) {
    return;
  }

  FToast()
      .init(context)
      .showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        gravity: ToastGravity.BOTTOM,
      );
}

OverlayEntry? _loadingEntry;

void showLoading(BuildContext context, Widget child) {
  hideLoading();
  final overlay = Overlay.of(context);
  final entry = OverlayEntry(
    builder: (context) => Stack(
      children: [
        ModalBarrier(color: Colors.black38, dismissible: false),
        Center(
          child: Material(color: Colors.transparent, child: child),
        ),
      ],
    ),
  );
  _loadingEntry = entry;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    overlay.insert(entry);
  });
}

void hideLoading() {
  final entry = _loadingEntry;
  _loadingEntry = null;
  if (entry != null) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (entry.mounted) {
        entry.remove();
      }
    });
  }
}

void copyToClipboard(String text, BuildContext context, Color color) {
  if (text.isEmpty) {
    return;
  }
  Clipboard.setData(ClipboardData(text: text));
  showSnackBar(
    '${AppLocalizations.of(context)!.has_copy} $text',
    context,
    color,
  );
}

bool isValidServerUrl(String url) {
  final ipPortPattern = RegExp(r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d{1,5}$');
  final domainPortPattern = RegExp(
    r'^[a-zA-Z0-9][a-zA-Z0-9\-\.]+\.[a-zA-Z0-9\-]+:\d{1,5}$',
  );
  final localhostPattern = RegExp(r'^localhost:\d{1,5}$');

  return ipPortPattern.hasMatch(url) ||
      domainPortPattern.hasMatch(url) ||
      localhostPattern.hasMatch(url);
}

Map<String, dynamic> parseJsonResponse(String body) {
  try {
    return json.decode(body) as Map<String, dynamic>;
  } catch (e) {
    try {
      final decoded = json.decode(body);
      if (decoded is String) {
        return json.decode(decoded) as Map<String, dynamic>;
      }
      throw Exception('Unable to parse response: $body');
    } catch (e2) {
      throw Exception('Unable to parse response: $body');
    }
  }
}

String getAudioReuqestErrorMessage(
  AppLocalizations l10n,
  String defaultMessage,
  int? errorCode,
) {
  switch (errorCode) {
    case 100:
      return l10n.error_syno_request_100;
    case 101:
      return l10n.error_syno_request_101;
    case 102:
      return l10n.error_syno_request_102;
    case 103:
      return l10n.error_syno_request_103;
    case 104:
      return l10n.error_syno_request_104;
    case 105:
      return l10n.error_syno_request_105;
    case 106:
      return l10n.error_syno_request_106;
    case 114:
      return l10n.error_syno_request_114;
    case 150:
      return l10n.error_syno_request_150;
    default:
      return defaultMessage;
  }
}

Future<T?> getFromCache<T>({
  required String cacheKey,
  required String group,
  required T Function(Map<String, dynamic> json) fromJson,
}) async {
  try {
    final cachedJson = await audioStationRequestCache.get(cacheKey);
    if (cachedJson != null) {
      logger.i('cacheKey: $cacheKey 从缓存读取数据');
      return fromJson(cachedJson);
    }
  } catch (e) {
    logger.w('cacheKey: $cacheKey 读取缓存失败: $e');
  }
  return null;
}

Future<void> clearCacheByGroupKey({required String groupKey}) async {
  try {
    await audioStationRequestCache.clearGroup(groupKey);
    logger.d('groupKey: $groupKey 缓存已清除');
  } catch (e) {
    logger.w('groupKey: $groupKey 清除缓存失败: $e');
  }
}

Future<void> saveToCache({
  required String cacheKey,
  required Map<String, dynamic> jsonBody,
  required Duration cacheDuration,
  required String group,
}) async {
  try {
    await audioStationRequestCache.set(
      cacheKey,
      jsonBody,
      duration: cacheDuration,
      group: group,
    );
    logger.d('cacheKey: $cacheKey的数据已缓存');
  } catch (e) {
    logger.w('cacheKey: $cacheKey 缓存数据失败: $e');
  }
}

Widget buildErrorView(
  BuildContext context,
  WidgetRef ref,
  ColorScheme colorScheme,
  Function() onTap,
) {
  return Expanded(
    child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                loadingErrorIcon,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurface.withValues(alpha: 0.5),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

String? _musicCacheBaseDir;

Future<void> initMusicCacheBaseDir() async {
  if (Platform.isAndroid) {
    final dirs = await getExternalCacheDirectories();
    _musicCacheBaseDir = join(dirs!.first.path, 'Cached Tracks');
  } else {
    final dir = await getApplicationSupportDirectory();
    _musicCacheBaseDir = join(dir.path, 'cached_tracks');
  }
}

String getMusicCacheDirSync(AudioQuality quality) {
  if (_musicCacheBaseDir == null) {
    throw StateError(
      'Music cache base dir not initialized. Call initMusicCacheBaseDir() first.',
    );
  }
  return join(_musicCacheBaseDir!, quality.name);
}

Future<String> getLogFilePath() async {
  var targetDir = await getApplicationCacheDirectory();
  return '${targetDir.path}/audio_station.log';
}

Future<String> getMusicCacheDir(AudioQuality quality) async {
  String subDir;
  subDir = quality.name;
  if (Platform.isAndroid) {
    final dir = await getExternalCacheDirectories().then((dirs) => dirs!.first);
    final cacheDir = Directory(join(dir.path, 'Cached Tracks', subDir));
    if (!await cacheDir.exists()) {
      await cacheDir.create(recursive: true);
    }
    return cacheDir.path;
  }

  final dir = await getApplicationSupportDirectory();
  final cacheDir = Directory(join(dir.path, 'cached_tracks', subDir));
  if (!await cacheDir.exists()) {
    await cacheDir.create(recursive: true);
  }
  return cacheDir.path;
}

Future<String> getCoverCacheDir() async {
  if (Platform.isAndroid) {
    final dir = await getExternalCacheDirectories().then((dirs) => dirs!.first);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return join(dir.path, 'Cached Covers');
  }

  final dir = await getApplicationSupportDirectory();
  return join(dir.path, 'cached_covers');
}

Future<void> openCacheFolder() async {
  try {
    final filePath = await getMusicCacheDir(
      SharedPreferencesUtils.getAudioQuality(),
    );

    await OpenFile.open(filePath);
  } catch (e, stack) {
    logger.e('打开缓存文件夹失败: $e, $stack');
  }
}

String getTrackCachePath(ToneHarborTrackObject track, AudioQuality quality) {
  final cacheDir = getMusicCacheDirSync(quality);
  final extension = quality.isTranscode ? 'mp3' : track.container;
  var fileName = "${track.title}_${track.id}";
  if (track.artist.isNotEmpty) {
    fileName = "${track.artist}_$fileName";
  }
  fileName = sanitizeFilename(fileName, track.id);
  return '$cacheDir/$fileName.$extension';
}

Future<bool> isTrackCached(
  ToneHarborTrackObject track,
  AudioQuality quality,
) async {
  final cachePath = getTrackCachePath(track, quality);
  return File(cachePath).exists();
}

String sanitizeCacheKey(String key) {
  return key.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
}

String sanitizeFilename(String input, String id, {String replacement = ''}) {
  final result = input
      // illegalRe
      .replaceAll(RegExp(r'[\/\?<>\\:\*\|"]'), replacement)
      // controlRe
      .replaceAll(RegExp(r'[\x00-\x1f\x80-\x9f]'), replacement)
      // reservedRe
      .replaceFirst(RegExp(r'^\.+$'), replacement)
      // windowsReservedRe
      .replaceFirst(
        RegExp(
          r'^(con|prn|aux|nul|com[0-9]|lpt[0-9])(\..*)?$',
          caseSensitive: false,
        ),
        replacement.isEmpty ? '_' : replacement,
      )
      // windowsTrailingRe
      .replaceFirst(RegExp(r'[\. ]+$'), replacement);
  if (result.length > 255) {
    return id;
  }
  return result;
}

String generateTrackFilename(String title, String artist, String id) {
  var fileName = "${title}_$id";
  if (artist.isNotEmpty) {
    fileName = "${artist}_$fileName";
  }
  return sanitizeFilename(fileName, id);
}

String buildTrackPath(String filename, String container, AudioQuality quality) {
  try {
    final cacheDir = getMusicCacheDirSync(quality);
    final extension = quality.isTranscode ? 'mp3' : container;
    return '$cacheDir/$filename.$extension';
  } catch (e) {
    return '';
  }
}

void showCreatePlaylistDialog(
  WidgetRef ref,
  TextEditingController controller,
  ColorScheme colorScheme,
  void Function(String name) onCreated,
) async {
  var i10n = ref.read(l10nProvider);
  showDialog(
    context: ref.context,
    builder: (context) => AlertDialog(
      title: Text(
        i10n.create_playlist,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: i10n.input_playlist_name,
          labelText: i10n.playlist_name,
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.playlist_add),
        ),
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            controller.text = "";
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.cancel),
          label: Text(i10n.cancel),
        ),
        ElevatedButton.icon(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              onCreated(controller.text);
            }
            controller.text = "";
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.playlist_add),
          label: Text(i10n.create_playlist),
        ),
      ],
    ),
  );
}

void showDeletePlaylistDialog(
  WidgetRef ref,
  String name,
  String id,
  ColorScheme colorScheme,
  void Function(String id) ondelete,
) {
  var i10n = ref.read(l10nProvider);
  showDialog(
    context: ref.context,
    builder: (context) => AlertDialog(
      title: Text(
        i10n.delete_playlist,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: Text(i10n.ask_delete_playlist.replaceFirst("%s", name)),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          label: Text(i10n.cancel),
        ),
        ElevatedButton.icon(
          onPressed: () {
            ondelete(id);
            Navigator.of(context).pop();
          },
          label: Text("确定"),
        ),
      ],
    ),
  );
}

Future<void> loadMore<T>({
  required WidgetRef ref,
  required ValueNotifier<bool> isLoadingMore,
  required $AsyncNotifierProvider<ExtraProvider<T>, T> baseProvider,
}) async {
  isLoadingMore.value = true;
  try {
    await ref.read(baseProvider.notifier).loadMore();
  } finally {
    isLoadingMore.value = false;
  }
}

Future<T?> showCustomMenu<T>({
  required BuildContext context,
  required Offset globalPosition,
  required List<PopupMenuEntry<T>> items,
  bool useRootNavigator = true,
}) {
  final navigator = Navigator.of(context, rootNavigator: useRootNavigator);
  final overlay = navigator.overlay!;
  final overlayContext = overlay.context;
  final overlayRenderBox = overlayContext.findRenderObject() as RenderBox;

  final localPosition = overlayRenderBox.globalToLocal(globalPosition);

  final left = localPosition.dx;
  final top = localPosition.dy;

  return showMenu<T>(
    context: context,
    positionBuilder: (BuildContext _, BoxConstraints constraints) {
      return RelativeRect.fromRect(
        Rect.fromLTWH(left, top, 0, 0),
        Offset.zero & overlayRenderBox.size,
      );
    },
    items: items,
    elevation: 2,
    useRootNavigator: useRootNavigator,
  );
}

Future<void> switchIconWithLabel(
  bool isDarkTheme,
  bool statusBar, {
  String? label,
}) async {
  if (statusBar) {
    trayManager.setIcon(
      isDarkTheme ? statusBarIconDark : statusBarIcon,
      iconPosition: TrayIconPosition.right,
    );
  } else {
    await trayManager.setMarqueeLabel(label ?? '拾音坞');
    await trayManager.setMarqueeTextColor(isDarkTheme ? "#FFFFFF" : "#000000");
  }
}

void setDemuxerBufferSize(AudioQuality quality) {
  if (quality == AudioQuality.original) {
    audioPlayer.setDemuxerBufferSize(1024 * 1024 * 10);
  } else if (quality == AudioQuality.high) {
    audioPlayer.setDemuxerBufferSize(1024 * 1024 * 4);
  } else {
    audioPlayer.setDemuxerBufferSize(1024 * 1024 * 2);
  }
}

String formatBytes(int bytes) {
  if (bytes < 1024) return '$bytes B';
  if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
  if (bytes < 1024 * 1024 * 1024) {
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
  return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
}

Future<T?> showSlidePanel<T>({
  required BuildContext context,
  required Widget Function(BuildContext context) builder,
  double? width,
  bool barrierDismissible = true,
  Color? barrierColor,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: 'SlidePanel',
    barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.3),
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
                reverseCurve: Curves.easeInCubic,
              ),
            ),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.centerRight,
        child: Material(color: Colors.transparent, child: builder(context)),
      );
    },
  );
}

PopupMenuItem getActionMenuItem(
  Function() onPressed,
  String sortName,
  IconData icon,
) {
  return PopupMenuItem(
    onTap: onPressed,
    child: Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Icon(icon, size: 18),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(sortName),
        ),
      ],
    ),
  );
}

void showModalBottomSheetWidget(
  BuildContext context,
  ColorScheme colorScheme,
  Widget Function(BuildContext context) builder,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: colorScheme.brightness == Brightness.dark
        ? const Color(0xFF2D2D2D)
        : Colors.white,
    builder: (context) => builder(context),
  );
}
