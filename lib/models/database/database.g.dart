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
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  collections =
      GeneratedColumn<String>(
        'collections',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>(
        $AudioPlayerStateTableTable.$convertercollections,
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
    collections,
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
      collections: $AudioPlayerStateTableTable.$convertercollections.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}collections'],
        )!,
      ),
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
  static TypeConverter<List<String>, String> $convertercollections =
      const StringListConverter();
  static TypeConverter<List<ToneHarborTrackObject>, String> $convertertracks =
      const ToneHarborObjectListConverter();
}

class AudioPlayerStateTableData extends DataClass
    implements Insertable<AudioPlayerStateTableData> {
  final int id;
  final bool playing;
  final PlaylistMode loopMode;
  final bool shuffled;
  final List<String> collections;
  final List<ToneHarborTrackObject> tracks;
  final int currentIndex;
  const AudioPlayerStateTableData({
    required this.id,
    required this.playing,
    required this.loopMode,
    required this.shuffled,
    required this.collections,
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
      map['collections'] = Variable<String>(
        $AudioPlayerStateTableTable.$convertercollections.toSql(collections),
      );
    }
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
      collections: Value(collections),
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
      collections: serializer.fromJson<List<String>>(json['collections']),
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
      'collections': serializer.toJson<List<String>>(collections),
      'tracks': serializer.toJson<List<ToneHarborTrackObject>>(tracks),
      'currentIndex': serializer.toJson<int>(currentIndex),
    };
  }

  AudioPlayerStateTableData copyWith({
    int? id,
    bool? playing,
    PlaylistMode? loopMode,
    bool? shuffled,
    List<String>? collections,
    List<ToneHarborTrackObject>? tracks,
    int? currentIndex,
  }) => AudioPlayerStateTableData(
    id: id ?? this.id,
    playing: playing ?? this.playing,
    loopMode: loopMode ?? this.loopMode,
    shuffled: shuffled ?? this.shuffled,
    collections: collections ?? this.collections,
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
      collections: data.collections.present
          ? data.collections.value
          : this.collections,
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
          ..write('collections: $collections, ')
          ..write('tracks: $tracks, ')
          ..write('currentIndex: $currentIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playing,
    loopMode,
    shuffled,
    collections,
    tracks,
    currentIndex,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AudioPlayerStateTableData &&
          other.id == this.id &&
          other.playing == this.playing &&
          other.loopMode == this.loopMode &&
          other.shuffled == this.shuffled &&
          other.collections == this.collections &&
          other.tracks == this.tracks &&
          other.currentIndex == this.currentIndex);
}

class AudioPlayerStateTableCompanion
    extends UpdateCompanion<AudioPlayerStateTableData> {
  final Value<int> id;
  final Value<bool> playing;
  final Value<PlaylistMode> loopMode;
  final Value<bool> shuffled;
  final Value<List<String>> collections;
  final Value<List<ToneHarborTrackObject>> tracks;
  final Value<int> currentIndex;
  const AudioPlayerStateTableCompanion({
    this.id = const Value.absent(),
    this.playing = const Value.absent(),
    this.loopMode = const Value.absent(),
    this.shuffled = const Value.absent(),
    this.collections = const Value.absent(),
    this.tracks = const Value.absent(),
    this.currentIndex = const Value.absent(),
  });
  AudioPlayerStateTableCompanion.insert({
    this.id = const Value.absent(),
    required bool playing,
    required PlaylistMode loopMode,
    required bool shuffled,
    required List<String> collections,
    this.tracks = const Value.absent(),
    this.currentIndex = const Value.absent(),
  }) : playing = Value(playing),
       loopMode = Value(loopMode),
       shuffled = Value(shuffled),
       collections = Value(collections);
  static Insertable<AudioPlayerStateTableData> custom({
    Expression<int>? id,
    Expression<bool>? playing,
    Expression<String>? loopMode,
    Expression<bool>? shuffled,
    Expression<String>? collections,
    Expression<String>? tracks,
    Expression<int>? currentIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playing != null) 'playing': playing,
      if (loopMode != null) 'loop_mode': loopMode,
      if (shuffled != null) 'shuffled': shuffled,
      if (collections != null) 'collections': collections,
      if (tracks != null) 'tracks': tracks,
      if (currentIndex != null) 'current_index': currentIndex,
    });
  }

  AudioPlayerStateTableCompanion copyWith({
    Value<int>? id,
    Value<bool>? playing,
    Value<PlaylistMode>? loopMode,
    Value<bool>? shuffled,
    Value<List<String>>? collections,
    Value<List<ToneHarborTrackObject>>? tracks,
    Value<int>? currentIndex,
  }) {
    return AudioPlayerStateTableCompanion(
      id: id ?? this.id,
      playing: playing ?? this.playing,
      loopMode: loopMode ?? this.loopMode,
      shuffled: shuffled ?? this.shuffled,
      collections: collections ?? this.collections,
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
    if (collections.present) {
      map['collections'] = Variable<String>(
        $AudioPlayerStateTableTable.$convertercollections.toSql(
          collections.value,
        ),
      );
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
          ..write('collections: $collections, ')
          ..write('tracks: $tracks, ')
          ..write('currentIndex: $currentIndex')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AudioPlayerStateTableTable audioPlayerStateTable =
      $AudioPlayerStateTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [audioPlayerStateTable];
}

typedef $$AudioPlayerStateTableTableCreateCompanionBuilder =
    AudioPlayerStateTableCompanion Function({
      Value<int> id,
      required bool playing,
      required PlaylistMode loopMode,
      required bool shuffled,
      required List<String> collections,
      Value<List<ToneHarborTrackObject>> tracks,
      Value<int> currentIndex,
    });
typedef $$AudioPlayerStateTableTableUpdateCompanionBuilder =
    AudioPlayerStateTableCompanion Function({
      Value<int> id,
      Value<bool> playing,
      Value<PlaylistMode> loopMode,
      Value<bool> shuffled,
      Value<List<String>> collections,
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

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get collections => $composableBuilder(
    column: $table.collections,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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

  ColumnOrderings<String> get collections => $composableBuilder(
    column: $table.collections,
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

  GeneratedColumnWithTypeConverter<List<String>, String> get collections =>
      $composableBuilder(
        column: $table.collections,
        builder: (column) => column,
      );

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
                Value<List<String>> collections = const Value.absent(),
                Value<List<ToneHarborTrackObject>> tracks =
                    const Value.absent(),
                Value<int> currentIndex = const Value.absent(),
              }) => AudioPlayerStateTableCompanion(
                id: id,
                playing: playing,
                loopMode: loopMode,
                shuffled: shuffled,
                collections: collections,
                tracks: tracks,
                currentIndex: currentIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required bool playing,
                required PlaylistMode loopMode,
                required bool shuffled,
                required List<String> collections,
                Value<List<ToneHarborTrackObject>> tracks =
                    const Value.absent(),
                Value<int> currentIndex = const Value.absent(),
              }) => AudioPlayerStateTableCompanion.insert(
                id: id,
                playing: playing,
                loopMode: loopMode,
                shuffled: shuffled,
                collections: collections,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AudioPlayerStateTableTableTableManager get audioPlayerStateTable =>
      $$AudioPlayerStateTableTableTableManager(_db, _db.audioPlayerStateTable);
}
