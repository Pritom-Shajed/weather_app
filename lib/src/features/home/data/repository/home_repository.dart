abstract class HomeRepository {
    Future<Map<String, dynamic>> fetchWeatherByLatLon({required String lat, required String lon});
}

