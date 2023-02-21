import 'package:injectable/injectable.dart';
import 'package:locator/services/location_service/location_service_base.dart';

@LazySingleton(as: LocationService)
class LocationServiceImpl extends LocationService {
  @override
  Future<void> postLocation(String imei, String id, String status) async {
    //TODO UNCOMMENT WHEN BE IS READY
    // final Response response = await DioProvider.dio.post('');
  }
}
