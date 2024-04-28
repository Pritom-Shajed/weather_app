import 'package:weather_app/src/features/home/data/model/weather_forecast_model.dart';

List<WeatherList> filterForecastDate ({required List<WeatherList> forecastData}){
  String extractDate(String value) {
    return value.split(' ')[0];
  }

  // Create a set to store unique dates
  Set<String> uniqueDates = {};

  // List to store filtered models
  List<WeatherList> filteredModels = [];

  for (WeatherList model in forecastData) {
    String date = extractDate(model.dtTxt!);
    if (!uniqueDates.contains(date)) {
      // Add the first occurrence of each unique date to the filtered list
      uniqueDates.add(date);
      filteredModels.add(model);
    }
  }

  // Print filtered models
 return filteredModels;
}