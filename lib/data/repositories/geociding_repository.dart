import 'package:workmanager/data/api/api_service.dart';
import 'package:workmanager/data/models/lat_long.dart';
import 'package:workmanager/data/models/my_response/response_model.dart';

class GeocodingRepo {
  GeocodingRepo({required this.apiService});

  final ApiService apiService;

  Future<AppResponse> getAddress(CachedLatLong latLong, String kind) =>
      apiService.getLocationName(
          geoCodeText: "${latLong.long},${latLong.lat}", kind: kind);
}
