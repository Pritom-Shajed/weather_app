import 'package:weather_app/src/core/environment/environment.dart';

class Api {
  Api._();
  static final String _baseUrl = Environment.baseApiUrl;
  static final String _apiKey = Environment.apiKey;

  static String getWeatherByLatLon ({required String lat, required String lon, String units = 'metric'}) => '${_baseUrl}weather?lat=$lat&lon=$lon&units=$units&appid=$_apiKey';
  static String getWeatherForcast ({required String lat, required String lon, String units = 'metric'}) => '${_baseUrl}forecast?lat=$lat&lon=$lon&units=$units&appid=$_apiKey';
  static String getWeatherBySearch ({required String query, String units = 'metric'}) => '${_baseUrl}weather?q=$query&units=$units&appid=$_apiKey';
  static String getWeatherForecastBySearch ({required String query, String units = 'metric'}) => '${_baseUrl}forecast?q=$query&units=$units&appid=$_apiKey';
}
