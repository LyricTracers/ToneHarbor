import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'tone_harbor_track.freezed.dart';

part 'tone_harbor_track.g.dart';

enum ToneHarborTrackPlatform { synology, local }

abstract mixin class AsTrack {
  String get id;
  ToneHarborTrackObject asTrack();
  bool isSong() {
    return true;
  }
}

@freezed
sealed class ToneHarborTrackObject with _$ToneHarborTrackObject {
  const ToneHarborTrackObject._();
  factory ToneHarborTrackObject.folder({
    required String id,
    required String title,
  }) = ToneHarborTrackObjectFolder;
  factory ToneHarborTrackObject.full({
    required String id,
    required String title,
    required String artist,
    required String album,
    required String externalUri,
    required Duration duration,
    required int filesize,
    required int bitrate,
    required int channel,
    required String codec,
    required String container,
    required int frequency,
    required int rating,
    required ToneHarborTrackPlatform platform,
  }) = ToneHarborTrackObjectFull;
  factory ToneHarborTrackObject.fromJson(Map<String, dynamic> json) =>
      _$ToneHarborTrackObjectFromJson(json);

  factory ToneHarborTrackObject.local({
    required String id,
    required String title,
    required String artist,
    required String album,
    required String externalUri,
    required int filesize,
    required int rating,
    required Duration duration,
    required int bitrate,
    required int channel,
    required String codec,
    required String container,
    required int frequency,
    required String path,
  }) = ToneHarborTrackObjectLocal;
  factory ToneHarborTrackObject.multLocal({
    required String id,
    required String title,
    required String artist,
    required String album,
    required String externalUri,
    required Duration duration,
    required int filesize,
    required int bitrate,
    required int channel,
    required String codec,
    required String container,
    required int frequency,
    required int rating,
    required List<AudioQuality> availableQualities,
  }) = ToneHarborTrackObjectMultLocal;

  static Future<ToneHarborTrackObject?> localTrackFromFile(
    File file, {
    Metadata? metadata,
  }) async {
    if (!file.existsSync()) {
      logger.w('[localTrackFromFile] File not found: ${file.path}');
      return null;
    }

    Metadata? fileMetadata = metadata;
    if (fileMetadata == null) {
      try {
        fileMetadata = await MetadataGod.readMetadata(file: file.path);
      } catch (e) {
        logger.w('[localTrackFromFile] Failed to read metadata: $e');
      }
    }

    final baseName = basenameWithoutExtension(file.path);
    final musicIndex = baseName.lastIndexOf('_music_');

    var id = fileMetadata?.comment;
    if (id == null || id.isEmpty) {
      id = musicIndex != -1 ? baseName.substring(musicIndex + 1) : baseName;
    }

    final titleFromFile = musicIndex != -1
        ? baseName.substring(0, musicIndex)
        : baseName;

    return ToneHarborTrackObject.local(
      id: id,
      title: fileMetadata?.title ?? titleFromFile,
      artist: fileMetadata?.artist ?? '',
      album: fileMetadata?.album ?? '',
      externalUri: "",
      duration: Duration(milliseconds: fileMetadata?.durationMs?.toInt() ?? 0),
      rating: 0,
      filesize: file.lengthSync(),
      bitrate: fileMetadata?.bitrate ?? 0,
      channel: fileMetadata?.channels ?? 0,
      codec: '',
      container: extension(file.path).replaceFirst('.', ''),
      frequency: fileMetadata?.sampleRate ?? 0,
      path: file.absolute.path,
    );
  }
}

extension ToneHarborTrackObjectExtension on ToneHarborTrackObject {
  bool get isFolder => this is ToneHarborTrackObjectFolder;
  bool get isSong =>
      this is ToneHarborTrackObjectFull ||
      this is ToneHarborTrackObjectLocal ||
      this is ToneHarborTrackObjectMultLocal;
  bool get isLocal =>
      this is ToneHarborTrackObjectLocal ||
      this is ToneHarborTrackObjectMultLocal;
  bool get isMultLocal => this is ToneHarborTrackObjectMultLocal;

  String get path {
    if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).path;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      final multLocal = this as ToneHarborTrackObjectMultLocal;
      return getTrackCachePath(multLocal, multLocal.bestQuality);
    }
    return '';
  }

  List<AudioQuality> get availableQualities {
    if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).availableQualities;
    }
    return [];
  }

  AudioQuality get bestQuality {
    if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).bestQuality;
    }
    return AudioQuality.high;
  }

  String getPath(AudioQuality quality) {
    if (this is ToneHarborTrackObjectMultLocal) {
      final multLocal = this as ToneHarborTrackObjectMultLocal;
      final filename = generateTrackFilename(
        multLocal.title,
        multLocal.artist,
        multLocal.id,
      );
      return buildTrackPath(filename, multLocal.container, quality);
    }
    return '';
  }

  String get externalUri {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).externalUri;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).externalUri;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).externalUri;
    }
    return '';
  }

  String get artist {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).artist;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).artist;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).artist;
    }
    return '';
  }

  String get album {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).album;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).album;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).album;
    }
    return '';
  }

  Duration get duration {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).duration;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).duration;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).duration;
    }
    return Duration.zero;
  }

  int get filesize {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).filesize;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).filesize;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).filesize;
    }
    return 0;
  }

  int get channel {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).channel;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).channel;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).channel;
    }
    return 0;
  }

  int get rating {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).rating;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).rating;
    }
    return 0;
  }

  int get bitrate {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).bitrate;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).bitrate;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).bitrate;
    }
    return 0;
  }

  int get frequency {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).frequency;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).frequency;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).frequency;
    }
    return 0;
  }

  String get container {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).container;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).container;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).container;
    }
    return '';
  }

  String get codec {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).codec;
    } else if (this is ToneHarborTrackObjectLocal) {
      return (this as ToneHarborTrackObjectLocal).codec;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).codec;
    }
    return '';
  }

  ToneHarborTrackObject convertFull() {
    if (this is ToneHarborTrackObjectLocal) {
      final local = this as ToneHarborTrackObjectLocal;
      return ToneHarborTrackObject.full(
        id: local.id,
        title: local.title,
        artist: local.artist,
        album: local.album,
        externalUri: local.externalUri,
        duration: local.duration,
        filesize: local.filesize,
        bitrate: local.bitrate,
        channel: local.channel,
        codec: local.codec,
        container: local.container,
        frequency: local.frequency,
        rating: local.rating,
        platform: ToneHarborTrackPlatform.local,
      );
    } else if (this is ToneHarborTrackObjectMultLocal) {
      final multLocal = this as ToneHarborTrackObjectMultLocal;
      return ToneHarborTrackObject.full(
        id: multLocal.id,
        title: multLocal.title,
        artist: multLocal.artist,
        album: multLocal.album,
        externalUri: multLocal.externalUri,
        duration: multLocal.duration,
        filesize: multLocal.filesize,
        bitrate: multLocal.bitrate,
        channel: multLocal.channel,
        codec: multLocal.codec,
        container: multLocal.container,
        frequency: multLocal.frequency,
        rating: multLocal.rating,
        platform: ToneHarborTrackPlatform.local,
      );
    }
    return this;
  }

  Metadata? toMetadata({
    required int fileLength,
    Uint8List? imageBytes,
    String? mimeType,
  }) {
    if (this is ToneHarborTrackObjectFull ||
        this is ToneHarborTrackObjectLocal) {
      return _createMetadata(
        id: id,
        title: title,
        artist: artist,
        album: album,
        duration: duration,
        fileLength: fileLength,
      );
    }
    return null;
  }
}

Metadata _createMetadata({
  required String id,
  required String title,
  required String artist,
  required String album,
  required Duration duration,
  required int fileLength,
  Uint8List? imageBytes,
  String? mimeType,
}) {
  return Metadata(
    title: title,
    artist: artist,
    album: album,
    durationMs: duration.inMilliseconds.toDouble(),
    fileSize: BigInt.from(fileLength),
    comment: id,
    picture: imageBytes != null
        ? Picture(
            data: imageBytes,
            mimeType:
                mimeType ??
                lookupMimeType("", headerBytes: imageBytes) ??
                "image/jpeg",
          )
        : null,
  );
}

extension AsMediaListToneHarborTrackObject on Iterable<ToneHarborTrackObject> {
  List<ToneHarborMedia> asMediaList() {
    var result = <ToneHarborMedia>[];
    for (var track in this) {
      if (track.isSong) {
        result.add(ToneHarborMedia(track));
      }
    }
    return result;
  }

  (List<ToneHarborTrackObject>, int) asTrackSongList(int initIndex) {
    var tracks = <ToneHarborTrackObject>[];
    var index = initIndex;
    int i = 0;
    forEach((item) {
      if (i == initIndex) {
        index = tracks.length;
      }
      if (item.isSong) {
        tracks.add(item);
      }
      i++;
    });
    return (tracks, index);
  }
}

extension AsToneHarborTrackObjects on Iterable<AsTrack> {
  List<ToneHarborTrackObject> asTrackList() {
    return map((song) {
      return song.asTrack();
    }).toList();
  }
}

@freezed
sealed class ToneHarborTrackObjectList with _$ToneHarborTrackObjectList {
  const ToneHarborTrackObjectList._();
  const factory ToneHarborTrackObjectList.empty() =
      ToneHarborTrackObjectListEmpty;
  const factory ToneHarborTrackObjectList.data({
    required List<ToneHarborTrackObject> songs,
    int? offset,
    int? total,
  }) = ToneHarborTrackObjectListData;
  factory ToneHarborTrackObjectList.fromJson(Map<String, dynamic> json) =>
      _$ToneHarborTrackObjectListFromJson(json);
}

extension ToneHarborTrackObjectListExtension on ToneHarborTrackObjectList {
  int get offset =>
      when(empty: () => 0, data: (songs, offset, total) => offset ?? 0);
  int get total =>
      when(empty: () => 0, data: (songs, offset, total) => total ?? 0);
  List<ToneHarborTrackObject> get songs =>
      when(empty: () => [], data: (songs, offset, total) => songs);
}

extension AsToneHarborTrackObjectListResponse on SongListResponse {
  ToneHarborTrackObjectList asTrackObjectList() {
    if (!success || data == null || data?.songs == null) {
      return ToneHarborTrackObjectListEmpty();
    }

    return ToneHarborTrackObjectList.data(
      songs: data!.songs.asTrackList(),
      offset: data!.offset,
      total: data!.total,
    );
  }
}

const List<AudioQuality> _qualityPriority = [
  AudioQuality.original,
  AudioQuality.high,
  AudioQuality.medium,
  AudioQuality.low,
];

extension ToneHarborTrackObjectMultLocalExtension
    on ToneHarborTrackObjectMultLocal {
  AudioQuality get bestQuality {
    if (availableQualities.isEmpty) {
      return AudioQuality.high;
    }
    for (final quality in _qualityPriority) {
      if (availableQualities.contains(quality)) {
        return quality;
      }
    }
    return availableQualities.first;
  }
}
