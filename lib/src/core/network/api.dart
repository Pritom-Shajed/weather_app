import 'package:weather_app/src/core/environment/environment.dart';

class Api {
  Api._();
  static final String _baseUrl = Environment.baseApiUrl;
  static final String _apiKey = Environment.apiKey;

  static String getWeatherByLatLon ({required String lat, required String lon}) => '${_baseUrl}weather?lat=$lat&lon=$lon&units=metric&appid=$_apiKey';
  static String getWeatherForcast ({required String lat, required String lon}) => '${_baseUrl}forecast?lat=$lat&lon=$lon&units=metric&appid=$_apiKey';
  static String getWeatherBySearch ({required String query}) => '${_baseUrl}weather?q=$query&units=metric&appid=$_apiKey';
  static String getWeatherForecastBySearch ({required String query}) => '${_baseUrl}forecast?q=$query&units=metric&appid=$_apiKey';
}
