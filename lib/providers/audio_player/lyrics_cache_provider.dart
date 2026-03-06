import 'package:lyricskit/lyricskit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/audio_station/songs_provider.dart';
import 'package:toneharbor/providers/audio_player/audio_player_provider.dart';

part 'lyrics_cache_provider.g.dart';

@keepAlive
Future<Lyrics?> currentLyrics(Ref ref) async {
  final activeTrack = ref.watch(audioPlayerStateProvider).activeTrack;

  if (activeTrack == null) {
    return null;
  }

  final songId = activeTrack.id;
  final cachedLyrics = await lyricCache.get(songId);
  if (cachedLyrics != null) {
    return Lyrics.fromJson(cachedLyrics);
  }

  try {
    final lyricsResponse = await ref.watch(lyricsProvider(id: songId).future);

    if (lyricsResponse.success && lyricsResponse.data != null) {
      final lyricsString = lyricsResponse.data!.lyrics;

      final lyrics = Lyrics.fromString(lyricsString);
      if (lyrics != null) {
        await lyricCache.set(songId, lyrics.toJson(), permanent: true);
      }
      return lyrics;
    }

    return null;
  } catch (e) {
    return null;
  }
}
