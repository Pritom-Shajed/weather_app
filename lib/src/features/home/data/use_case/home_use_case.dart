import '../../data/repository/home_repository.dart';

class HomeUseCase{
  final HomeRepository homeRepository;

  HomeUseCase({required this.homeRepository});

  Future<Map<String, dynamic>> fetchWeatherByLatLon ({required String lat, required String lon}) async{
    return await homeRepository.fetchWeatherByLatLon(lat: lat, lon: lon);
  }
}