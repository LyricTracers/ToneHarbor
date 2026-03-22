import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/folder.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';

part 'tone_harbor_track.freezed.dart';

part 'tone_harbor_track.g.dart';

enum ToneHarborTrackPlatform { synology, local }

@freezed
sealed class ToneHarborTrackObject with _$ToneHarborTrackObject {
  const ToneHarborTrackObject._();
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
  }) = _$ToneHarborTrackObjectFull;
  factory ToneHarborTrackObject.fromJson(Map<String, dynamic> json) =>
      _$ToneHarborTrackObjectFromJson(
        json.containsKey("path")
            ? {...json, "runtimeType": "local"}
            : {...json, "runtimeType": "full"},
      );

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

extension ToMetaDataToneHarborTrackObject on ToneHarborTrackObject {
  Metadata toMetadata({
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
}

extension AsMediaListToneHarborTrackObject on Iterable<ToneHarborTrackObject> {
  List<ToneHarborMedia> asMediaList() {
    return map((track) => ToneHarborMedia(track)).toList();
  }
}

extension AsToneHarborTrackObjects on Iterable<Song> {
  List<ToneHarborTrackObject> asTrackList() {
    return map((song) {
      return song.asTrack();
    }).toList();
  }
}

extension FolderAsToneHarborTrackObject on Iterable<FolderItem> {
  (List<ToneHarborTrackObject>, int) asTrackList(int initIndex) {
    var tracks = <ToneHarborTrackObject>[];
    var index = initIndex;
    int i = 0;
    forEach((item) {
      if (i == initIndex) {
        index = tracks.length;
      }
      if (item.type != 'folder') {
        var artist = item.additional?.songTag?.artist;
        if (artist == null || artist.isEmpty) {
          artist = item.additional?.songTag?.albumArtist;
        }
        if (artist == null || artist.isEmpty) {
          artist = 'Unknown Artist';
        }
        var album = item.additional?.songTag?.album;
        if (album == null || album.isEmpty) {
          album = 'Unknown Album';
        }
        var container = item.additional?.songAudio?.container;
        if (container == null || container.isEmpty) {
          container = 'mp3';
        }

        var codec = item.additional?.songAudio?.codec;
        if (codec == null || codec.isEmpty) {
          codec = 'mp3';
        }

        tracks.add(
          ToneHarborTrackObject.full(
            id: item.id,
            title: item.title,
            artist: artist,
            album: album,
            externalUri: "",
            duration: Duration(
              seconds: item.additional?.songAudio?.duration.toInt() ?? 0,
            ),
            rating: item.additional?.songRating?.rating ?? 0,
            filesize: item.additional?.songAudio?.filesize ?? 0,
            bitrate: item.additional?.songAudio?.bitrate ?? 0,
            channel: item.additional?.songAudio?.channel ?? 0,
            codec: codec,
            container: container,
            frequency: item.additional?.songAudio?.frequency ?? 0,
            platform: ToneHarborTrackPlatform.synology,
          ),
        );
      }

      i++;
    });
    return (tracks, index);
  }
}
