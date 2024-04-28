abstract class HomeRepository {
    Future<Map<String, dynamic>> fetchWeatherByLatLon({required String lat, required String lon, required String units});
    Future<Map<String, dynamic>> fetchWeatherForecast({required String lat, required String lon, required String units});
    Future<Map<String, dynamic>> fetchWeatherByQuery({required String query, required String units});
    Future<Map<String, dynamic>> fetchWeatherForecastByQuery({required String query, required String units});
}

