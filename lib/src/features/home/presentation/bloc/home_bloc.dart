import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/features/home/data/model/weather_model.dart';
import 'package:weather_app/src/features/home/data/use_case/home_use_case.dart';
import 'package:weather_app/src/utils/strings.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<FetchWeatherByLatLon, HomeState> {
  final HomeUseCase homeUseCase;

  HomeBloc({required this.homeUseCase}) : super(HomeInitial()){
    on<FetchWeatherByLatLon>(_fetchWeatherByLatLon);
  }
  _fetchWeatherByLatLon(FetchWeatherByLatLon event, Emitter<HomeState> emit) async{
    try {
      emit(HomeLoading());

      Position position = await _determinePosition();
      
      var response = await homeUseCase.fetchWeatherByLatLon(lat: '${position.latitude}', lon: '${position.longitude}');

      WeatherData weatherData = WeatherData.fromJson(response);

      log('temp: ${weatherData.main?.temp}');
      log('feels like: ${weatherData.main?.feelsLike}');

      emit(HomeLoaded(weatherData: weatherData));
      
    } catch(e){
      log(e.toString());
      
      emit(HomeError(msg: e.toString()));
    }
  
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Message.locationDisabled;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Message.locationDenied;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Message.locationPermanentlyDenied;
    }

    return await Geolocator.getCurrentPosition();
  }
}