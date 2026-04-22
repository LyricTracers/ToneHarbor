import 'dart:async';

import 'package:lyricskit/lyricskit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/lyrics.dart';

part 'lyrics_cache_provider.g.dart';

@riverpod
Future<Lyrics?> getLyrics(
  Ref ref, {
  required String songId,
  String? title,
  String? artist,
}) async {
  return await _requestLyrics(ref, songId, title: title, artist: artist);
}

@keepAlive
Future<Lyrics?> currentLyrics(Ref ref) async {
  final activeTrack = ref.watch(audioPlayerStateProvider).activeTrack;

  if (activeTrack == null) {
    return null;
  }

  final songId = activeTrack.id;
  return await _requestLyrics(
    ref,
    songId,
    title: activeTrack.title,
    artist: activeTrack.artist,
  );
}

Future<Lyrics?> _requestLyrics(
  Ref ref,
  String songId, {
  String? title,
  String? artist,
}) async {
  final cachedLyrics = await lyricCache.get(songId);
  if (cachedLyrics != null) {
    return Lyrics.fromJson(cachedLyrics);
  }
  logger.i('请求歌词，歌曲ID：$songId');
  if (!songId.startsWith("music_")) {
    final lyrics = await getNetLyrics(
      ref: ref,
      id: songId,
      cacheDuration: const Duration(days: 7),
    );
    logger.i('$songId getNetLyrics:：$lyrics');
    if (lyrics != null) {
      await lyricCache.set(songId, lyrics.toJson(), permanent: true);
      return lyrics;
    }
  }
  try {
    final lyricsResponse = await ref
        .read(songCommonProvider.notifier)
        .lyrics(id: songId);

    if (lyricsResponse.success &&
        lyricsResponse.data != null &&
        lyricsResponse.data!.lyrics.isNotEmpty) {
      final lyricsString = lyricsResponse.data!.lyrics;

      final lyrics = Lyrics.fromString(lyricsString);
      if (lyrics != null) {
        await lyricCache.set(songId, lyrics.toJson(), permanent: true);
      }
      return lyrics;
    }
  } catch (e) {
    // ignore
  }
  if (title != null) {
    try {
      final searchTerm = SearchTerm(title: title, artist: artist);
      final searchResults = await ref
          .read(
            combinedSearchProvider(
              searchTerm,
              sorted: true,
              baseProviderType: {
                LyricsProviderType.netEase,
                LyricsProviderType.qqMusicV4,
              },
            ).future,
          )
          .timeout(const Duration(seconds: 10));

      if (searchResults.isNotEmpty) {
        final lyrics = searchResults.first;
        await lyricCache.set(songId, lyrics.toJson(), permanent: true);
        return lyrics;
      }
    } on TimeoutException {
      // ignore
    } catch (e) {
      // ignore
    }
  }

  return null;
}
