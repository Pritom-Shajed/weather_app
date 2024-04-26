import 'dart:developer';

import 'package:weather_app/src/features/home/data/data_source/home_data_source.dart';
import 'package:weather_app/src/features/home/data/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl({required this.dataSource});

  @override
  Future<Map<String, dynamic>> fetchWeatherByLatLon({required String lat, required String lon}) async{
    var response = await dataSource.fetchWeatherByLatLon(lat: lat, lon: lon);

    return response;
  }

}