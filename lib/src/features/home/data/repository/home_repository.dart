abstract class HomeRepository {
    Future<Map<String, dynamic>> fetchWeatherByLatLon({required String lat, required String lon});
    Future<Map<String, dynamic>> fetchWeatherForecast({required String lat, required String lon});
}

