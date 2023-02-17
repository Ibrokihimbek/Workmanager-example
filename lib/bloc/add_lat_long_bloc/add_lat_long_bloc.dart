import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager_example/bloc/add_lat_long_bloc/add_lat_long_event.dart';
import 'package:workmanager_example/bloc/add_lat_long_bloc/add_lat_long_state.dart';
import 'package:workmanager_example/data/repositories/lat_long_repository.dart';

class CachedLatLongBloc extends Bloc<CachedLatLongEvent, CachedLatLongState> {
  CachedLatLongBloc(this.latLongRepository)
      : super(
          const CachedLatLongState(
            status: LatLongStatus.pure,
            statusText: '',
            cachedLatLong: [],
          ),
        ) {
    on<AddLatlong>(_addContact);
    on<DeleteLatlong>(_deleteContact);
  }

  final CachedLatLongRepository latLongRepository;

  _addContact(AddLatlong event, Emitter<CachedLatLongState> emit) async {
    emit(state.copyWith(status: LatLongStatus.loading));
    var newContact = await latLongRepository.insertLatLong(event.latlong);
    if (newContact.id != null) {
      emit(state.copyWith(status: LatLongStatus.locationAdded));
    }
  }

  _deleteContact(DeleteLatlong event, Emitter<CachedLatLongState> emit) async {
    emit(state.copyWith(status: LatLongStatus.loading));
    var deletedId = await latLongRepository.deleteLatLong();
    if (deletedId != -1) {
      emit(state.copyWith(status: LatLongStatus.locationDeleted));
    }
  }
}
