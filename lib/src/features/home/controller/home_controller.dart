import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/utils/strings.dart';

class HomeController {

  Future<Position> getInitialPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Message.locationDisabled;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Message.locationDenied;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Message.locationPermanentlyDenied;
    }

    return await Geolocator.getCurrentPosition();
  }
}