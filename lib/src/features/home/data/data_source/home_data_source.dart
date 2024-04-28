abstract class HomeDataSource {
  Future fetchWeatherByLatLon({required String lat, required String lon, required String units});
  Future fetchWeatherForecast({required String lat, required String lon, required String units});

  Future fetchWeatherByQuery({required String query, required String units});
  Future fetchWeatherForecastByQuery({required String query, required String units});
}
