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

  factory ToneHarborTrackObject.localTrackFromFile(
    File file, {
    Metadata? metadata,
    String? art,
  }) {
    var id = basenameWithoutExtension(file.path);
    return ToneHarborTrackObject.local(
      id: id,
      title: metadata?.title ?? id,
      artist: metadata?.artist ?? '',
      album: metadata?.album ?? '',
      externalUri: "",
      duration: Duration(milliseconds: metadata?.durationMs?.toInt() ?? 0),
      rating: 0,
      filesize: file.lengthSync(),
      bitrate: metadata?.bitrate ?? 0,
      channel: metadata?.channels ?? 0,
      codec: '',
      container: extension(file.path).replaceFirst('.', ''),
      frequency: metadata?.sampleRate ?? 0,
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
      bitrate: bitrate,
      channels: channel,
      sampleRate: frequency,
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

extension AsToneHarborTrackObject on Iterable<Song> {
  List<ToneHarborTrackObject> asTrackList() {
    return map((song) {
      var artist = song.additional?.songTag?.artist;
      if (artist == null || artist.isEmpty) {
        artist = song.additional?.songTag?.albumArtist;
      }
      if (artist == null || artist.isEmpty) {
        artist = 'Unknown Artist';
      }
      var album = song.additional?.songTag?.album;
      if (album == null || album.isEmpty) {
        album = 'Unknown Album';
      }
      var container = song.additional?.songAudio?.container;
      if (container == null || container.isEmpty) {
        container = 'mp3';
      }

      var codec = song.additional?.songAudio?.codec;
      if (codec == null || codec.isEmpty) {
        codec = 'mp3';
      }
      return ToneHarborTrackObject.full(
        id: song.id,
        title: song.title,
        artist: artist,
        album: album,
        externalUri: "",
        duration: Duration(
          seconds: song.additional?.songAudio?.duration.toInt() ?? 0,
        ),
        rating: song.additional?.songRating?.rating ?? 0,
        filesize: song.additional?.songAudio?.filesize ?? 0,
        bitrate: song.additional?.songAudio?.bitrate ?? 0,
        channel: song.additional?.songAudio?.channel ?? 0,
        codec: codec,
        container: container,
        frequency: song.additional?.songAudio?.frequency ?? 0,
        platform: ToneHarborTrackPlatform.synology,
      );
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
