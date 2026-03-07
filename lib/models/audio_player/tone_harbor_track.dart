import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
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
    return ToneHarborTrackObject.local(
      id: file.absolute.path,
      title: metadata?.title ?? basenameWithoutExtension(file.path),
      artist: metadata?.artist ?? '',
      album: metadata?.album ?? '',
      externalUri: "file://${file.absolute.path}",
      duration: Duration(milliseconds: metadata?.durationMs?.toInt() ?? 0),
      rating: 0,
      filesize: file.lengthSync(),
      bitrate: 0,
      channel: 0,
      codec: '',
      container: file.path.split('.').last,
      frequency: 0,
      path: file.path,
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
      durationMs: duration.inMicroseconds.toDouble(),
      fileSize: BigInt.from(fileLength),
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
        artist = 'None Artist';
      }
      var album = song.additional?.songTag?.album;
      if (album == null || album.isEmpty) {
        album = 'None Album';
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
