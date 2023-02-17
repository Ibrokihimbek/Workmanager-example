import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager_example/cubit/get_lat_long_qubit/get_lat_long_state.dart';
import 'package:workmanager_example/data/models/lat_long.dart';
import 'package:workmanager_example/data/repositories/lat_long_repository.dart';

class GetLatLongCubit extends Cubit<GetLatLongState> {
  final CachedLatLongRepository latLongRepository;

  GetLatLongCubit({required this.latLongRepository})
      : super(GetLatLongInitial());

  List<CachedLatLong> cachedLAtLong = [];

  fetchAllContacts() async {
    emit(GetLatLongInLoading());
    cachedLAtLong = await latLongRepository.getAllLatLongs();
    emit(GetLatLongInSuccess(cachedLatLong: cachedLAtLong));
  }
}
