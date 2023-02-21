import 'package:injectable/injectable.dart';
import 'package:locator/services/location_service/location_service_base.dart';

@injectable
class PostLocationUseCase {
  PostLocationUseCase(this._locationService);

  final LocationService _locationService;

  Future<void> call(
          {required String imei,
          required String id,
          required String status}) async =>
      (await _locationService.postLocation(imei, id, status));
}
