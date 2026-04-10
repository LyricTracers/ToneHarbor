import 'dart:io';
import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:rhttp/rhttp.dart' as rhttp;
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';

Future<void> writeTrackMetadata({
  required Ref ref,
  required ToneHarborTrackObject track,
  required String cachePath,
  required int fileLength,
}) async {
  try {
    if (track.container.toLowerCase() == 'weba' ||
        track.container.toLowerCase() == 'webm') {
      return;
    }
    String coverUrl;
    String fileName;
    if (track.isCloudMusic) {
      final cloudTrack = track as ToneHarborTrackObjectCloudMusic;
      coverUrl = cloudTrack.coverUrl ?? '';
      fileName = 'cloud_cover_${coverUrl.hashCode}';
      logger.i(
        '[Metadata] Cloud track cover URL: $coverUrl, fileName: $fileName,track.isCloudMusic: ${track.isCloudMusic}',
      );
    } else if (track.id.isEmpty) {
      coverUrl = await ref.read(
        coverUrlByAlbumProvider(
          albumName: track.album,
          albumArtistName: track.artist,
        ).future,
      );
      fileName = sanitizeCacheKey('${track.artist}-${track.album}');
    } else {
      coverUrl = await ref.read(
        coverUrlBySongIdProvider(songId: track.id).future,
      );
      fileName = track.id;
    }

    Uint8List? imageBytes;
    if (coverUrl.isNotEmpty) {
      logger.i(
        '[Metadata] Downloading2222 cover: $coverUrl, fileName: $fileName,track.isCloudMusic: ${track.isCloudMusic}',
      );
      imageBytes = await getCoverBytes(
        ref,
        coverUrl,
        fileName,
        isCloudMusic: track.isCloudMusic,
      );
    }
    logger.i('[Metadata] Downloaded cover: imageBytes:${imageBytes?.length}');

    final metadata = track.toMetadata(
      fileLength: fileLength,
      imageBytes: imageBytes,
    );

    if (metadata == null) {
      logger.w(
        '[Metadata] Track type does not support metadata: ${track.runtimeType}',
      );
      return;
    }

    await MetadataGod.writeMetadata(file: cachePath, metadata: metadata);
    logger.i(
      '[Metadata] Wrote metadata to $cachePath,title:${track.title},artist:${track.artist},album:${track.album}',
    );
  } catch (e, stack) {
    logger.e(
      '[Metadata] Failed to write metadata to $cachePath,title:${track.title},artist:${track.artist},album:${track.album}',
      error: e,
      stackTrace: stack,
    );
  }
}

Future<Uint8List?> getCoverBytes(
  Ref ref,
  String coverUrl,
  String fileName, {
  bool isCloudMusic = false,
}) async {
  try {
    final coverCacheDir = await getCoverCacheDir();
    final coverDir = Directory(coverCacheDir);
    if (!await coverDir.exists()) {
      await coverDir.create(recursive: true);
    }
    final cacheFile = File('$coverCacheDir/$fileName');

    if (await cacheFile.exists()) {
      return await cacheFile.readAsBytes();
    }
    rhttp.HttpHeaders? headers;
    if (!isCloudMusic) {
      final authHeaders = await ref.read(authHeadersProvider.future);
      if (authHeaders == null) {
        logger.w('[Metadata] No auth headers, skipping cover download');
        return null;
      }
      headers = rhttp.HttpHeaders.rawMap({...authHeaders, 'accept': 'image/*'});
    }
    final response = await coverDownloadHttpClientWrapper.getBytes(
      coverUrl,
      headers: headers,
    );

    final bytes = response.body;
    await cacheFile.writeAsBytes(bytes);
    logger.i(
      '[Metadata] Cached cover: $cacheFile/$fileName,size:${bytes.length}',
    );
    return bytes;
  } catch (e) {
    logger.w('[Metadata] Failed to get cover bytes: coverUrl:$coverUrl');
    return null;
  }
}
