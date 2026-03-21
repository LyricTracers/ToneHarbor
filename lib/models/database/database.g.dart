// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AudioPlayerStateTableTable extends AudioPlayerStateTable
    with TableInfo<$AudioPlayerStateTableTable, AudioPlayerStateTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AudioPlayerStateTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playingMeta = const VerificationMeta(
    'playing',
  );
  @override
  late final GeneratedColumn<bool> playing = GeneratedColumn<bool>(
    'playing',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("playing" IN (0, 1))',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<PlaylistMode, String> loopMode =
      GeneratedColumn<String>(
        'loop_mode',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<PlaylistMode>(
        $AudioPlayerStateTableTable.$converterloopMode,
      );
  static const VerificationMeta _shuffledMeta = const VerificationMeta(
    'shuffled',
  );
  @override
  late final GeneratedColumn<bool> shuffled = GeneratedColumn<bool>(
    'shuffled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("shuffled" IN (0, 1))',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<
    List<ToneHarborTrackObject>,
    String
  >
  tracks =
      GeneratedColumn<String>(
        'tracks',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant("[]"),
      ).withConverter<List<ToneHarborTrackObject>>(
        $AudioPlayerStateTableTable.$convertertracks,
      );
  static const VerificationMeta _currentIndexMeta = const VerificationMeta(
    'currentIndex',
  );
  @override
  late final GeneratedColumn<int> currentIndex = GeneratedColumn<int>(
    'current_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playing,
    loopMode,
    shuffled,
    tracks,
    currentIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audio_player_state_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AudioPlayerStateTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playing')) {
      context.handle(
        _playingMeta,
        playing.isAcceptableOrUnknown(data['playing']!, _playingMeta),
      );
    } else if (isInserting) {
      context.missing(_playingMeta);
    }
    if (data.containsKey('shuffled')) {
      context.handle(
        _shuffledMeta,
        shuffled.isAcceptableOrUnknown(data['shuffled']!, _shuffledMeta),
      );
    } else if (isInserting) {
      context.missing(_shuffledMeta);
    }
    if (data.containsKey('current_index')) {
      context.handle(
        _currentIndexMeta,
        currentIndex.isAcceptableOrUnknown(
          data['current_index']!,
          _currentIndexMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AudioPlayerStateTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AudioPlayerStateTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playing: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}playing'],
      )!,
      loopMode: $AudioPlayerStateTableTable.$converterloopMode.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}loop_mode'],
        )!,
      ),
      shuffled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}shuffled'],
      )!,
      tracks: $AudioPlayerStateTableTable.$convertertracks.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tracks'],
        )!,
      ),
      currentIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_index'],
      )!,
    );
  }

  @override
  $AudioPlayerStateTableTable createAlias(String alias) {
    return $AudioPlayerStateTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PlaylistMode, String, String> $converterloopMode =
      const EnumNameConverter<PlaylistMode>(PlaylistMode.values);
  static TypeConverter<List<ToneHarborTrackObject>, String> $convertertracks =
      const ToneHarborObjectListConverter();
}

class AudioPlayerStateTableData extends DataClass
    implements Insertable<AudioPlayerStateTableData> {
  final int id;
  final bool playing;
  final PlaylistMode loopMode;
  final bool shuffled;
  final List<ToneHarborTrackObject> tracks;
  final int currentIndex;
  const AudioPlayerStateTableData({
    required this.id,
    required this.playing,
    required this.loopMode,
    required this.shuffled,
    required this.tracks,
    required this.currentIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playing'] = Variable<bool>(playing);
    {
      map['loop_mode'] = Variable<String>(
        $AudioPlayerStateTableTable.$converterloopMode.toSql(loopMode),
      );
    }
    map['shuffled'] = Variable<bool>(shuffled);
    {
      map['tracks'] = Variable<String>(
        $AudioPlayerStateTableTable.$convertertracks.toSql(tracks),
      );
    }
    map['current_index'] = Variable<int>(currentIndex);
    return map;
  }

  AudioPlayerStateTableCompanion toCompanion(bool nullToAbsent) {
    return AudioPlayerStateTableCompanion(
      id: Value(id),
      playing: Value(playing),
      loopMode: Value(loopMode),
      shuffled: Value(shuffled),
      tracks: Value(tracks),
      currentIndex: Value(currentIndex),
    );
  }

  factory AudioPlayerStateTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AudioPlayerStateTableData(
      id: serializer.fromJson<int>(json['id']),
      playing: serializer.fromJson<bool>(json['playing']),
      loopMode: $AudioPlayerStateTableTable.$converterloopMode.fromJson(
        serializer.fromJson<String>(json['loopMode']),
      ),
      shuffled: serializer.fromJson<bool>(json['shuffled']),
      tracks: serializer.fromJson<List<ToneHarborTrackObject>>(json['tracks']),
      currentIndex: serializer.fromJson<int>(json['currentIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playing': serializer.toJson<bool>(playing),
      'loopMode': serializer.toJson<String>(
        $AudioPlayerStateTableTable.$converterloopMode.toJson(loopMode),
      ),
      'shuffled': serializer.toJson<bool>(shuffled),
      'tracks': serializer.toJson<List<ToneHarborTrackObject>>(tracks),
      'currentIndex': serializer.toJson<int>(currentIndex),
    };
  }

  AudioPlayerStateTableData copyWith({
    int? id,
    bool? playing,
    PlaylistMode? loopMode,
    bool? shuffled,
    List<ToneHarborTrackObject>? tracks,
    int? currentIndex,
  }) => AudioPlayerStateTableData(
    id: id ?? this.id,
    playing: playing ?? this.playing,
    loopMode: loopMode ?? this.loopMode,
    shuffled: shuffled ?? this.shuffled,
    tracks: tracks ?? this.tracks,
    currentIndex: currentIndex ?? this.currentIndex,
  );
  AudioPlayerStateTableData copyWithCompanion(
    AudioPlayerStateTableCompanion data,
  ) {
    return AudioPlayerStateTableData(
      id: data.id.present ? data.id.value : this.id,
      playing: data.playing.present ? data.playing.value : this.playing,
      loopMode: data.loopMode.present ? data.loopMode.value : this.loopMode,
      shuffled: data.shuffled.present ? data.shuffled.value : this.shuffled,
      tracks: data.tracks.present ? data.tracks.value : this.tracks,
      currentIndex: data.currentIndex.present
          ? data.currentIndex.value
          : this.currentIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AudioPlayerStateTableData(')
          ..write('id: $id, ')
          ..write('playing: $playing, ')
          ..write('loopMode: $loopMode, ')
          ..write('shuffled: $shuffled, ')
          ..write('tracks: $tracks, ')
          ..write('currentIndex: $currentIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, playing, loopMode, shuffled, tracks, currentIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AudioPlayerStateTableData &&
          other.id == this.id &&
          other.playing == this.playing &&
          other.loopMode == this.loopMode &&
          other.shuffled == this.shuffled &&
          other.tracks == this.tracks &&
          other.currentIndex == this.currentIndex);
}

class AudioPlayerStateTableCompanion
    extends UpdateCompanion<AudioPlayerStateTableData> {
  final Value<int> id;
  final Value<bool> playing;
  final Value<PlaylistMode> loopMode;
  final Value<bool> shuffled;
  final Value<List<ToneHarborTrackObject>> tracks;
  final Value<int> currentIndex;
  const AudioPlayerStateTableCompanion({
    this.id = const Value.absent(),
    this.playing = const Value.absent(),
    this.loopMode = const Value.absent(),
    this.shuffled = const Value.absent(),
    this.tracks = const Value.absent(),
    this.currentIndex = const Value.absent(),
  });
  AudioPlayerStateTableCompanion.insert({
    this.id = const Value.absent(),
    required bool playing,
    required PlaylistMode loopMode,
    required bool shuffled,
    this.tracks = const Value.absent(),
    this.currentIndex = const Value.absent(),
  }) : playing = Value(playing),
       loopMode = Value(loopMode),
       shuffled = Value(shuffled);
  static Insertable<AudioPlayerStateTableData> custom({
    Expression<int>? id,
    Expression<bool>? playing,
    Expression<String>? loopMode,
    Expression<bool>? shuffled,
    Expression<String>? tracks,
    Expression<int>? currentIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playing != null) 'playing': playing,
      if (loopMode != null) 'loop_mode': loopMode,
      if (shuffled != null) 'shuffled': shuffled,
      if (tracks != null) 'tracks': tracks,
      if (currentIndex != null) 'current_index': currentIndex,
    });
  }

  AudioPlayerStateTableCompanion copyWith({
    Value<int>? id,
    Value<bool>? playing,
    Value<PlaylistMode>? loopMode,
    Value<bool>? shuffled,
    Value<List<ToneHarborTrackObject>>? tracks,
    Value<int>? currentIndex,
  }) {
    return AudioPlayerStateTableCompanion(
      id: id ?? this.id,
      playing: playing ?? this.playing,
      loopMode: loopMode ?? this.loopMode,
      shuffled: shuffled ?? this.shuffled,
      tracks: tracks ?? this.tracks,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playing.present) {
      map['playing'] = Variable<bool>(playing.value);
    }
    if (loopMode.present) {
      map['loop_mode'] = Variable<String>(
        $AudioPlayerStateTableTable.$converterloopMode.toSql(loopMode.value),
      );
    }
    if (shuffled.present) {
      map['shuffled'] = Variable<bool>(shuffled.value);
    }
    if (tracks.present) {
      map['tracks'] = Variable<String>(
        $AudioPlayerStateTableTable.$convertertracks.toSql(tracks.value),
      );
    }
    if (currentIndex.present) {
      map['current_index'] = Variable<int>(currentIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AudioPlayerStateTableCompanion(')
          ..write('id: $id, ')
          ..write('playing: $playing, ')
          ..write('loopMode: $loopMode, ')
          ..write('shuffled: $shuffled, ')
          ..write('tracks: $tracks, ')
          ..write('currentIndex: $currentIndex')
          ..write(')'))
        .toString();
  }
}

class $FavoritePlaylistStateTableTable extends FavoritePlaylistStateTable
    with
        TableInfo<
          $FavoritePlaylistStateTableTable,
          FavoritePlaylistStateTableData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritePlaylistStateTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<String> playlistId = GeneratedColumn<String>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, playlistId, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_playlist_state_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoritePlaylistStateTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoritePlaylistStateTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritePlaylistStateTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}playlist_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
    );
  }

  @override
  $FavoritePlaylistStateTableTable createAlias(String alias) {
    return $FavoritePlaylistStateTableTable(attachedDatabase, alias);
  }
}

class FavoritePlaylistStateTableData extends DataClass
    implements Insertable<FavoritePlaylistStateTableData> {
  final int id;
  final String playlistId;
  final String title;
  const FavoritePlaylistStateTableData({
    required this.id,
    required this.playlistId,
    required this.title,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<String>(playlistId);
    map['title'] = Variable<String>(title);
    return map;
  }

  FavoritePlaylistStateTableCompanion toCompanion(bool nullToAbsent) {
    return FavoritePlaylistStateTableCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      title: Value(title),
    );
  }

  factory FavoritePlaylistStateTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritePlaylistStateTableData(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<String>(json['playlistId']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<String>(playlistId),
      'title': serializer.toJson<String>(title),
    };
  }

  FavoritePlaylistStateTableData copyWith({
    int? id,
    String? playlistId,
    String? title,
  }) => FavoritePlaylistStateTableData(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    title: title ?? this.title,
  );
  FavoritePlaylistStateTableData copyWithCompanion(
    FavoritePlaylistStateTableCompanion data,
  ) {
    return FavoritePlaylistStateTableData(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePlaylistStateTableData(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playlistId, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritePlaylistStateTableData &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.title == this.title);
}

class FavoritePlaylistStateTableCompanion
    extends UpdateCompanion<FavoritePlaylistStateTableData> {
  final Value<int> id;
  final Value<String> playlistId;
  final Value<String> title;
  const FavoritePlaylistStateTableCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.title = const Value.absent(),
  });
  FavoritePlaylistStateTableCompanion.insert({
    this.id = const Value.absent(),
    required String playlistId,
    required String title,
  }) : playlistId = Value(playlistId),
       title = Value(title);
  static Insertable<FavoritePlaylistStateTableData> custom({
    Expression<int>? id,
    Expression<String>? playlistId,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (title != null) 'title': title,
    });
  }

  FavoritePlaylistStateTableCompanion copyWith({
    Value<int>? id,
    Value<String>? playlistId,
    Value<String>? title,
  }) {
    return FavoritePlaylistStateTableCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<String>(playlistId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePlaylistStateTableCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $DownloadTaskStateTable extends DownloadTaskState
    with TableInfo<$DownloadTaskStateTable, DownloadTaskStateData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadTaskStateTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _trackIdMeta = const VerificationMeta(
    'trackId',
  );
  @override
  late final GeneratedColumn<String> trackId = GeneratedColumn<String>(
    'track_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trackTitleMeta = const VerificationMeta(
    'trackTitle',
  );
  @override
  late final GeneratedColumn<String> trackTitle = GeneratedColumn<String>(
    'track_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trackArtistMeta = const VerificationMeta(
    'trackArtist',
  );
  @override
  late final GeneratedColumn<String> trackArtist = GeneratedColumn<String>(
    'track_artist',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _containerMeta = const VerificationMeta(
    'container',
  );
  @override
  late final GeneratedColumn<String> container = GeneratedColumn<String>(
    'container',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DownloadType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DownloadType>($DownloadTaskStateTable.$convertertype);
  @override
  late final GeneratedColumnWithTypeConverter<AudioQuality, int> quality =
      GeneratedColumn<int>(
        'quality',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<AudioQuality>($DownloadTaskStateTable.$converterquality);
  @override
  late final GeneratedColumnWithTypeConverter<DownloadStatus, int> status =
      GeneratedColumn<int>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DownloadStatus>($DownloadTaskStateTable.$converterstatus);
  static const VerificationMeta _fileSizeMeta = const VerificationMeta(
    'fileSize',
  );
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
    'file_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    trackId,
    trackTitle,
    trackArtist,
    container,
    type,
    quality,
    status,
    fileSize,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'download_task_state';
  @override
  VerificationContext validateIntegrity(
    Insertable<DownloadTaskStateData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('track_id')) {
      context.handle(
        _trackIdMeta,
        trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta),
      );
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('track_title')) {
      context.handle(
        _trackTitleMeta,
        trackTitle.isAcceptableOrUnknown(data['track_title']!, _trackTitleMeta),
      );
    } else if (isInserting) {
      context.missing(_trackTitleMeta);
    }
    if (data.containsKey('track_artist')) {
      context.handle(
        _trackArtistMeta,
        trackArtist.isAcceptableOrUnknown(
          data['track_artist']!,
          _trackArtistMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_trackArtistMeta);
    }
    if (data.containsKey('container')) {
      context.handle(
        _containerMeta,
        container.isAcceptableOrUnknown(data['container']!, _containerMeta),
      );
    } else if (isInserting) {
      context.missing(_containerMeta);
    }
    if (data.containsKey('file_size')) {
      context.handle(
        _fileSizeMeta,
        fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trackId};
  @override
  DownloadTaskStateData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DownloadTaskStateData(
      trackId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track_id'],
      )!,
      trackTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track_title'],
      )!,
      trackArtist: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track_artist'],
      )!,
      container: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}container'],
      )!,
      type: $DownloadTaskStateTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      quality: $DownloadTaskStateTable.$converterquality.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}quality'],
        )!,
      ),
      status: $DownloadTaskStateTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}status'],
        )!,
      ),
      fileSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DownloadTaskStateTable createAlias(String alias) {
    return $DownloadTaskStateTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DownloadType, int, int> $convertertype =
      const EnumIndexConverter<DownloadType>(DownloadType.values);
  static JsonTypeConverter2<AudioQuality, int, int> $converterquality =
      const EnumIndexConverter<AudioQuality>(AudioQuality.values);
  static JsonTypeConverter2<DownloadStatus, int, int> $converterstatus =
      const EnumIndexConverter<DownloadStatus>(DownloadStatus.values);
}

class DownloadTaskStateData extends DataClass
    implements Insertable<DownloadTaskStateData> {
  final String trackId;
  final String trackTitle;
  final String trackArtist;
  final String container;
  final DownloadType type;
  final AudioQuality quality;
  final DownloadStatus status;
  final int fileSize;
  final DateTime updatedAt;
  const DownloadTaskStateData({
    required this.trackId,
    required this.trackTitle,
    required this.trackArtist,
    required this.container,
    required this.type,
    required this.quality,
    required this.status,
    required this.fileSize,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['track_id'] = Variable<String>(trackId);
    map['track_title'] = Variable<String>(trackTitle);
    map['track_artist'] = Variable<String>(trackArtist);
    map['container'] = Variable<String>(container);
    {
      map['type'] = Variable<int>(
        $DownloadTaskStateTable.$convertertype.toSql(type),
      );
    }
    {
      map['quality'] = Variable<int>(
        $DownloadTaskStateTable.$converterquality.toSql(quality),
      );
    }
    {
      map['status'] = Variable<int>(
        $DownloadTaskStateTable.$converterstatus.toSql(status),
      );
    }
    map['file_size'] = Variable<int>(fileSize);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DownloadTaskStateCompanion toCompanion(bool nullToAbsent) {
    return DownloadTaskStateCompanion(
      trackId: Value(trackId),
      trackTitle: Value(trackTitle),
      trackArtist: Value(trackArtist),
      container: Value(container),
      type: Value(type),
      quality: Value(quality),
      status: Value(status),
      fileSize: Value(fileSize),
      updatedAt: Value(updatedAt),
    );
  }

  factory DownloadTaskStateData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DownloadTaskStateData(
      trackId: serializer.fromJson<String>(json['trackId']),
      trackTitle: serializer.fromJson<String>(json['trackTitle']),
      trackArtist: serializer.fromJson<String>(json['trackArtist']),
      container: serializer.fromJson<String>(json['container']),
      type: $DownloadTaskStateTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      quality: $DownloadTaskStateTable.$converterquality.fromJson(
        serializer.fromJson<int>(json['quality']),
      ),
      status: $DownloadTaskStateTable.$converterstatus.fromJson(
        serializer.fromJson<int>(json['status']),
      ),
      fileSize: serializer.fromJson<int>(json['fileSize']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trackId': serializer.toJson<String>(trackId),
      'trackTitle': serializer.toJson<String>(trackTitle),
      'trackArtist': serializer.toJson<String>(trackArtist),
      'container': serializer.toJson<String>(container),
      'type': serializer.toJson<int>(
        $DownloadTaskStateTable.$convertertype.toJson(type),
      ),
      'quality': serializer.toJson<int>(
        $DownloadTaskStateTable.$converterquality.toJson(quality),
      ),
      'status': serializer.toJson<int>(
        $DownloadTaskStateTable.$converterstatus.toJson(status),
      ),
      'fileSize': serializer.toJson<int>(fileSize),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DownloadTaskStateData copyWith({
    String? trackId,
    String? trackTitle,
    String? trackArtist,
    String? container,
    DownloadType? type,
    AudioQuality? quality,
    DownloadStatus? status,
    int? fileSize,
    DateTime? updatedAt,
  }) => DownloadTaskStateData(
    trackId: trackId ?? this.trackId,
    trackTitle: trackTitle ?? this.trackTitle,
    trackArtist: trackArtist ?? this.trackArtist,
    container: container ?? this.container,
    type: type ?? this.type,
    quality: quality ?? this.quality,
    status: status ?? this.status,
    fileSize: fileSize ?? this.fileSize,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DownloadTaskStateData copyWithCompanion(DownloadTaskStateCompanion data) {
    return DownloadTaskStateData(
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      trackTitle: data.trackTitle.present
          ? data.trackTitle.value
          : this.trackTitle,
      trackArtist: data.trackArtist.present
          ? data.trackArtist.value
          : this.trackArtist,
      container: data.container.present ? data.container.value : this.container,
      type: data.type.present ? data.type.value : this.type,
      quality: data.quality.present ? data.quality.value : this.quality,
      status: data.status.present ? data.status.value : this.status,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DownloadTaskStateData(')
          ..write('trackId: $trackId, ')
          ..write('trackTitle: $trackTitle, ')
          ..write('trackArtist: $trackArtist, ')
          ..write('container: $container, ')
          ..write('type: $type, ')
          ..write('quality: $quality, ')
          ..write('status: $status, ')
          ..write('fileSize: $fileSize, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    trackId,
    trackTitle,
    trackArtist,
    container,
    type,
    quality,
    status,
    fileSize,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadTaskStateData &&
          other.trackId == this.trackId &&
          other.trackTitle == this.trackTitle &&
          other.trackArtist == this.trackArtist &&
          other.container == this.container &&
          other.type == this.type &&
          other.quality == this.quality &&
          other.status == this.status &&
          other.fileSize == this.fileSize &&
          other.updatedAt == this.updatedAt);
}

class DownloadTaskStateCompanion
    extends UpdateCompanion<DownloadTaskStateData> {
  final Value<String> trackId;
  final Value<String> trackTitle;
  final Value<String> trackArtist;
  final Value<String> container;
  final Value<DownloadType> type;
  final Value<AudioQuality> quality;
  final Value<DownloadStatus> status;
  final Value<int> fileSize;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DownloadTaskStateCompanion({
    this.trackId = const Value.absent(),
    this.trackTitle = const Value.absent(),
    this.trackArtist = const Value.absent(),
    this.container = const Value.absent(),
    this.type = const Value.absent(),
    this.quality = const Value.absent(),
    this.status = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DownloadTaskStateCompanion.insert({
    required String trackId,
    required String trackTitle,
    required String trackArtist,
    required String container,
    required DownloadType type,
    required AudioQuality quality,
    required DownloadStatus status,
    this.fileSize = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : trackId = Value(trackId),
       trackTitle = Value(trackTitle),
       trackArtist = Value(trackArtist),
       container = Value(container),
       type = Value(type),
       quality = Value(quality),
       status = Value(status);
  static Insertable<DownloadTaskStateData> custom({
    Expression<String>? trackId,
    Expression<String>? trackTitle,
    Expression<String>? trackArtist,
    Expression<String>? container,
    Expression<int>? type,
    Expression<int>? quality,
    Expression<int>? status,
    Expression<int>? fileSize,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trackId != null) 'track_id': trackId,
      if (trackTitle != null) 'track_title': trackTitle,
      if (trackArtist != null) 'track_artist': trackArtist,
      if (container != null) 'container': container,
      if (type != null) 'type': type,
      if (quality != null) 'quality': quality,
      if (status != null) 'status': status,
      if (fileSize != null) 'file_size': fileSize,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DownloadTaskStateCompanion copyWith({
    Value<String>? trackId,
    Value<String>? trackTitle,
    Value<String>? trackArtist,
    Value<String>? container,
    Value<DownloadType>? type,
    Value<AudioQuality>? quality,
    Value<DownloadStatus>? status,
    Value<int>? fileSize,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return DownloadTaskStateCompanion(
      trackId: trackId ?? this.trackId,
      trackTitle: trackTitle ?? this.trackTitle,
      trackArtist: trackArtist ?? this.trackArtist,
      container: container ?? this.container,
      type: type ?? this.type,
      quality: quality ?? this.quality,
      status: status ?? this.status,
      fileSize: fileSize ?? this.fileSize,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trackId.present) {
      map['track_id'] = Variable<String>(trackId.value);
    }
    if (trackTitle.present) {
      map['track_title'] = Variable<String>(trackTitle.value);
    }
    if (trackArtist.present) {
      map['track_artist'] = Variable<String>(trackArtist.value);
    }
    if (container.present) {
      map['container'] = Variable<String>(container.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $DownloadTaskStateTable.$convertertype.toSql(type.value),
      );
    }
    if (quality.present) {
      map['quality'] = Variable<int>(
        $DownloadTaskStateTable.$converterquality.toSql(quality.value),
      );
    }
    if (status.present) {
      map['status'] = Variable<int>(
        $DownloadTaskStateTable.$converterstatus.toSql(status.value),
      );
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadTaskStateCompanion(')
          ..write('trackId: $trackId, ')
          ..write('trackTitle: $trackTitle, ')
          ..write('trackArtist: $trackArtist, ')
          ..write('container: $container, ')
          ..write('type: $type, ')
          ..write('quality: $quality, ')
          ..write('status: $status, ')
          ..write('fileSize: $fileSize, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AudioPlayerStateTableTable audioPlayerStateTable =
      $AudioPlayerStateTableTable(this);
  late final $FavoritePlaylistStateTableTable favoritePlaylistStateTable =
      $FavoritePlaylistStateTableTable(this);
  late final $DownloadTaskStateTable downloadTaskState =
      $DownloadTaskStateTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    audioPlayerStateTable,
    favoritePlaylistStateTable,
    downloadTaskState,
  ];
}

typedef $$AudioPlayerStateTableTableCreateCompanionBuilder =
    AudioPlayerStateTableCompanion Function({
      Value<int> id,
      required bool playing,
      required PlaylistMode loopMode,
      required bool shuffled,
      Value<List<ToneHarborTrackObject>> tracks,
      Value<int> currentIndex,
    });
typedef $$AudioPlayerStateTableTableUpdateCompanionBuilder =
    AudioPlayerStateTableCompanion Function({
      Value<int> id,
      Value<bool> playing,
      Value<PlaylistMode> loopMode,
      Value<bool> shuffled,
      Value<List<ToneHarborTrackObject>> tracks,
      Value<int> currentIndex,
    });

class $$AudioPlayerStateTableTableFilterComposer
    extends Composer<_$AppDatabase, $AudioPlayerStateTableTable> {
  $$AudioPlayerStateTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get playing => $composableBuilder(
    column: $table.playing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PlaylistMode, PlaylistMode, String>
  get loopMode => $composableBuilder(
    column: $table.loopMode,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get shuffled => $composableBuilder(
    column: $table.shuffled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<ToneHarborTrackObject>,
    List<ToneHarborTrackObject>,
    String
  >
  get tracks => $composableBuilder(
    column: $table.tracks,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AudioPlayerStateTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AudioPlayerStateTableTable> {
  $$AudioPlayerStateTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get playing => $composableBuilder(
    column: $table.playing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get loopMode => $composableBuilder(
    column: $table.loopMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get shuffled => $composableBuilder(
    column: $table.shuffled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tracks => $composableBuilder(
    column: $table.tracks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AudioPlayerStateTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AudioPlayerStateTableTable> {
  $$AudioPlayerStateTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get playing =>
      $composableBuilder(column: $table.playing, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PlaylistMode, String> get loopMode =>
      $composableBuilder(column: $table.loopMode, builder: (column) => column);

  GeneratedColumn<bool> get shuffled =>
      $composableBuilder(column: $table.shuffled, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<ToneHarborTrackObject>, String>
  get tracks =>
      $composableBuilder(column: $table.tracks, builder: (column) => column);

  GeneratedColumn<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => column,
  );
}

class $$AudioPlayerStateTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AudioPlayerStateTableTable,
          AudioPlayerStateTableData,
          $$AudioPlayerStateTableTableFilterComposer,
          $$AudioPlayerStateTableTableOrderingComposer,
          $$AudioPlayerStateTableTableAnnotationComposer,
          $$AudioPlayerStateTableTableCreateCompanionBuilder,
          $$AudioPlayerStateTableTableUpdateCompanionBuilder,
          (
            AudioPlayerStateTableData,
            BaseReferences<
              _$AppDatabase,
              $AudioPlayerStateTableTable,
              AudioPlayerStateTableData
            >,
          ),
          AudioPlayerStateTableData,
          PrefetchHooks Function()
        > {
  $$AudioPlayerStateTableTableTableManager(
    _$AppDatabase db,
    $AudioPlayerStateTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AudioPlayerStateTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AudioPlayerStateTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AudioPlayerStateTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> playing = const Value.absent(),
                Value<PlaylistMode> loopMode = const Value.absent(),
                Value<bool> shuffled = const Value.absent(),
                Value<List<ToneHarborTrackObject>> tracks =
                    const Value.absent(),
                Value<int> currentIndex = const Value.absent(),
              }) => AudioPlayerStateTableCompanion(
                id: id,
                playing: playing,
                loopMode: loopMode,
                shuffled: shuffled,
                tracks: tracks,
                currentIndex: currentIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required bool playing,
                required PlaylistMode loopMode,
                required bool shuffled,
                Value<List<ToneHarborTrackObject>> tracks =
                    const Value.absent(),
                Value<int> currentIndex = const Value.absent(),
              }) => AudioPlayerStateTableCompanion.insert(
                id: id,
                playing: playing,
                loopMode: loopMode,
                shuffled: shuffled,
                tracks: tracks,
                currentIndex: currentIndex,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AudioPlayerStateTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AudioPlayerStateTableTable,
      AudioPlayerStateTableData,
      $$AudioPlayerStateTableTableFilterComposer,
      $$AudioPlayerStateTableTableOrderingComposer,
      $$AudioPlayerStateTableTableAnnotationComposer,
      $$AudioPlayerStateTableTableCreateCompanionBuilder,
      $$AudioPlayerStateTableTableUpdateCompanionBuilder,
      (
        AudioPlayerStateTableData,
        BaseReferences<
          _$AppDatabase,
          $AudioPlayerStateTableTable,
          AudioPlayerStateTableData
        >,
      ),
      AudioPlayerStateTableData,
      PrefetchHooks Function()
    >;
typedef $$FavoritePlaylistStateTableTableCreateCompanionBuilder =
    FavoritePlaylistStateTableCompanion Function({
      Value<int> id,
      required String playlistId,
      required String title,
    });
typedef $$FavoritePlaylistStateTableTableUpdateCompanionBuilder =
    FavoritePlaylistStateTableCompanion Function({
      Value<int> id,
      Value<String> playlistId,
      Value<String> title,
    });

class $$FavoritePlaylistStateTableTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritePlaylistStateTableTable> {
  $$FavoritePlaylistStateTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get playlistId => $composableBuilder(
    column: $table.playlistId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritePlaylistStateTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritePlaylistStateTableTable> {
  $$FavoritePlaylistStateTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get playlistId => $composableBuilder(
    column: $table.playlistId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritePlaylistStateTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritePlaylistStateTableTable> {
  $$FavoritePlaylistStateTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get playlistId => $composableBuilder(
    column: $table.playlistId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);
}

class $$FavoritePlaylistStateTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritePlaylistStateTableTable,
          FavoritePlaylistStateTableData,
          $$FavoritePlaylistStateTableTableFilterComposer,
          $$FavoritePlaylistStateTableTableOrderingComposer,
          $$FavoritePlaylistStateTableTableAnnotationComposer,
          $$FavoritePlaylistStateTableTableCreateCompanionBuilder,
          $$FavoritePlaylistStateTableTableUpdateCompanionBuilder,
          (
            FavoritePlaylistStateTableData,
            BaseReferences<
              _$AppDatabase,
              $FavoritePlaylistStateTableTable,
              FavoritePlaylistStateTableData
            >,
          ),
          FavoritePlaylistStateTableData,
          PrefetchHooks Function()
        > {
  $$FavoritePlaylistStateTableTableTableManager(
    _$AppDatabase db,
    $FavoritePlaylistStateTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritePlaylistStateTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$FavoritePlaylistStateTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FavoritePlaylistStateTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> playlistId = const Value.absent(),
                Value<String> title = const Value.absent(),
              }) => FavoritePlaylistStateTableCompanion(
                id: id,
                playlistId: playlistId,
                title: title,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String playlistId,
                required String title,
              }) => FavoritePlaylistStateTableCompanion.insert(
                id: id,
                playlistId: playlistId,
                title: title,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritePlaylistStateTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritePlaylistStateTableTable,
      FavoritePlaylistStateTableData,
      $$FavoritePlaylistStateTableTableFilterComposer,
      $$FavoritePlaylistStateTableTableOrderingComposer,
      $$FavoritePlaylistStateTableTableAnnotationComposer,
      $$FavoritePlaylistStateTableTableCreateCompanionBuilder,
      $$FavoritePlaylistStateTableTableUpdateCompanionBuilder,
      (
        FavoritePlaylistStateTableData,
        BaseReferences<
          _$AppDatabase,
          $FavoritePlaylistStateTableTable,
          FavoritePlaylistStateTableData
        >,
      ),
      FavoritePlaylistStateTableData,
      PrefetchHooks Function()
    >;
typedef $$DownloadTaskStateTableCreateCompanionBuilder =
    DownloadTaskStateCompanion Function({
      required String trackId,
      required String trackTitle,
      required String trackArtist,
      required String container,
      required DownloadType type,
      required AudioQuality quality,
      required DownloadStatus status,
      Value<int> fileSize,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$DownloadTaskStateTableUpdateCompanionBuilder =
    DownloadTaskStateCompanion Function({
      Value<String> trackId,
      Value<String> trackTitle,
      Value<String> trackArtist,
      Value<String> container,
      Value<DownloadType> type,
      Value<AudioQuality> quality,
      Value<DownloadStatus> status,
      Value<int> fileSize,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$DownloadTaskStateTableFilterComposer
    extends Composer<_$AppDatabase, $DownloadTaskStateTable> {
  $$DownloadTaskStateTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get trackId => $composableBuilder(
    column: $table.trackId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trackTitle => $composableBuilder(
    column: $table.trackTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trackArtist => $composableBuilder(
    column: $table.trackArtist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get container => $composableBuilder(
    column: $table.container,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DownloadType, DownloadType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<AudioQuality, AudioQuality, int> get quality =>
      $composableBuilder(
        column: $table.quality,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DownloadStatus, DownloadStatus, int>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DownloadTaskStateTableOrderingComposer
    extends Composer<_$AppDatabase, $DownloadTaskStateTable> {
  $$DownloadTaskStateTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get trackId => $composableBuilder(
    column: $table.trackId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trackTitle => $composableBuilder(
    column: $table.trackTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trackArtist => $composableBuilder(
    column: $table.trackArtist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get container => $composableBuilder(
    column: $table.container,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DownloadTaskStateTableAnnotationComposer
    extends Composer<_$AppDatabase, $DownloadTaskStateTable> {
  $$DownloadTaskStateTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get trackId =>
      $composableBuilder(column: $table.trackId, builder: (column) => column);

  GeneratedColumn<String> get trackTitle => $composableBuilder(
    column: $table.trackTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trackArtist => $composableBuilder(
    column: $table.trackArtist,
    builder: (column) => column,
  );

  GeneratedColumn<String> get container =>
      $composableBuilder(column: $table.container, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DownloadType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AudioQuality, int> get quality =>
      $composableBuilder(column: $table.quality, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DownloadStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DownloadTaskStateTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DownloadTaskStateTable,
          DownloadTaskStateData,
          $$DownloadTaskStateTableFilterComposer,
          $$DownloadTaskStateTableOrderingComposer,
          $$DownloadTaskStateTableAnnotationComposer,
          $$DownloadTaskStateTableCreateCompanionBuilder,
          $$DownloadTaskStateTableUpdateCompanionBuilder,
          (
            DownloadTaskStateData,
            BaseReferences<
              _$AppDatabase,
              $DownloadTaskStateTable,
              DownloadTaskStateData
            >,
          ),
          DownloadTaskStateData,
          PrefetchHooks Function()
        > {
  $$DownloadTaskStateTableTableManager(
    _$AppDatabase db,
    $DownloadTaskStateTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DownloadTaskStateTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DownloadTaskStateTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DownloadTaskStateTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> trackId = const Value.absent(),
                Value<String> trackTitle = const Value.absent(),
                Value<String> trackArtist = const Value.absent(),
                Value<String> container = const Value.absent(),
                Value<DownloadType> type = const Value.absent(),
                Value<AudioQuality> quality = const Value.absent(),
                Value<DownloadStatus> status = const Value.absent(),
                Value<int> fileSize = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DownloadTaskStateCompanion(
                trackId: trackId,
                trackTitle: trackTitle,
                trackArtist: trackArtist,
                container: container,
                type: type,
                quality: quality,
                status: status,
                fileSize: fileSize,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String trackId,
                required String trackTitle,
                required String trackArtist,
                required String container,
                required DownloadType type,
                required AudioQuality quality,
                required DownloadStatus status,
                Value<int> fileSize = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DownloadTaskStateCompanion.insert(
                trackId: trackId,
                trackTitle: trackTitle,
                trackArtist: trackArtist,
                container: container,
                type: type,
                quality: quality,
                status: status,
                fileSize: fileSize,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DownloadTaskStateTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DownloadTaskStateTable,
      DownloadTaskStateData,
      $$DownloadTaskStateTableFilterComposer,
      $$DownloadTaskStateTableOrderingComposer,
      $$DownloadTaskStateTableAnnotationComposer,
      $$DownloadTaskStateTableCreateCompanionBuilder,
      $$DownloadTaskStateTableUpdateCompanionBuilder,
      (
        DownloadTaskStateData,
        BaseReferences<
          _$AppDatabase,
          $DownloadTaskStateTable,
          DownloadTaskStateData
        >,
      ),
      DownloadTaskStateData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AudioPlayerStateTableTableTableManager get audioPlayerStateTable =>
      $$AudioPlayerStateTableTableTableManager(_db, _db.audioPlayerStateTable);
  $$FavoritePlaylistStateTableTableTableManager
  get favoritePlaylistStateTable =>
      $$FavoritePlaylistStateTableTableTableManager(
        _db,
        _db.favoritePlaylistStateTable,
      );
  $$DownloadTaskStateTableTableManager get downloadTaskState =>
      $$DownloadTaskStateTableTableManager(_db, _db.downloadTaskState);
}
