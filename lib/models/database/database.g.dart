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
  static const VerificationMeta _externalUriMeta = const VerificationMeta(
    'externalUri',
  );
  @override
  late final GeneratedColumn<String> externalUri = GeneratedColumn<String>(
    'external_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
    externalUri,
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
    if (data.containsKey('external_uri')) {
      context.handle(
        _externalUriMeta,
        externalUri.isAcceptableOrUnknown(
          data['external_uri']!,
          _externalUriMeta,
        ),
      );
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
      externalUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_uri'],
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
  final String externalUri;
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
    required this.externalUri,
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
    map['external_uri'] = Variable<String>(externalUri);
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
      externalUri: Value(externalUri),
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
      externalUri: serializer.fromJson<String>(json['externalUri']),
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
      'externalUri': serializer.toJson<String>(externalUri),
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
    String? externalUri,
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
    externalUri: externalUri ?? this.externalUri,
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
      externalUri: data.externalUri.present
          ? data.externalUri.value
          : this.externalUri,
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
          ..write('externalUri: $externalUri, ')
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
    externalUri,
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
          other.externalUri == this.externalUri &&
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
  final Value<String> externalUri;
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
    this.externalUri = const Value.absent(),
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
    this.externalUri = const Value.absent(),
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
    Expression<String>? externalUri,
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
      if (externalUri != null) 'external_uri': externalUri,
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
    Value<String>? externalUri,
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
      externalUri: externalUri ?? this.externalUri,
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
    if (externalUri.present) {
      map['external_uri'] = Variable<String>(externalUri.value);
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
          ..write('externalUri: $externalUri, ')
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

class $LocalMusicStateTable extends LocalMusicState
    with TableInfo<$LocalMusicStateTable, LocalMusicStateData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalMusicStateTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _qualitiesMeta = const VerificationMeta(
    'qualities',
  );
  @override
  late final GeneratedColumn<int> qualities = GeneratedColumn<int>(
    'qualities',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
    'artist',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _albumMeta = const VerificationMeta('album');
  @override
  late final GeneratedColumn<String> album = GeneratedColumn<String>(
    'album',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
  static const VerificationMeta _externalUriMeta = const VerificationMeta(
    'externalUri',
  );
  @override
  late final GeneratedColumn<String> externalUri = GeneratedColumn<String>(
    'external_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
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
  static const VerificationMeta _bitrateMeta = const VerificationMeta(
    'bitrate',
  );
  @override
  late final GeneratedColumn<int> bitrate = GeneratedColumn<int>(
    'bitrate',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _channelMeta = const VerificationMeta(
    'channel',
  );
  @override
  late final GeneratedColumn<int> channel = GeneratedColumn<int>(
    'channel',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _codecMeta = const VerificationMeta('codec');
  @override
  late final GeneratedColumn<String> codec = GeneratedColumn<String>(
    'codec',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
    'frequency',
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
    qualities,
    title,
    artist,
    album,
    container,
    externalUri,
    rating,
    duration,
    fileSize,
    bitrate,
    channel,
    codec,
    frequency,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_music_state';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalMusicStateData> instance, {
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
    if (data.containsKey('qualities')) {
      context.handle(
        _qualitiesMeta,
        qualities.isAcceptableOrUnknown(data['qualities']!, _qualitiesMeta),
      );
    } else if (isInserting) {
      context.missing(_qualitiesMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(
        _artistMeta,
        artist.isAcceptableOrUnknown(data['artist']!, _artistMeta),
      );
    }
    if (data.containsKey('album')) {
      context.handle(
        _albumMeta,
        album.isAcceptableOrUnknown(data['album']!, _albumMeta),
      );
    }
    if (data.containsKey('container')) {
      context.handle(
        _containerMeta,
        container.isAcceptableOrUnknown(data['container']!, _containerMeta),
      );
    } else if (isInserting) {
      context.missing(_containerMeta);
    }
    if (data.containsKey('external_uri')) {
      context.handle(
        _externalUriMeta,
        externalUri.isAcceptableOrUnknown(
          data['external_uri']!,
          _externalUriMeta,
        ),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('file_size')) {
      context.handle(
        _fileSizeMeta,
        fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta),
      );
    }
    if (data.containsKey('bitrate')) {
      context.handle(
        _bitrateMeta,
        bitrate.isAcceptableOrUnknown(data['bitrate']!, _bitrateMeta),
      );
    }
    if (data.containsKey('channel')) {
      context.handle(
        _channelMeta,
        channel.isAcceptableOrUnknown(data['channel']!, _channelMeta),
      );
    }
    if (data.containsKey('codec')) {
      context.handle(
        _codecMeta,
        codec.isAcceptableOrUnknown(data['codec']!, _codecMeta),
      );
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
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
  LocalMusicStateData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalMusicStateData(
      trackId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track_id'],
      )!,
      qualities: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qualities'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      artist: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artist'],
      )!,
      album: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}album'],
      )!,
      container: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}container'],
      )!,
      externalUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_uri'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rating'],
      )!,
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      )!,
      fileSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size'],
      )!,
      bitrate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bitrate'],
      )!,
      channel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}channel'],
      )!,
      codec: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codec'],
      )!,
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}frequency'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LocalMusicStateTable createAlias(String alias) {
    return $LocalMusicStateTable(attachedDatabase, alias);
  }
}

class LocalMusicStateData extends DataClass
    implements Insertable<LocalMusicStateData> {
  final String trackId;
  final int qualities;
  final String title;
  final String artist;
  final String album;
  final String container;
  final String externalUri;
  final int rating;
  final int duration;
  final int fileSize;
  final int bitrate;
  final int channel;
  final String codec;
  final int frequency;
  final DateTime updatedAt;
  const LocalMusicStateData({
    required this.trackId,
    required this.qualities,
    required this.title,
    required this.artist,
    required this.album,
    required this.container,
    required this.externalUri,
    required this.rating,
    required this.duration,
    required this.fileSize,
    required this.bitrate,
    required this.channel,
    required this.codec,
    required this.frequency,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['track_id'] = Variable<String>(trackId);
    map['qualities'] = Variable<int>(qualities);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['album'] = Variable<String>(album);
    map['container'] = Variable<String>(container);
    map['external_uri'] = Variable<String>(externalUri);
    map['rating'] = Variable<int>(rating);
    map['duration'] = Variable<int>(duration);
    map['file_size'] = Variable<int>(fileSize);
    map['bitrate'] = Variable<int>(bitrate);
    map['channel'] = Variable<int>(channel);
    map['codec'] = Variable<String>(codec);
    map['frequency'] = Variable<int>(frequency);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LocalMusicStateCompanion toCompanion(bool nullToAbsent) {
    return LocalMusicStateCompanion(
      trackId: Value(trackId),
      qualities: Value(qualities),
      title: Value(title),
      artist: Value(artist),
      album: Value(album),
      container: Value(container),
      externalUri: Value(externalUri),
      rating: Value(rating),
      duration: Value(duration),
      fileSize: Value(fileSize),
      bitrate: Value(bitrate),
      channel: Value(channel),
      codec: Value(codec),
      frequency: Value(frequency),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalMusicStateData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalMusicStateData(
      trackId: serializer.fromJson<String>(json['trackId']),
      qualities: serializer.fromJson<int>(json['qualities']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String>(json['artist']),
      album: serializer.fromJson<String>(json['album']),
      container: serializer.fromJson<String>(json['container']),
      externalUri: serializer.fromJson<String>(json['externalUri']),
      rating: serializer.fromJson<int>(json['rating']),
      duration: serializer.fromJson<int>(json['duration']),
      fileSize: serializer.fromJson<int>(json['fileSize']),
      bitrate: serializer.fromJson<int>(json['bitrate']),
      channel: serializer.fromJson<int>(json['channel']),
      codec: serializer.fromJson<String>(json['codec']),
      frequency: serializer.fromJson<int>(json['frequency']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trackId': serializer.toJson<String>(trackId),
      'qualities': serializer.toJson<int>(qualities),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String>(artist),
      'album': serializer.toJson<String>(album),
      'container': serializer.toJson<String>(container),
      'externalUri': serializer.toJson<String>(externalUri),
      'rating': serializer.toJson<int>(rating),
      'duration': serializer.toJson<int>(duration),
      'fileSize': serializer.toJson<int>(fileSize),
      'bitrate': serializer.toJson<int>(bitrate),
      'channel': serializer.toJson<int>(channel),
      'codec': serializer.toJson<String>(codec),
      'frequency': serializer.toJson<int>(frequency),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalMusicStateData copyWith({
    String? trackId,
    int? qualities,
    String? title,
    String? artist,
    String? album,
    String? container,
    String? externalUri,
    int? rating,
    int? duration,
    int? fileSize,
    int? bitrate,
    int? channel,
    String? codec,
    int? frequency,
    DateTime? updatedAt,
  }) => LocalMusicStateData(
    trackId: trackId ?? this.trackId,
    qualities: qualities ?? this.qualities,
    title: title ?? this.title,
    artist: artist ?? this.artist,
    album: album ?? this.album,
    container: container ?? this.container,
    externalUri: externalUri ?? this.externalUri,
    rating: rating ?? this.rating,
    duration: duration ?? this.duration,
    fileSize: fileSize ?? this.fileSize,
    bitrate: bitrate ?? this.bitrate,
    channel: channel ?? this.channel,
    codec: codec ?? this.codec,
    frequency: frequency ?? this.frequency,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LocalMusicStateData copyWithCompanion(LocalMusicStateCompanion data) {
    return LocalMusicStateData(
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      qualities: data.qualities.present ? data.qualities.value : this.qualities,
      title: data.title.present ? data.title.value : this.title,
      artist: data.artist.present ? data.artist.value : this.artist,
      album: data.album.present ? data.album.value : this.album,
      container: data.container.present ? data.container.value : this.container,
      externalUri: data.externalUri.present
          ? data.externalUri.value
          : this.externalUri,
      rating: data.rating.present ? data.rating.value : this.rating,
      duration: data.duration.present ? data.duration.value : this.duration,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      bitrate: data.bitrate.present ? data.bitrate.value : this.bitrate,
      channel: data.channel.present ? data.channel.value : this.channel,
      codec: data.codec.present ? data.codec.value : this.codec,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalMusicStateData(')
          ..write('trackId: $trackId, ')
          ..write('qualities: $qualities, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('album: $album, ')
          ..write('container: $container, ')
          ..write('externalUri: $externalUri, ')
          ..write('rating: $rating, ')
          ..write('duration: $duration, ')
          ..write('fileSize: $fileSize, ')
          ..write('bitrate: $bitrate, ')
          ..write('channel: $channel, ')
          ..write('codec: $codec, ')
          ..write('frequency: $frequency, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    trackId,
    qualities,
    title,
    artist,
    album,
    container,
    externalUri,
    rating,
    duration,
    fileSize,
    bitrate,
    channel,
    codec,
    frequency,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalMusicStateData &&
          other.trackId == this.trackId &&
          other.qualities == this.qualities &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.album == this.album &&
          other.container == this.container &&
          other.externalUri == this.externalUri &&
          other.rating == this.rating &&
          other.duration == this.duration &&
          other.fileSize == this.fileSize &&
          other.bitrate == this.bitrate &&
          other.channel == this.channel &&
          other.codec == this.codec &&
          other.frequency == this.frequency &&
          other.updatedAt == this.updatedAt);
}

class LocalMusicStateCompanion extends UpdateCompanion<LocalMusicStateData> {
  final Value<String> trackId;
  final Value<int> qualities;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> album;
  final Value<String> container;
  final Value<String> externalUri;
  final Value<int> rating;
  final Value<int> duration;
  final Value<int> fileSize;
  final Value<int> bitrate;
  final Value<int> channel;
  final Value<String> codec;
  final Value<int> frequency;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LocalMusicStateCompanion({
    this.trackId = const Value.absent(),
    this.qualities = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.album = const Value.absent(),
    this.container = const Value.absent(),
    this.externalUri = const Value.absent(),
    this.rating = const Value.absent(),
    this.duration = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.bitrate = const Value.absent(),
    this.channel = const Value.absent(),
    this.codec = const Value.absent(),
    this.frequency = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalMusicStateCompanion.insert({
    required String trackId,
    required int qualities,
    required String title,
    this.artist = const Value.absent(),
    this.album = const Value.absent(),
    required String container,
    this.externalUri = const Value.absent(),
    this.rating = const Value.absent(),
    this.duration = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.bitrate = const Value.absent(),
    this.channel = const Value.absent(),
    this.codec = const Value.absent(),
    this.frequency = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : trackId = Value(trackId),
       qualities = Value(qualities),
       title = Value(title),
       container = Value(container);
  static Insertable<LocalMusicStateData> custom({
    Expression<String>? trackId,
    Expression<int>? qualities,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? album,
    Expression<String>? container,
    Expression<String>? externalUri,
    Expression<int>? rating,
    Expression<int>? duration,
    Expression<int>? fileSize,
    Expression<int>? bitrate,
    Expression<int>? channel,
    Expression<String>? codec,
    Expression<int>? frequency,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trackId != null) 'track_id': trackId,
      if (qualities != null) 'qualities': qualities,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (album != null) 'album': album,
      if (container != null) 'container': container,
      if (externalUri != null) 'external_uri': externalUri,
      if (rating != null) 'rating': rating,
      if (duration != null) 'duration': duration,
      if (fileSize != null) 'file_size': fileSize,
      if (bitrate != null) 'bitrate': bitrate,
      if (channel != null) 'channel': channel,
      if (codec != null) 'codec': codec,
      if (frequency != null) 'frequency': frequency,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalMusicStateCompanion copyWith({
    Value<String>? trackId,
    Value<int>? qualities,
    Value<String>? title,
    Value<String>? artist,
    Value<String>? album,
    Value<String>? container,
    Value<String>? externalUri,
    Value<int>? rating,
    Value<int>? duration,
    Value<int>? fileSize,
    Value<int>? bitrate,
    Value<int>? channel,
    Value<String>? codec,
    Value<int>? frequency,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return LocalMusicStateCompanion(
      trackId: trackId ?? this.trackId,
      qualities: qualities ?? this.qualities,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      container: container ?? this.container,
      externalUri: externalUri ?? this.externalUri,
      rating: rating ?? this.rating,
      duration: duration ?? this.duration,
      fileSize: fileSize ?? this.fileSize,
      bitrate: bitrate ?? this.bitrate,
      channel: channel ?? this.channel,
      codec: codec ?? this.codec,
      frequency: frequency ?? this.frequency,
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
    if (qualities.present) {
      map['qualities'] = Variable<int>(qualities.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (album.present) {
      map['album'] = Variable<String>(album.value);
    }
    if (container.present) {
      map['container'] = Variable<String>(container.value);
    }
    if (externalUri.present) {
      map['external_uri'] = Variable<String>(externalUri.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (bitrate.present) {
      map['bitrate'] = Variable<int>(bitrate.value);
    }
    if (channel.present) {
      map['channel'] = Variable<int>(channel.value);
    }
    if (codec.present) {
      map['codec'] = Variable<String>(codec.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
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
    return (StringBuffer('LocalMusicStateCompanion(')
          ..write('trackId: $trackId, ')
          ..write('qualities: $qualities, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('album: $album, ')
          ..write('container: $container, ')
          ..write('externalUri: $externalUri, ')
          ..write('rating: $rating, ')
          ..write('duration: $duration, ')
          ..write('fileSize: $fileSize, ')
          ..write('bitrate: $bitrate, ')
          ..write('channel: $channel, ')
          ..write('codec: $codec, ')
          ..write('frequency: $frequency, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MostPlayStateTableTable extends MostPlayStateTable
    with TableInfo<$MostPlayStateTableTable, MostPlayStateTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MostPlayStateTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _playCountMeta = const VerificationMeta(
    'playCount',
  );
  @override
  late final GeneratedColumn<int> playCount = GeneratedColumn<int>(
    'play_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _lastPlayedAtMeta = const VerificationMeta(
    'lastPlayedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastPlayedAt = GeneratedColumn<DateTime>(
    'last_played_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ToneHarborTrackObject, String>
  track =
      GeneratedColumn<String>(
        'track',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ToneHarborTrackObject>(
        $MostPlayStateTableTable.$convertertrack,
      );
  @override
  List<GeneratedColumn> get $columns => [
    trackId,
    playCount,
    lastPlayedAt,
    track,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'most_play_state_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MostPlayStateTableData> instance, {
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
    if (data.containsKey('play_count')) {
      context.handle(
        _playCountMeta,
        playCount.isAcceptableOrUnknown(data['play_count']!, _playCountMeta),
      );
    }
    if (data.containsKey('last_played_at')) {
      context.handle(
        _lastPlayedAtMeta,
        lastPlayedAt.isAcceptableOrUnknown(
          data['last_played_at']!,
          _lastPlayedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trackId};
  @override
  MostPlayStateTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MostPlayStateTableData(
      trackId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track_id'],
      )!,
      playCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}play_count'],
      )!,
      lastPlayedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_played_at'],
      )!,
      track: $MostPlayStateTableTable.$convertertrack.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}track'],
        )!,
      ),
    );
  }

  @override
  $MostPlayStateTableTable createAlias(String alias) {
    return $MostPlayStateTableTable(attachedDatabase, alias);
  }

  static TypeConverter<ToneHarborTrackObject, String> $convertertrack =
      const ToneHarborObjectConverter();
}

class MostPlayStateTableData extends DataClass
    implements Insertable<MostPlayStateTableData> {
  final String trackId;
  final int playCount;
  final DateTime lastPlayedAt;
  final ToneHarborTrackObject track;
  const MostPlayStateTableData({
    required this.trackId,
    required this.playCount,
    required this.lastPlayedAt,
    required this.track,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['track_id'] = Variable<String>(trackId);
    map['play_count'] = Variable<int>(playCount);
    map['last_played_at'] = Variable<DateTime>(lastPlayedAt);
    {
      map['track'] = Variable<String>(
        $MostPlayStateTableTable.$convertertrack.toSql(track),
      );
    }
    return map;
  }

  MostPlayStateTableCompanion toCompanion(bool nullToAbsent) {
    return MostPlayStateTableCompanion(
      trackId: Value(trackId),
      playCount: Value(playCount),
      lastPlayedAt: Value(lastPlayedAt),
      track: Value(track),
    );
  }

  factory MostPlayStateTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MostPlayStateTableData(
      trackId: serializer.fromJson<String>(json['trackId']),
      playCount: serializer.fromJson<int>(json['playCount']),
      lastPlayedAt: serializer.fromJson<DateTime>(json['lastPlayedAt']),
      track: serializer.fromJson<ToneHarborTrackObject>(json['track']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trackId': serializer.toJson<String>(trackId),
      'playCount': serializer.toJson<int>(playCount),
      'lastPlayedAt': serializer.toJson<DateTime>(lastPlayedAt),
      'track': serializer.toJson<ToneHarborTrackObject>(track),
    };
  }

  MostPlayStateTableData copyWith({
    String? trackId,
    int? playCount,
    DateTime? lastPlayedAt,
    ToneHarborTrackObject? track,
  }) => MostPlayStateTableData(
    trackId: trackId ?? this.trackId,
    playCount: playCount ?? this.playCount,
    lastPlayedAt: lastPlayedAt ?? this.lastPlayedAt,
    track: track ?? this.track,
  );
  MostPlayStateTableData copyWithCompanion(MostPlayStateTableCompanion data) {
    return MostPlayStateTableData(
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      playCount: data.playCount.present ? data.playCount.value : this.playCount,
      lastPlayedAt: data.lastPlayedAt.present
          ? data.lastPlayedAt.value
          : this.lastPlayedAt,
      track: data.track.present ? data.track.value : this.track,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MostPlayStateTableData(')
          ..write('trackId: $trackId, ')
          ..write('playCount: $playCount, ')
          ..write('lastPlayedAt: $lastPlayedAt, ')
          ..write('track: $track')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(trackId, playCount, lastPlayedAt, track);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MostPlayStateTableData &&
          other.trackId == this.trackId &&
          other.playCount == this.playCount &&
          other.lastPlayedAt == this.lastPlayedAt &&
          other.track == this.track);
}

class MostPlayStateTableCompanion
    extends UpdateCompanion<MostPlayStateTableData> {
  final Value<String> trackId;
  final Value<int> playCount;
  final Value<DateTime> lastPlayedAt;
  final Value<ToneHarborTrackObject> track;
  final Value<int> rowid;
  const MostPlayStateTableCompanion({
    this.trackId = const Value.absent(),
    this.playCount = const Value.absent(),
    this.lastPlayedAt = const Value.absent(),
    this.track = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MostPlayStateTableCompanion.insert({
    required String trackId,
    this.playCount = const Value.absent(),
    this.lastPlayedAt = const Value.absent(),
    required ToneHarborTrackObject track,
    this.rowid = const Value.absent(),
  }) : trackId = Value(trackId),
       track = Value(track);
  static Insertable<MostPlayStateTableData> custom({
    Expression<String>? trackId,
    Expression<int>? playCount,
    Expression<DateTime>? lastPlayedAt,
    Expression<String>? track,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trackId != null) 'track_id': trackId,
      if (playCount != null) 'play_count': playCount,
      if (lastPlayedAt != null) 'last_played_at': lastPlayedAt,
      if (track != null) 'track': track,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MostPlayStateTableCompanion copyWith({
    Value<String>? trackId,
    Value<int>? playCount,
    Value<DateTime>? lastPlayedAt,
    Value<ToneHarborTrackObject>? track,
    Value<int>? rowid,
  }) {
    return MostPlayStateTableCompanion(
      trackId: trackId ?? this.trackId,
      playCount: playCount ?? this.playCount,
      lastPlayedAt: lastPlayedAt ?? this.lastPlayedAt,
      track: track ?? this.track,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trackId.present) {
      map['track_id'] = Variable<String>(trackId.value);
    }
    if (playCount.present) {
      map['play_count'] = Variable<int>(playCount.value);
    }
    if (lastPlayedAt.present) {
      map['last_played_at'] = Variable<DateTime>(lastPlayedAt.value);
    }
    if (track.present) {
      map['track'] = Variable<String>(
        $MostPlayStateTableTable.$convertertrack.toSql(track.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MostPlayStateTableCompanion(')
          ..write('trackId: $trackId, ')
          ..write('playCount: $playCount, ')
          ..write('lastPlayedAt: $lastPlayedAt, ')
          ..write('track: $track, ')
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
  late final $LocalMusicStateTable localMusicState = $LocalMusicStateTable(
    this,
  );
  late final $MostPlayStateTableTable mostPlayStateTable =
      $MostPlayStateTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    audioPlayerStateTable,
    favoritePlaylistStateTable,
    downloadTaskState,
    localMusicState,
    mostPlayStateTable,
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
      Value<String> externalUri,
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
      Value<String> externalUri,
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

  ColumnFilters<String> get externalUri => $composableBuilder(
    column: $table.externalUri,
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

  ColumnOrderings<String> get externalUri => $composableBuilder(
    column: $table.externalUri,
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

  GeneratedColumn<String> get externalUri => $composableBuilder(
    column: $table.externalUri,
    builder: (column) => column,
  );

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
                Value<String> externalUri = const Value.absent(),
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
                externalUri: externalUri,
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
                Value<String> externalUri = const Value.absent(),
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
                externalUri: externalUri,
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
typedef $$LocalMusicStateTableCreateCompanionBuilder =
    LocalMusicStateCompanion Function({
      required String trackId,
      required int qualities,
      required String title,
      Value<String> artist,
      Value<String> album,
      required String container,
      Value<String> externalUri,
      Value<int> rating,
      Value<int> duration,
      Value<int> fileSize,
      Value<int> bitrate,
      Value<int> channel,
      Value<String> codec,
      Value<int> frequency,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$LocalMusicStateTableUpdateCompanionBuilder =
    LocalMusicStateCompanion Function({
      Value<String> trackId,
      Value<int> qualities,
      Value<String> title,
      Value<String> artist,
      Value<String> album,
      Value<String> container,
      Value<String> externalUri,
      Value<int> rating,
      Value<int> duration,
      Value<int> fileSize,
      Value<int> bitrate,
      Value<int> channel,
      Value<String> codec,
      Value<int> frequency,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$LocalMusicStateTableFilterComposer
    extends Composer<_$AppDatabase, $LocalMusicStateTable> {
  $$LocalMusicStateTableFilterComposer({
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

  ColumnFilters<int> get qualities => $composableBuilder(
    column: $table.qualities,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get container => $composableBuilder(
    column: $table.container,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get externalUri => $composableBuilder(
    column: $table.externalUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bitrate => $composableBuilder(
    column: $table.bitrate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codec => $composableBuilder(
    column: $table.codec,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalMusicStateTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalMusicStateTable> {
  $$LocalMusicStateTableOrderingComposer({
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

  ColumnOrderings<int> get qualities => $composableBuilder(
    column: $table.qualities,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get container => $composableBuilder(
    column: $table.container,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get externalUri => $composableBuilder(
    column: $table.externalUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bitrate => $composableBuilder(
    column: $table.bitrate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codec => $composableBuilder(
    column: $table.codec,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalMusicStateTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalMusicStateTable> {
  $$LocalMusicStateTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get trackId =>
      $composableBuilder(column: $table.trackId, builder: (column) => column);

  GeneratedColumn<int> get qualities =>
      $composableBuilder(column: $table.qualities, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get artist =>
      $composableBuilder(column: $table.artist, builder: (column) => column);

  GeneratedColumn<String> get album =>
      $composableBuilder(column: $table.album, builder: (column) => column);

  GeneratedColumn<String> get container =>
      $composableBuilder(column: $table.container, builder: (column) => column);

  GeneratedColumn<String> get externalUri => $composableBuilder(
    column: $table.externalUri,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<int> get bitrate =>
      $composableBuilder(column: $table.bitrate, builder: (column) => column);

  GeneratedColumn<int> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<String> get codec =>
      $composableBuilder(column: $table.codec, builder: (column) => column);

  GeneratedColumn<int> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LocalMusicStateTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalMusicStateTable,
          LocalMusicStateData,
          $$LocalMusicStateTableFilterComposer,
          $$LocalMusicStateTableOrderingComposer,
          $$LocalMusicStateTableAnnotationComposer,
          $$LocalMusicStateTableCreateCompanionBuilder,
          $$LocalMusicStateTableUpdateCompanionBuilder,
          (
            LocalMusicStateData,
            BaseReferences<
              _$AppDatabase,
              $LocalMusicStateTable,
              LocalMusicStateData
            >,
          ),
          LocalMusicStateData,
          PrefetchHooks Function()
        > {
  $$LocalMusicStateTableTableManager(
    _$AppDatabase db,
    $LocalMusicStateTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalMusicStateTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalMusicStateTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalMusicStateTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> trackId = const Value.absent(),
                Value<int> qualities = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> artist = const Value.absent(),
                Value<String> album = const Value.absent(),
                Value<String> container = const Value.absent(),
                Value<String> externalUri = const Value.absent(),
                Value<int> rating = const Value.absent(),
                Value<int> duration = const Value.absent(),
                Value<int> fileSize = const Value.absent(),
                Value<int> bitrate = const Value.absent(),
                Value<int> channel = const Value.absent(),
                Value<String> codec = const Value.absent(),
                Value<int> frequency = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalMusicStateCompanion(
                trackId: trackId,
                qualities: qualities,
                title: title,
                artist: artist,
                album: album,
                container: container,
                externalUri: externalUri,
                rating: rating,
                duration: duration,
                fileSize: fileSize,
                bitrate: bitrate,
                channel: channel,
                codec: codec,
                frequency: frequency,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String trackId,
                required int qualities,
                required String title,
                Value<String> artist = const Value.absent(),
                Value<String> album = const Value.absent(),
                required String container,
                Value<String> externalUri = const Value.absent(),
                Value<int> rating = const Value.absent(),
                Value<int> duration = const Value.absent(),
                Value<int> fileSize = const Value.absent(),
                Value<int> bitrate = const Value.absent(),
                Value<int> channel = const Value.absent(),
                Value<String> codec = const Value.absent(),
                Value<int> frequency = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalMusicStateCompanion.insert(
                trackId: trackId,
                qualities: qualities,
                title: title,
                artist: artist,
                album: album,
                container: container,
                externalUri: externalUri,
                rating: rating,
                duration: duration,
                fileSize: fileSize,
                bitrate: bitrate,
                channel: channel,
                codec: codec,
                frequency: frequency,
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

typedef $$LocalMusicStateTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalMusicStateTable,
      LocalMusicStateData,
      $$LocalMusicStateTableFilterComposer,
      $$LocalMusicStateTableOrderingComposer,
      $$LocalMusicStateTableAnnotationComposer,
      $$LocalMusicStateTableCreateCompanionBuilder,
      $$LocalMusicStateTableUpdateCompanionBuilder,
      (
        LocalMusicStateData,
        BaseReferences<
          _$AppDatabase,
          $LocalMusicStateTable,
          LocalMusicStateData
        >,
      ),
      LocalMusicStateData,
      PrefetchHooks Function()
    >;
typedef $$MostPlayStateTableTableCreateCompanionBuilder =
    MostPlayStateTableCompanion Function({
      required String trackId,
      Value<int> playCount,
      Value<DateTime> lastPlayedAt,
      required ToneHarborTrackObject track,
      Value<int> rowid,
    });
typedef $$MostPlayStateTableTableUpdateCompanionBuilder =
    MostPlayStateTableCompanion Function({
      Value<String> trackId,
      Value<int> playCount,
      Value<DateTime> lastPlayedAt,
      Value<ToneHarborTrackObject> track,
      Value<int> rowid,
    });

class $$MostPlayStateTableTableFilterComposer
    extends Composer<_$AppDatabase, $MostPlayStateTableTable> {
  $$MostPlayStateTableTableFilterComposer({
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

  ColumnFilters<int> get playCount => $composableBuilder(
    column: $table.playCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    ToneHarborTrackObject,
    ToneHarborTrackObject,
    String
  >
  get track => $composableBuilder(
    column: $table.track,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$MostPlayStateTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MostPlayStateTableTable> {
  $$MostPlayStateTableTableOrderingComposer({
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

  ColumnOrderings<int> get playCount => $composableBuilder(
    column: $table.playCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get track => $composableBuilder(
    column: $table.track,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MostPlayStateTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MostPlayStateTableTable> {
  $$MostPlayStateTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get trackId =>
      $composableBuilder(column: $table.trackId, builder: (column) => column);

  GeneratedColumn<int> get playCount =>
      $composableBuilder(column: $table.playCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ToneHarborTrackObject, String> get track =>
      $composableBuilder(column: $table.track, builder: (column) => column);
}

class $$MostPlayStateTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MostPlayStateTableTable,
          MostPlayStateTableData,
          $$MostPlayStateTableTableFilterComposer,
          $$MostPlayStateTableTableOrderingComposer,
          $$MostPlayStateTableTableAnnotationComposer,
          $$MostPlayStateTableTableCreateCompanionBuilder,
          $$MostPlayStateTableTableUpdateCompanionBuilder,
          (
            MostPlayStateTableData,
            BaseReferences<
              _$AppDatabase,
              $MostPlayStateTableTable,
              MostPlayStateTableData
            >,
          ),
          MostPlayStateTableData,
          PrefetchHooks Function()
        > {
  $$MostPlayStateTableTableTableManager(
    _$AppDatabase db,
    $MostPlayStateTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MostPlayStateTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MostPlayStateTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MostPlayStateTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> trackId = const Value.absent(),
                Value<int> playCount = const Value.absent(),
                Value<DateTime> lastPlayedAt = const Value.absent(),
                Value<ToneHarborTrackObject> track = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MostPlayStateTableCompanion(
                trackId: trackId,
                playCount: playCount,
                lastPlayedAt: lastPlayedAt,
                track: track,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String trackId,
                Value<int> playCount = const Value.absent(),
                Value<DateTime> lastPlayedAt = const Value.absent(),
                required ToneHarborTrackObject track,
                Value<int> rowid = const Value.absent(),
              }) => MostPlayStateTableCompanion.insert(
                trackId: trackId,
                playCount: playCount,
                lastPlayedAt: lastPlayedAt,
                track: track,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MostPlayStateTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MostPlayStateTableTable,
      MostPlayStateTableData,
      $$MostPlayStateTableTableFilterComposer,
      $$MostPlayStateTableTableOrderingComposer,
      $$MostPlayStateTableTableAnnotationComposer,
      $$MostPlayStateTableTableCreateCompanionBuilder,
      $$MostPlayStateTableTableUpdateCompanionBuilder,
      (
        MostPlayStateTableData,
        BaseReferences<
          _$AppDatabase,
          $MostPlayStateTableTable,
          MostPlayStateTableData
        >,
      ),
      MostPlayStateTableData,
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
  $$LocalMusicStateTableTableManager get localMusicState =>
      $$LocalMusicStateTableTableManager(_db, _db.localMusicState);
  $$MostPlayStateTableTableTableManager get mostPlayStateTable =>
      $$MostPlayStateTableTableTableManager(_db, _db.mostPlayStateTable);
}
