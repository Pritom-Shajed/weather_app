abstract class HomeDataSource {
  Future fetchWeatherByLatLon({required String lat, required String lon});
  Future fetchWeatherForecast({required String lat, required String lon});
}
