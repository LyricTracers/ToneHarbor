import 'dart:io';
import 'dart:typed_data';

import 'package:archive_gbk/archive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rhttp/rhttp.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'download_provider.g.dart';

@riverpod
Future<String> streamUrl(
  Ref ref, {
  required String id,
  AudioQuality? quality,
  String? container,
}) async {
  final cookiesInfo = ref.read(audioStationCookiesInfoProvider);
  if (cookiesInfo == null || !cookiesInfo.isValid) {
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return "";
  }

  final baseUrl = await ref.read(baseUrlProvider.future);
  final synotoken = ref.read(synoTokenProvider);
  quality ??= ref.read(audioQualityProvider);

  final queryParams = <String, String>{
    'api': 'SYNO.AudioStation.Stream',
    'version': '1',
    'id': id,
    'method': quality!.method,
    '_sid': cookiesInfo.id,
    'SynoToken': synotoken ?? '',
  };

  String fileExtension;
  if (quality.isTranscode) {
    queryParams['format'] = quality.format!;
    queryParams['bitrate'] = quality.bitrate.toString();
    fileExtension = quality.format!;
  } else {
    final format = container ?? 'mp3';
    queryParams['format'] = '.$format';
    fileExtension = format;
  }

  final queryString = queryParams.entries
      .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
      .join('&');

  final streamUrl =
      '$baseUrl/webapi/AudioStation/stream.cgi/0.$fileExtension?$queryString';

  return streamUrl;
}

@riverpod
Future<String> coverUrlBySongId(Ref ref, {required String songId}) async {
  final link = ref.keepAlive();
  try {
    return _getCoverUrlBySongId(ref: ref, songId: songId);
  } finally {
    link.close();
  }
}

@riverpod
Future<String> coverUrlByAlbum(
  Ref ref, {
  required String albumName,
  required String albumArtistName,
  String view = 'album',
  bool outputDefault = true,
  bool isHr = true,
  String library = 'shared',
}) async {
  final link = ref.keepAlive();
  try {
    return _getCoverUrlByAlbum(
      ref: ref,
      albumName: albumName,
      albumArtistName: albumArtistName,
    );
  } finally {
    link.close();
  }
}

Future<String> _getCoverUrlByAlbum({
  required Ref ref,
  required String albumName,
  required String albumArtistName,
  String view = 'album',
  bool outputDefault = true,
  bool isHr = true,
  String library = 'shared',
}) async {
  final baseUrl = await ref.read(baseUrlProvider.future);
  final synotoken = ref.read(synoTokenProvider);
  // final timestamp = DateTime.now().millisecondsSinceEpoch;

  final queryParams = {
    'api': 'SYNO.AudioStation.Cover',
    'output_default': outputDefault.toString(),
    'is_hr': isHr.toString(),
    'version': '3',
    'library': library,
    // '_dc': timestamp.toString(),
    'method': 'getcover',
    'view': view,
    'album_name': albumName,
    'album_artist_name': albumArtistName,
    'SynoToken': synotoken ?? '',
  };

  final queryString = queryParams.entries
      .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
      .join('&');

  final coverUrl = '$baseUrl/music/webapi/AudioStation/cover.cgi?$queryString';
  // logger.i("getcoverUrl:${coverUrl}");

  return coverUrl;
}

Future<String> _getCoverUrlBySongId({
  required Ref ref,
  required String songId,
  String library = 'all',
}) async {
  final baseUrl = await ref.read(baseUrlProvider.future);
  final synotoken = ref.read(synoTokenProvider);

  final queryParams = {
    'api': 'SYNO.AudioStation.Cover',
    'version': '1',
    'library': library,
    'method': 'getsongcover',
    'id': songId,
    'SynoToken': synotoken ?? '',
  };

  final queryString = queryParams.entries
      .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
      .join('&');

  final coverUrl = '$baseUrl/webapi/AudioStation/cover.cgi?$queryString';
  return coverUrl;
}

Future<int> downloadSong({
  required WidgetRef ref,
  required String id,
  AudioQuality quality = AudioQuality.high,
  String? container,
  required String filePath,
  bool resume = true,
}) async {
  final l10n = ref.read(l10nProvider);

  final streamUrl = await ref.read(
    streamUrlProvider(id: id, quality: quality, container: container).future,
  );
  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return 0;
  }

  final file = File(filePath);
  int existingBytes = 0;

  if (resume && await file.exists()) {
    existingBytes = await file.length();
  }

  final rangeHeader = existingBytes > 0 ? 'bytes=$existingBytes-' : 'bytes=0-';

  final response = await downloadHttpClientWrapper.getStream(
    streamUrl,
    headers: HttpHeaders.rawMap({
      ...authHeaders,
      'range': rangeHeader,
      'accept': '*/*',
      'sec-fetch-dest': 'audio',
      'sec-fetch-mode': 'no-cors',
      'sec-fetch-site': 'same-origin',
    }),
  );

  if (response.statusCode != 200 && response.statusCode != 206) {
    throw AudioStationException(
      message: l10n.error_downloadFailedWithCode.replaceFirst(
        '%s',
        response.statusCode.toString(),
      ),
      statusCode: response.statusCode,
    );
  }

  final sink = file.openWrite(
    mode: existingBytes > 0 ? FileMode.append : FileMode.write,
  );

  var totalBytes = existingBytes;
  await for (final chunk in response.body) {
    sink.add(chunk);
    totalBytes += chunk.length;
  }

  await sink.close();
  return totalBytes;
}

Future<Uint8List> downloadCover({
  required WidgetRef ref,
  required String albumName,
  required String albumArtistName,
  String view = 'album',
  bool outputDefault = true,
  bool isHr = true,
  String library = 'shared',
}) async {
  final l10n = ref.read(l10nProvider);

  final coverUrl = await ref.read(
    coverUrlByAlbumProvider(
      albumName: albumName,
      albumArtistName: albumArtistName,
      view: view,
      outputDefault: outputDefault,
      isHr: isHr,
      library: library,
    ).future,
  );

  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return Uint8List(0);
  }

  final response = await downloadHttpClientWrapper.getStream(
    coverUrl,
    headers: HttpHeaders.rawMap({
      ...authHeaders,
      'accept': 'image/*',
      'sec-fetch-dest': 'image',
      'sec-fetch-mode': 'no-cors',
      'sec-fetch-site': 'same-origin',
    }),
  );

  if (response.statusCode != 200 && response.statusCode != 206) {
    throw AudioStationException(
      message: l10n.error_downloadCoverFailedWithCode.replaceFirst(
        '%s',
        response.statusCode.toString(),
      ),
      statusCode: response.statusCode,
    );
  }

  final bytesBuilder = BytesBuilder();
  await for (final chunk in response.body) {
    bytesBuilder.add(chunk);
  }

  return bytesBuilder.toBytes();
}

Future<List<String>> batchDownloadSongs({
  required WidgetRef ref,
  required List<String> songIds,
  String library = 'shared',
  required String directoryPath,
  bool autoExtract = true,
}) async {
  final l10n = ref.read(l10nProvider);

  if (songIds.isEmpty) {
    throw AudioStationException(message: l10n.error_songListEmpty);
  }

  final authHeaders = await ref.read(authHeadersProvider.future);
  if (authHeaders == null) {
    Future.microtask(() async {
      await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
      ref.invalidate(authTokenProvider);
    });
    return [];
  }

  final baseUrl = await ref.read(baseUrlProvider.future);
  final defaultFilename = '${songIds.first}_batch_download.zip';

  final request = BatchDownloadRequest(
    api: 'SYNO.AudioStation.Download',
    method: 'download',
    version: '1',
    songs: songIds.join(','),
    library: library,
    filename: '',
  );

  final encodedFilename = Uri.encodeComponent(defaultFilename);
  final downloadUrl =
      '$baseUrl/music/webapi/AudioStation/download.cgi/$encodedFilename';

  final response = await downloadHttpClientWrapper.getStream(
    downloadUrl,
    query: request.toJson().map(
      (key, value) => MapEntry(key, value?.toString() ?? ''),
    ),
    headers: HttpHeaders.rawMap({
      ...authHeaders,
      'accept': '*/*',
      'sec-fetch-dest': 'document',
      'sec-fetch-mode': 'navigate',
      'sec-fetch-site': 'same-origin',
    }),
  );

  if (response.statusCode != 200 && response.statusCode != 206) {
    throw AudioStationException(
      message: l10n.error_batchDownloadFailedWithCode.replaceFirst(
        '%s',
        response.statusCode.toString(),
      ),
      statusCode: response.statusCode,
    );
  }

  final zipFilePath = '$directoryPath/$defaultFilename';
  final file = File(zipFilePath);
  final sink = file.openWrite();

  await for (final chunk in response.body) {
    sink.add(chunk);
  }

  await sink.close();

  if (autoExtract) {
    final extractedFiles = await extractZipFile(zipFilePath, directoryPath);
    await file.delete();
    return extractedFiles;
  }

  return [zipFilePath];
}

Future<List<String>> extractZipFile(
  String zipPath,
  String targetDirectory,
) async {
  final bytes = await File(zipPath).readAsBytes();
  final archive = ZipDecoder().decodeBytes(bytes);

  final extractedFiles = <String>[];
  for (final file in archive) {
    var filename = file.name;

    if (file.isFile) {
      final data = file.content as List<int>;

      final filePath = '$targetDirectory/$filename';
      final outputFile = File(filePath);
      await outputFile.create(recursive: true);
      await outputFile.writeAsBytes(data);
      extractedFiles.add(filePath);
    }
  }

  final filesToDelete = extractedFiles
      .where(
        (filePath) => filePath.endsWith('.m3u') || filePath.endsWith('.m3u8'),
      )
      .toList();

  for (final fileToDelete in filesToDelete) {
    try {
      await File(fileToDelete).delete();
      extractedFiles.remove(fileToDelete);
      logger.d('Deleted playlist file: $fileToDelete');
    } catch (e) {
      logger.d('Failed to delete file: $fileToDelete, error: $e');
    }
  }

  return extractedFiles;
}
