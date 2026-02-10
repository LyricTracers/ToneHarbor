import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LyricsCacheKeyManager {
  static final LyricsCacheKeyManager _instance =
      LyricsCacheKeyManager._internal();
  factory LyricsCacheKeyManager() => _instance;
  LyricsCacheKeyManager._internal();

  Database? _database;

  static const String _databaseName = 'lyrics_preferences.db';
  static const int _databaseVersion = 1;

  static const String _tableName = 'lyrics_preferences';
  static const String _columnSong = 'song';
  static const String _columnArtist = 'artist';
  static const String _columnCacheKey = 'cache_key';

  Future<Database> get database async {
    if (_database != null && _database!.isOpen) return _database!;
    await initDatabase();
    return _database!;
  }

  Future<void> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _databaseName);

    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $_columnSong TEXT NOT NULL,
        $_columnArtist TEXT NOT NULL,
        $_columnCacheKey TEXT NOT NULL,
        PRIMARY KEY ($_columnSong, $_columnArtist)
      )
    ''');
  }

  Future<String?> getCacheKey(String song, String artist) async {
    final db = await database;
    final List<Map> maps = await db.query(
      _tableName,
      columns: [_columnCacheKey],
      where: '$_columnSong = ? AND $_columnArtist = ?',
      whereArgs: [song, artist],
    );

    if (maps.isNotEmpty) {
      return maps.first[_columnCacheKey] as String?;
    }
    return null;
  }

  Future<void> saveCacheKey(String song, String artist, String cacheKey) async {
    final db = await database;
    await db.insert(_tableName, {
      _columnSong: song,
      _columnArtist: artist,
      _columnCacheKey: cacheKey,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteCacheKey(String song, String artist) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: '$_columnSong = ? AND $_columnArtist = ?',
      whereArgs: [song, artist],
    );
  }

  Future<void> clearAll() async {
    final db = await database;
    await db.delete(_tableName);
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
