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

    final coverUrl = await ref.read(
      coverUrlProvider(
        albumName: track.album,
        albumArtistName: track.artist,
      ).future,
    );

    Uint8List? imageBytes;
    if (coverUrl.isNotEmpty) {
      imageBytes = await getCoverBytes(ref, coverUrl);
    }

    final metadata = track.toMetadata(
      fileLength: fileLength,
      imageBytes: imageBytes,
    );

    await MetadataGod.writeMetadata(file: cachePath, metadata: metadata);
    logger.i(
      '[Metadata] Wrote metadata to $cachePath,title:${track.title},artist:${track.artist},album:${track.album}',
    );
  } catch (e, stack) {
    logger.e(
      '[Metadata] Failed to write metadata',
      error: e,
      stackTrace: stack,
    );
  }
}

Future<Uint8List?> getCoverBytes(Ref ref, String coverUrl) async {
  try {
    final coverCacheDir = await getMusicCacheDir();
    final coverCachePath = '$coverCacheDir/covers';
    final coverCacheDir2 = Directory(coverCachePath);
    if (!await coverCacheDir2.exists()) {
      await coverCacheDir2.create(recursive: true);
    }

    final cacheKey = coverUrl.hashCode.toString();
    final cacheFile = File('$coverCachePath/$cacheKey');

    if (await cacheFile.exists()) {
      return await cacheFile.readAsBytes();
    }

    final authHeaders = await ref.read(authHeadersProvider.future);
    if (authHeaders == null) {
      logger.e('[Metadata] No auth headers');
      return null;
    }

    final response = await downloadHttpClientWrapper.getBytes(
      coverUrl,
      headers: rhttp.HttpHeaders.rawMap({...authHeaders, 'accept': 'image/*'}),
    );

    final bytes = response.body;
    await cacheFile.writeAsBytes(bytes);
    return bytes;
  } catch (e) {
    return null;
  }
}
