import 'package:geolocator/geolocator.dart';

class UserLocation {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    print('Hello');
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;

      print(position);
    } catch (e) {
      print(e);

    }
  }
}
