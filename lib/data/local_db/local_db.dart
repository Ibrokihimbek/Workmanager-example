import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workmanager/data/local_db/cached_lat_long.dart';
import 'package:workmanager/data/models/lat_long.dart';


class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("latlong.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";

    await db.execute('''
    CREATE TABLE $latLongTable (
    ${CachedLatLongFields.id} $idType,
    ${CachedLatLongFields.lat} $textType,
    ${CachedLatLongFields.long} $textType,
    ${CachedLatLongFields.dateTime} $textType
    )
    ''');
  }

  LocalDatabase._init();

  //-------------------------------------------Cached Users Table------------------------------------

  static Future<CachedLatLong> insertCachedLatLong(CachedLatLong cachedLatLong) async {
    final db = await getInstance.database;
    final id = await db.insert(latLongTable, cachedLatLong.toJson());
    return cachedLatLong.copyWith(id: id);
  }



  static Future<List<CachedLatLong>> getAllCachedLatLongs() async {
    final db = await getInstance.database;
    const orderBy = "${CachedLatLongFields.dateTime} ASC";
    final result = await db.query(
      latLongTable,
      orderBy: orderBy,
    );
    return result.map((json) => CachedLatLong.fromJson(json)).toList();
  }





  static Future<int> deleteAllCachedLatLongs() async {
    final db = await getInstance.database;

    return await db.delete(latLongTable);
  }
}


