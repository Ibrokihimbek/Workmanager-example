import 'package:equatable/equatable.dart';
import 'package:workmanager_example/data/models/lat_long.dart';

class LatLongState extends Equatable {
  final CachedLatLong latLong;
  LatLongState({required this.latLong});

  LatLongState copyWith({CachedLatLong? latLong}) =>
      LatLongState(latLong: latLong ?? this.latLong);
  @override
  List<Object?> get props => [latLong];
}
