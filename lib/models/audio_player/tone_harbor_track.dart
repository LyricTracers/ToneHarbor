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
    required int durationMs,
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
    required int rating,
    required int durationMs,
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
      durationMs: metadata?.durationMs?.toInt() ?? 0,
      rating: 0,
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
      durationMs: durationMs.toDouble(),
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
      var douration = song.additional?.songAudio?.duration.toInt();
      var dourationMs = 0;
      if (douration != null) {
        dourationMs = douration * 1000;
      }
      return ToneHarborTrackObject.full(
        id: song.id,
        title: song.title,
        artist: song.additional?.songTag?.artist ?? 'None Artist',
        album: song.additional?.songTag?.album ?? 'None Album',
        externalUri: "",
        durationMs: dourationMs,
        rating: song.additional?.songRating?.rating ?? 0,
        platform: ToneHarborTrackPlatform.synology,
      );
    }).toList();
  }
}
