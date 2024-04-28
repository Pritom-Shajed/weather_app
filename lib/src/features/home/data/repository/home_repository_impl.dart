import 'dart:developer';

import 'package:weather_app/src/features/home/data/data_source/home_data_source.dart';
import 'package:weather_app/src/features/home/data/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl({required this.dataSource});

  @override
  Future<Map<String, dynamic>> fetchWeatherByLatLon({required String lat, required String lon, required String units}) async{
    var response = await dataSource.fetchWeatherByLatLon(lat: lat, lon: lon, units: units);

    return response;
  }

  @override
  Future<Map<String, dynamic>> fetchWeatherForecast({required String lat, required String lon, required String units}) async{
    var response = await dataSource.fetchWeatherForecast(lat: lat, lon: lon, units: units);

    return response;
  }

  @override
  Future<Map<String, dynamic>> fetchWeatherByQuery({required String query, required String units}) async{
    var response = await dataSource.fetchWeatherByQuery(query: query, units: units);

    return response;
  }

  @override
  Future<Map<String, dynamic>> fetchWeatherForecastByQuery({required String query, required String units}) async{
    var response = await dataSource.fetchWeatherForecastByQuery(query: query, units: units);

    return response;
  }

}