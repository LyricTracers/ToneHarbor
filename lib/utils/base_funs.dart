import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/misc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider/path_provider.dart' as paths;
import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/consts.dart';
import 'package:open_file/open_file.dart';
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

void showSnackBar(String text, BuildContext context, Color color) {
  if (text.isEmpty) {
    return;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, size: 20),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
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
  return SizedBox(
    child: Center(
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
  );
}

Future<String> getMusicCacheDir(AudioQuality quality) async {
  String subDir;
  subDir = quality.name;
  if (Platform.isAndroid) {
    final dir = await paths.getExternalCacheDirectories().then(
      (dirs) => dirs!.first,
    );
    final cacheDir = Directory(join(dir.path, 'Cached Tracks', subDir));
    if (!await cacheDir.exists()) {
      await cacheDir.create(recursive: true);
    }
    return cacheDir.path;
  }

  final dir = await paths.getApplicationCacheDirectory();
  final cacheDir = Directory(join(dir.path, 'cached_tracks', subDir));
  if (!await cacheDir.exists()) {
    await cacheDir.create(recursive: true);
  }
  return cacheDir.path;
}

Future<String> getCoverCacheDir() async {
  if (Platform.isAndroid) {
    final dir = await paths.getExternalCacheDirectories().then(
      (dirs) => dirs!.first,
    );
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return join(dir.path, 'Cached Covers');
  }

  final dir = await paths.getApplicationCacheDirectory();
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

Future<String> getTrackCachePath(
  ToneHarborTrackObject track,
  AudioQuality quality,
) async {
  final cacheDir = await getMusicCacheDir(quality);
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
  final cachePath = await getTrackCachePath(track, quality);
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
