import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/metadata_utils.dart';

part 'cover_cache_provider.g.dart';

@riverpod
Future<Uint8List?> fetchCoverBytes(
  Ref ref, {
  required String songId,
  required String albumName,
  required String artistName,
  required String key,
  Duration? liveKeepDuration,
}) async {
  final link = ref.keepAliveFor(liveKeepDuration);
  try {
    String coverUrl;
    if (songId.isEmpty) {
      if (albumName.isEmpty && artistName.isNotEmpty) {
        coverUrl = await ref.read(
          coverUrlByArtistProvider(artistName: artistName).future,
        );
      } else {
        coverUrl = await ref.read(
          coverUrlByAlbumProvider(
            albumName: albumName,
            albumArtistName: artistName,
          ).future,
        );
      }
    } else {
      coverUrl = await ref.read(
        coverUrlBySongIdProvider(songId: songId).future,
      );
    }
    if (coverUrl.isEmpty) {
      return null;
    }

    return await getCoverBytes(ref, coverUrl, key);
  } catch (e) {
    return null;
  } finally {
    if (liveKeepDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<Uint8List?> fetchCloudMusicCoverBytes(
  Ref ref, {
  required String imageUrl,
  required String key,
  Duration? liveKeepDuration,
}) async {
  final link = ref.keepAliveFor(liveKeepDuration);
  try {
    final coverUrl = imageUrl;
    if (coverUrl.isEmpty) {
      return null;
    }
    return await getCoverBytes(ref, coverUrl, key, isCloudMusic: true);
  } catch (e) {
    return null;
  } finally {
    if (liveKeepDuration == null) {
      link.close();
    }
  }
}
