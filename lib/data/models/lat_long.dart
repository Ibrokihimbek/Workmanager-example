import 'package:workmanager_example/data/local_db/cached_lat_long.dart';

class CachedLatLong {
  final int? id;
  final double long;
  final double lat;
  final String dateTime;

  CachedLatLong({
    this.id,
    required this.long,
    required this.lat,
    required this.dateTime,
  });

  CachedLatLong copyWith({
    int? id,
    double? long,
    double? lat,
    String? dateTime,
  }) =>
      CachedLatLong(
        dateTime: dateTime ?? this.dateTime,
        id: id ?? this.id,
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );

  static CachedLatLong fromJson(Map<String, Object?> json) => CachedLatLong(
        id: json[CachedLatLongFields.id] as int?,
        lat: json[CachedLatLongFields.lat] as double,
        long: json[CachedLatLongFields.long] as double,
        dateTime:  json[CachedLatLongFields.dateTime] as String,
      );

  Map<String, Object?> toJson() => {
        CachedLatLongFields.id: id,
        CachedLatLongFields.lat: lat,
        CachedLatLongFields.long: long,
        CachedLatLongFields.dateTime: dateTime,
      };

  @override
  String toString() => '''
        ID: $id
        USER NAME $lat 
        PHONE NUMBER $long 
        DATE TIME $dateTime
      ''';
}
