import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:workmanager/workmanager.dart';
import 'package:workmanager_example/data/models/lat_long.dart';

import 'lat_long_state.dart';

class LatLongCubit extends Cubit<LatLongState> {
  LatLongCubit()
      : super(
          LatLongState(
            latLong: CachedLatLong(
              long: 0,
              lat: 0,
              dateTime: DateTime.now().toString(),
            ),
          ),
        ) {
    listenCurrentLocation();
    fetchCurrentLocation();
  }

  Location location = Location();

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  Future<void> fetchCurrentLocation() async {
//1- qadam location qurilmada enable yoki disable ekanini tekshiradi
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

//2- qadam lakatsiyaga permission oladi

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    Workmanager().registerPeriodicTask(
      "task-identifier",
      "simpleTask",
    );
    // lakatsiyani oladi

    // LocationData locationData = await location.getLocation();
    // CachedLatLong latLong = CachedLatLong(
    //   long: locationData.longitude!,
    //   lat: locationData.longitude!,
    //   dateTime: DateTime.now().toString(),
    // );
    // emit(
    //   state.copyWith(latLong: latLong),
    // );
  }

  listenCurrentLocation() {
    location.onLocationChanged.listen(
      (event) {
        // print("LOCATION CHANGED: ${event.longitude}, ${event.latitude}");
      },
    );
  }
}
