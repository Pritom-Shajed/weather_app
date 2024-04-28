import '../../data/repository/home_repository.dart';

class HomeUseCase{
  final HomeRepository homeRepository;

  HomeUseCase({required this.homeRepository});

  Future<Map<String, dynamic>> fetchWeatherByLatLon ({required String lat, required String lon, required String units}) async{
    return await homeRepository.fetchWeatherByLatLon(lat: lat, lon: lon, units: units);
  }

  Future<Map<String, dynamic>> fetchWeatherForecast ({required String lat, required String lon, required String units}) async{
    return await homeRepository.fetchWeatherForecast(lat: lat, lon: lon, units: units);
  }

  Future<Map<String, dynamic>> fetchWeatherByQuery ({required String query, required String units}) async{
    return await homeRepository.fetchWeatherByQuery(query: query, units: units);
  }

  Future<Map<String, dynamic>> fetchWeatherForecastByQuery ({required String query, required String units}) async{
    return await homeRepository.fetchWeatherForecastByQuery(query: query, units: units);
  }
}