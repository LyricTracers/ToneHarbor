import 'dart:io';
import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'cover_cache_provider.g.dart';

@riverpod
Future<Uint8List?> fetchCoverBytes(
  Ref ref, {
  required String url,
  required String key,
}) async {
  try {
    final coverCacheDir = await getCoverCacheDir();
    final coverDir = Directory(coverCacheDir);
    if (!await coverDir.exists()) {
      await coverDir.create(recursive: true);
    }
    final cacheFile = File('$coverCacheDir/$key');

    if (await cacheFile.exists()) {
      return await cacheFile.readAsBytes();
    }

    final response = await downloadHttpClientWrapper.getBytes(url);

    final bytes = response.body;
    return bytes;
  } catch (e) {
    logger.w('[CoverCache] Failed to get cover bytes: url:$url');
    return null;
  }
}
