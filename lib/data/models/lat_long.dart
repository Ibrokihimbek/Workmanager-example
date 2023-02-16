import 'package:workmanager/data/local_db/cached_lat_long.dart';

class CachedLatLong {
  final int? id;
  final String long;
  final String lat;
  final DateTime dateTime;

  CachedLatLong({
    this.id,
    required this.long,
    required this.lat,
    required this.dateTime,
  });

  CachedLatLong copyWith({
    int? id,
    String? long,
    String? lat,
    DateTime? dateTime,
  }) =>
      CachedLatLong(
        dateTime: dateTime ?? this.dateTime,
        id: id ?? this.id,
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );

  static CachedLatLong fromJson(Map<String, Object?> json) => CachedLatLong(
        id: json[CachedLatLongFields.id] as int?,
        lat: json[CachedLatLongFields.lat] as String,
        long: json[CachedLatLongFields.long] as String,
        dateTime:  json[CachedLatLongFields.dateTime] as DateTime,
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
