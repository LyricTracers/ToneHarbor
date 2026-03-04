import 'package:hive/hive.dart';
import 'package:media_kit/media_kit.dart';
import 'package:toneharbor/models/audio_station/song.dart';

class AudioPlayerPersistedStateHive extends HiveObject {
  bool playing;
  String loopMode;
  bool shuffled;
  List<String> collections;
  int currentIndex;
  List<SongHive> tracks;

  AudioPlayerPersistedStateHive({
    this.playing = false,
    this.loopMode = 'none',
    this.shuffled = false,
    List<String>? collections,
    this.currentIndex = 0,
    List<SongHive>? tracks,
  }) : collections = collections ?? [],
       tracks = tracks ?? [];

  PlaylistMode get playlistMode => switch (loopMode) {
    'loop' => PlaylistMode.loop,
    'single' => PlaylistMode.single,
    _ => PlaylistMode.none,
  };

  static AudioPlayerPersistedStateHive fromDomain({
    required bool playing,
    required PlaylistMode loopMode,
    required bool shuffled,
    required List<String> collections,
    required int currentIndex,
    required List<Song> tracks,
  }) {
    return AudioPlayerPersistedStateHive(
      playing: playing,
      loopMode: loopMode.name,
      shuffled: shuffled,
      collections: collections,
      currentIndex: currentIndex,
      tracks: tracks.map((t) => SongHive.fromSong(t)).toList(),
    );
  }
}

class SongHive extends HiveObject {
  String id;
  String path;
  String title;
  String type;
  SongAdditionalHive? additional;

  SongHive({
    required this.id,
    required this.path,
    required this.title,
    required this.type,
    this.additional,
  });

  Song toSong() {
    return Song(
      id: id,
      path: path,
      title: title,
      type: type,
      additional: additional?.toSongAdditional(),
    );
  }

  static SongHive fromSong(Song song) {
    return SongHive(
      id: song.id,
      path: song.path,
      title: song.title,
      type: song.type,
      additional: song.additional != null
          ? SongAdditionalHive.fromSongAdditional(song.additional!)
          : null,
    );
  }
}

class SongAdditionalHive extends HiveObject {
  SongAudioHive? songAudio;
  SongRatingHive? songRating;
  SongTagHive? songTag;

  SongAdditionalHive({this.songAudio, this.songRating, this.songTag});

  SongAdditional toSongAdditional() {
    return SongAdditional(
      songAudio: songAudio?.toSongAudio(),
      songRating: songRating?.toSongRating(),
      songTag: songTag?.toSongTag(),
    );
  }

  static SongAdditionalHive fromSongAdditional(SongAdditional additional) {
    return SongAdditionalHive(
      songAudio: additional.songAudio != null
          ? SongAudioHive.fromSongAudio(additional.songAudio!)
          : null,
      songRating: additional.songRating != null
          ? SongRatingHive.fromSongRating(additional.songRating!)
          : null,
      songTag: additional.songTag != null
          ? SongTagHive.fromSongTag(additional.songTag!)
          : null,
    );
  }
}

class SongAudioHive extends HiveObject {
  int bitrate;
  int channel;
  String codec;
  String container;
  int duration;
  int filesize;
  int frequency;

  SongAudioHive({
    required this.bitrate,
    required this.channel,
    required this.codec,
    required this.container,
    required this.duration,
    required this.filesize,
    required this.frequency,
  });

  SongAudio toSongAudio() {
    return SongAudio(
      bitrate: bitrate,
      channel: channel,
      codec: codec,
      container: container,
      duration: duration,
      filesize: filesize,
      frequency: frequency,
    );
  }

  static SongAudioHive fromSongAudio(SongAudio audio) {
    return SongAudioHive(
      bitrate: audio.bitrate,
      channel: audio.channel,
      codec: audio.codec,
      container: audio.container,
      duration: audio.duration,
      filesize: audio.filesize,
      frequency: audio.frequency,
    );
  }
}

class SongTagHive extends HiveObject {
  String? album;
  String? albumArtist;
  String? artist;
  String? comment;
  String? composer;
  int disc;
  String? genre;
  int track;
  int year;

  SongTagHive({
    this.album,
    this.albumArtist,
    this.artist,
    this.comment,
    this.composer,
    required this.disc,
    this.genre,
    required this.track,
    required this.year,
  });

  SongTag toSongTag() {
    return SongTag(
      album: album,
      albumArtist: albumArtist,
      artist: artist,
      comment: comment,
      composer: composer,
      disc: disc,
      genre: genre,
      track: track,
      year: year,
    );
  }

  static SongTagHive fromSongTag(SongTag tag) {
    return SongTagHive(
      album: tag.album,
      albumArtist: tag.albumArtist,
      artist: tag.artist,
      comment: tag.comment,
      composer: tag.composer,
      disc: tag.disc,
      genre: tag.genre,
      track: tag.track,
      year: tag.year,
    );
  }
}

class SongRatingHive extends HiveObject {
  int rating;

  SongRatingHive({required this.rating});

  SongRating toSongRating() {
    return SongRating(rating: rating);
  }

  static SongRatingHive fromSongRating(SongRating rating) {
    return SongRatingHive(rating: rating.rating);
  }
}

class PlaybackHistoryEntryHive extends HiveObject {
  SongHive track;
  DateTime playedAt;
  int playDurationMs;

  PlaybackHistoryEntryHive({
    required this.track,
    required this.playedAt,
    required this.playDurationMs,
  });
}

class AudioPlayerPersistedStateHiveAdapter
    extends TypeAdapter<AudioPlayerPersistedStateHive> {
  @override
  final int typeId = 0;

  @override
  AudioPlayerPersistedStateHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioPlayerPersistedStateHive(
      playing: fields[0] as bool? ?? false,
      loopMode: fields[1] as String? ?? 'none',
      shuffled: fields[2] as bool? ?? false,
      collections: (fields[3] as List?)?.cast<String>() ?? [],
      currentIndex: fields[4] as int? ?? 0,
      tracks: (fields[5] as List?)?.cast<SongHive>() ?? [],
    );
  }

  @override
  void write(BinaryWriter writer, AudioPlayerPersistedStateHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.playing)
      ..writeByte(1)
      ..write(obj.loopMode)
      ..writeByte(2)
      ..write(obj.shuffled)
      ..writeByte(3)
      ..write(obj.collections)
      ..writeByte(4)
      ..write(obj.currentIndex)
      ..writeByte(5)
      ..write(obj.tracks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioPlayerPersistedStateHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SongHiveAdapter extends TypeAdapter<SongHive> {
  @override
  final int typeId = 1;

  @override
  SongHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SongHive(
      id: fields[0] as String,
      path: fields[1] as String,
      title: fields[2] as String,
      type: fields[3] as String,
      additional: fields[4] as SongAdditionalHive?,
    );
  }

  @override
  void write(BinaryWriter writer, SongHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.additional);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SongAdditionalHiveAdapter extends TypeAdapter<SongAdditionalHive> {
  @override
  final int typeId = 2;

  @override
  SongAdditionalHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SongAdditionalHive(
      songAudio: fields[0] as SongAudioHive?,
      songRating: fields[1] as SongRatingHive?,
      songTag: fields[2] as SongTagHive?,
    );
  }

  @override
  void write(BinaryWriter writer, SongAdditionalHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.songAudio)
      ..writeByte(1)
      ..write(obj.songRating)
      ..writeByte(2)
      ..write(obj.songTag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongAdditionalHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SongAudioHiveAdapter extends TypeAdapter<SongAudioHive> {
  @override
  final int typeId = 3;

  @override
  SongAudioHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SongAudioHive(
      bitrate: fields[0] as int,
      channel: fields[1] as int,
      codec: fields[2] as String,
      container: fields[3] as String,
      duration: fields[4] as int,
      filesize: fields[5] as int,
      frequency: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SongAudioHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.bitrate)
      ..writeByte(1)
      ..write(obj.channel)
      ..writeByte(2)
      ..write(obj.codec)
      ..writeByte(3)
      ..write(obj.container)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.filesize)
      ..writeByte(6)
      ..write(obj.frequency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongAudioHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SongTagHiveAdapter extends TypeAdapter<SongTagHive> {
  @override
  final int typeId = 4;

  @override
  SongTagHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SongTagHive(
      album: fields[0] as String?,
      albumArtist: fields[1] as String?,
      artist: fields[2] as String?,
      comment: fields[3] as String?,
      composer: fields[4] as String?,
      disc: fields[5] as int,
      genre: fields[6] as String?,
      track: fields[7] as int,
      year: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SongTagHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.album)
      ..writeByte(1)
      ..write(obj.albumArtist)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(3)
      ..write(obj.comment)
      ..writeByte(4)
      ..write(obj.composer)
      ..writeByte(5)
      ..write(obj.disc)
      ..writeByte(6)
      ..write(obj.genre)
      ..writeByte(7)
      ..write(obj.track)
      ..writeByte(8)
      ..write(obj.year);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongTagHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SongRatingHiveAdapter extends TypeAdapter<SongRatingHive> {
  @override
  final int typeId = 5;

  @override
  SongRatingHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SongRatingHive(rating: fields[0] as int);
  }

  @override
  void write(BinaryWriter writer, SongRatingHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongRatingHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlaybackHistoryEntryHiveAdapter
    extends TypeAdapter<PlaybackHistoryEntryHive> {
  @override
  final int typeId = 6;

  @override
  PlaybackHistoryEntryHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaybackHistoryEntryHive(
      track: fields[0] as SongHive,
      playedAt: fields[1] as DateTime,
      playDurationMs: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PlaybackHistoryEntryHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.track)
      ..writeByte(1)
      ..write(obj.playedAt)
      ..writeByte(2)
      ..write(obj.playDurationMs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaybackHistoryEntryHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
