import 'package:workmanager_example/data/models/lat_long.dart';

abstract class CachedLatLongEvent {}

class AddLatlong extends CachedLatLongEvent{
  AddLatlong({required this.latlong});

  final CachedLatLong latlong;
}

class DeleteLatlong extends CachedLatLongEvent{
  DeleteLatlong({required this.latlongId});

  final int latlongId;
}