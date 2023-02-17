import 'package:workmanager_example/data/local_db/local_db.dart';
import 'package:workmanager_example/data/models/lat_long.dart';

class CachedLatLongRepository {
  static final CachedLatLongRepository _instance = CachedLatLongRepository._();

  factory CachedLatLongRepository() {
    return _instance;
  }

  CachedLatLongRepository._();

  /// Fetch data From Local DB
  Future<CachedLatLong> insertLatLong(CachedLatLong cachedLatLong) =>
      LocalDatabase.insertCachedLatLong(cachedLatLong);

  /// Delete LatLong
  Future<int> deleteLatLong() => LocalDatabase.deleteAllCachedLatLongs();

  /// Get all LatLong
  Future<List<CachedLatLong>> getAllLatLongs() =>
      LocalDatabase.getAllCachedLatLongs();
}
