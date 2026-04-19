import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';

part 'tone_harbor_track.freezed.dart';

part 'tone_harbor_track.g.dart';

abstract mixin class AsTrack {
  String get id;
  ToneHarborTrackObject asTrack({CloudMusicAlbumData? album});
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
  }) = ToneHarborTrackObjectFull;
  factory ToneHarborTrackObject.fromJson(Map<String, dynamic> json) =>
      json['runtimeType'] == 'cloudMusic'
      ? fromCloudMusicJson(json)
      : _$ToneHarborTrackObjectFromJson(json);

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

  factory ToneHarborTrackObject.cloudMusic({
    required String id,
    required String title,
    required String artist,
    required String album,
    required Duration duration,
    String? coverUrl,
    String? container,
    int? filesize,
    int? fee,
    String? noCopyrightRcmd,
    List<CloudMusicArtistData>? ar,
    CloudMusicAlbumData? al,
    CloudMusicPrivilegeData? privilege,
  }) = ToneHarborTrackObjectCloudMusic;

  static ToneHarborTrackObject fromCloudMusicJson(Map<String, dynamic> json) {
    final arList = (json['ar'] as List<dynamic>?)?.map((e) {
      if (e is CloudMusicArtistData) {
        return e;
      }
      return CloudMusicArtistData.fromJson(e as Map<String, dynamic>);
    }).toList();

    CloudMusicAlbumData? al;
    if (json['al'] != null) {
      if (json['al'] is CloudMusicAlbumData) {
        al = json['al'] as CloudMusicAlbumData;
      } else {
        al = CloudMusicAlbumData.fromJson(json['al'] as Map<String, dynamic>);
      }
    }

    CloudMusicPrivilegeData? privilege;
    if (json['privilege'] != null) {
      if (json['privilege'] is CloudMusicPrivilegeData) {
        privilege = json['privilege'] as CloudMusicPrivilegeData;
      } else {
        privilege = CloudMusicPrivilegeData.fromJson(
          json['privilege'] as Map<String, dynamic>,
        );
      }
    }

    return ToneHarborTrackObjectCloudMusic(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: json['album'] as String,
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      coverUrl: json['coverUrl'] as String?,
      container: json['container'] as String?,
      filesize: (json['filesize'] as num?)?.toInt(),
      fee: (json['fee'] as num?)?.toInt(),
      noCopyrightRcmd: json['noCopyrightRcmd'] as String?,
      ar: arList,
      al: al,
      privilege: privilege,
      $type: json['runtimeType'] as String?,
    );
  }

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
    final cloudIndex = baseName.lastIndexOf('_cloud_');

    var id = fileMetadata?.comment ?? '';
    if (id.isEmpty) {
      if (musicIndex != -1) {
        id = baseName.substring(musicIndex + 1);
      } else if (cloudIndex != -1) {
        id = baseName.substring(cloudIndex + 1);
      } else {
        id = baseName;
      }
    }

    if (id.startsWith('cloud_')) {
      id = id.substring(6);
    }

    String titleFromFile;
    if (musicIndex != -1) {
      titleFromFile = baseName.substring(0, musicIndex);
    } else if (cloudIndex != -1) {
      titleFromFile = baseName.substring(0, cloudIndex);
    } else {
      titleFromFile = baseName;
    }

    final parentDirName = file.parent.path.split(Platform.pathSeparator).last;
    final quality = AudioQuality.values.firstWhere(
      (q) => q.name == parentDirName,
      orElse: () => SharedPreferencesUtils.getAudioQuality(),
    );

    return ToneHarborTrackObject.multLocal(
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
      availableQualities: [quality],
    );
  }
}

extension ToneHarborTrackObjectExtension on ToneHarborTrackObject {
  bool get isFolder => this is ToneHarborTrackObjectFolder;
  bool get isSong =>
      this is ToneHarborTrackObjectFull ||
      this is ToneHarborTrackObjectMultLocal ||
      this is ToneHarborTrackObjectCloudMusic;
  bool get isLocal => this is ToneHarborTrackObjectMultLocal;
  bool get isCloudMusic => this is ToneHarborTrackObjectCloudMusic;

  CloudMusicAlbumData? get al {
    if (this is ToneHarborTrackObjectCloudMusic) {
      return (this as ToneHarborTrackObjectCloudMusic).al;
    }
    return null;
  }

  List<CloudMusicArtistData>? get ar {
    if (this is ToneHarborTrackObjectCloudMusic) {
      return (this as ToneHarborTrackObjectCloudMusic).ar;
    }
    return null;
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

  Future<String> getPath({AudioQuality? quality}) async {
    if (this is ToneHarborTrackObjectMultLocal) {
      final multLocal = this as ToneHarborTrackObjectMultLocal;
      if (multLocal.id.startsWith("music_")) {
        final filename = generateTrackFilename(
          multLocal.title,
          multLocal.artist,
          multLocal.id,
        );
        return buildTrackPath(
          filename,
          multLocal.container,
          quality ?? multLocal.bestQuality,
        );
      } else {
        return await findCloudMusicCachePath(
              multLocal.id,
              multLocal.title,
              multLocal.artist,
            ) ??
            '';
      }
    }
    return '';
  }

  String get externalUri {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).externalUri;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).externalUri;
    } else if (this is ToneHarborTrackObjectCloudMusic) {
      return (this as ToneHarborTrackObjectCloudMusic).coverUrl ?? '';
    }
    return '';
  }

  String get artist {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).artist;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).artist;
    } else if (this is ToneHarborTrackObjectCloudMusic) {
      return (this as ToneHarborTrackObjectCloudMusic).artist;
    }
    return '';
  }

  String get album {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).album;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).album;
    } else if (this is ToneHarborTrackObjectCloudMusic) {
      return (this as ToneHarborTrackObjectCloudMusic).album;
    }
    return '';
  }

  Duration get duration {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).duration;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).duration;
    } else if (this is ToneHarborTrackObjectCloudMusic) {
      return (this as ToneHarborTrackObjectCloudMusic).duration;
    }
    return Duration.zero;
  }

  int get filesize {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).filesize;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).filesize;
    } else if (this is ToneHarborTrackObjectCloudMusic) {
      return (this as ToneHarborTrackObjectCloudMusic).filesize ?? 0;
    }
    return 0;
  }

  int get channel {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).channel;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).channel;
    }
    return 0;
  }

  int get rating {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).rating;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).rating;
    }
    return 0;
  }

  int get bitrate {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).bitrate;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).bitrate;
    }
    return 0;
  }

  int get frequency {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).frequency;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).frequency;
    }
    return 0;
  }

  String get container {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).container;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).container;
    } else if (this is ToneHarborTrackObjectCloudMusic) {
      return (this as ToneHarborTrackObjectCloudMusic).container ?? 'mp3';
    }
    return '';
  }

  String get codec {
    if (this is ToneHarborTrackObjectFull) {
      return (this as ToneHarborTrackObjectFull).codec;
    } else if (this is ToneHarborTrackObjectMultLocal) {
      return (this as ToneHarborTrackObjectMultLocal).codec;
    }
    return '';
  }

  ToneHarborTrackObject convertFull() {
    if (this is ToneHarborTrackObjectMultLocal) {
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
        this is ToneHarborTrackObjectMultLocal) {
      return _createMetadata(
        id: id,
        title: title,
        artist: artist,
        album: album,
        duration: duration,
        fileLength: fileLength,
        imageBytes: imageBytes,
        mimeType: mimeType,
      );
    }
    if (this is ToneHarborTrackObjectCloudMusic) {
      return _createMetadata(
        id: 'cloud_$id',
        title: title,
        artist: artist,
        album: album,
        duration: duration,
        fileLength: fileLength,
        imageBytes: imageBytes,
        mimeType: mimeType,
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

  bool contains(String id) {
    return songs.any((element) => element.id == id);
  }
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
  Future<Picture?> getPicture() async {
    final path = await getPath();
    if (path.isEmpty) {
      return null;
    }
    final File file = File(path);
    if (!await file.exists()) {
      return null;
    }
    try {
      final fileMetadata = await MetadataGod.readMetadata(file: file.path);
      return fileMetadata.picture!;
    } catch (e) {
      logger.i('[localTrackFromFile] Failed to read metadata: $e, path: $path');
    }
    return null;
  }

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
