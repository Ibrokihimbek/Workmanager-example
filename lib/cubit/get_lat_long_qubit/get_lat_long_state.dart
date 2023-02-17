import 'package:workmanager_example/data/models/lat_long.dart';

abstract class GetLatLongState {}

class GetLatLongInitial extends GetLatLongState {}

class GetLatLongInLoading extends GetLatLongState {}

class GetLatLongInSuccess extends GetLatLongState {
  GetLatLongInSuccess({required this.cachedLatLong});

  final List<CachedLatLong> cachedLatLong;
}