import 'package:rhttp/rhttp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

part 'songs_provider.dependence.dart';
part 'songs_provider.g.dart';

@riverpod
Future<SetRatingResponse> setRating(
  Ref ref, {
  required String id,
  int rating = 5,
}) async {
  final link = ref.keepAlive();
  try {
    return await _setRating(ref: ref, id: id, rating: rating);
  } finally {
    link.close();
  }
}

@riverpod
Future<SongListResponse> songs(
  Ref ref, {
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'artist',
  String sortDirection = 'ASC',
  String additional = 'song_tag,song_audio,song_rating',
  String? artist,
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      artist: artist,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<SongListResponse> randomSongs(
  Ref ref, {
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String additional = 'song_tag,song_audio,song_rating',
  Duration? cacheDuration,
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      additional: additional,
      sortBy: 'random',
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<SongListResponse> favoriteSongs(
  Ref ref, {
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'name',
  String sortDirection = 'desc',
  String additional = 'song_tag,song_audio,song_rating',
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      library: library,
      additional: additional,
      sortBy: sortBy,
      sortDirection: sortDirection,
      songRatingMeq: 5,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<SongListResponse> artistSongs(
  Ref ref, {
  required String artist,
  int limit = 100,
  int offset = 0,
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getSongs(
      ref: ref,
      limit: limit,
      offset: offset,
      artist: artist,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<SongListResponse> searchSongs(
  Ref ref, {
  required String title,
  String library = 'all',
  int limit = 5000,
  int offset = 0,
  String sortDirection = 'asc',
  String additional = 'song_tag,song_audio,song_rating',
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration,
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _searchSongs(
      ref: ref,
      title: title,
      library: library,
      limit: limit,
      offset: offset,
      sortDirection: sortDirection,
      additional: additional,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<SongListResponse> albumSongs(
  Ref ref, {
  required String album,
  required String albumArtist,
  int limit = 100,
  int offset = 0,
  String library = 'shared',
  String sortBy = 'song_rating',
  String sortDirection = 'DESC',
  String additional = 'song_tag,song_audio,song_rating',
  String? artist,
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getAlbumSongs(
      ref: ref,
      album: album,
      albumArtist: albumArtist,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      artist: artist,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<LyricsResponse> lyrics(
  Ref ref, {
  required String id,
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getLyrics(ref: ref, id: id, cacheDuration: cacheDuration);
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<SearchLyricsResponse> searchLyrics(
  Ref ref, {
  required String title,
  String? artist,
  int limit = 10,
  String additional = 'full_lyrics',
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _searchLyrics(
      ref: ref,
      title: title,
      artist: artist,
      limit: limit,
      additional: additional,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<SongInfoResponse> songInfo(
  Ref ref, {
  required String id,
  String additional = 'song_rating',
  Duration? cacheDuration = const Duration(minutes: 5),
  Duration? keepAliveDuration = const Duration(minutes: 5),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getSongInfo(
      ref: ref,
      id: id,
      additional: additional,
      cacheDuration: cacheDuration,
    );
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
Future<GetNumberOfPlugInsResponse> numberOfPlugIns(
  Ref ref, {
  Duration? cacheDuration = const Duration(hours: 24),
  Duration? keepAliveDuration = const Duration(minutes: 1),
}) async {
  final link = ref.keepAliveFor(keepAliveDuration);
  try {
    return await _getNumberOfPlugIns(ref: ref, cacheDuration: cacheDuration);
  } finally {
    if (keepAliveDuration == null) {
      link.close();
    }
  }
}

@riverpod
class SongsState extends _$SongsState {
  @override
  SongListResponse? build() {
    return null;
  }

  Future<void> fetchSongs({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'artist',
    String sortDirection = 'ASC',
    String additional = 'song_tag,song_audio,song_rating',
    String? artist,
    Duration? cacheDuration = const Duration(minutes: 5),
  }) async {
    state = null;
    try {
      final response = await _getSongs(
        ref: ref,
        limit: limit,
        offset: offset,
        library: library,
        sortBy: sortBy,
        sortDirection: sortDirection,
        additional: additional,
        artist: artist,
        cacheDuration: cacheDuration,
      );
      state = response;
    } catch (e) {
      logger.e('获取歌曲列表失败: $e');
      rethrow;
    }
  }
}
