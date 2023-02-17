import 'package:equatable/equatable.dart';
import 'package:workmanager_example/data/models/lat_long.dart';

class CachedLatLongState extends Equatable {
  final LatLongStatus status;
  final String statusText;
  final List<CachedLatLong> cachedLatLong;

  const CachedLatLongState({
    required this.status,
    required this.statusText,
    required this.cachedLatLong,
  });

  CachedLatLongState copyWith({
    LatLongStatus? status,
    List<CachedLatLong>? cachedLatLong,
    String? statusText,
  }) =>
      CachedLatLongState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        cachedLatLong: cachedLatLong ?? this.cachedLatLong,
      );

  @override
  List<Object?> get props => [
        status,
        statusText,
        CachedLatLong,
      ];
}

enum LatLongStatus {
  loading,
  pure,
  locationAdded,
  locationDeleted,
}