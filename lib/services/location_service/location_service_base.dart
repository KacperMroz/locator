abstract class LocationService {
  Future<void> postLocation(
    String imei,
    String id,
    String status,
  );
}
