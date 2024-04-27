import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/core/dependencies/dependencies.dart';
import 'package:weather_app/src/features/home/controller/home_controller.dart';
import 'package:weather_app/src/features/home/data/model/weather_forecast_model.dart';
import 'package:weather_app/src/features/home/data/model/weather_model.dart';
import 'package:weather_app/src/features/home/data/use_case/home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;

  HomeBloc({required this.homeUseCase}) : super(HomeInitial()){
    on<FetchWeatherInitial>(_fetchWeatherInitial);
  }


  _fetchWeatherInitial(FetchWeatherInitial event, Emitter<HomeState> emit) async{
    try {
      emit(HomeLoading());

      Position position = await sl<HomeController>().getInitialPosition();
      
      var responseWeather = await homeUseCase.fetchWeatherByLatLon(lat: '${position.latitude}', lon: '${position.longitude}');
      var responseWeatherForecast = await homeUseCase.fetchWeatherForecast(lat: '${position.latitude}', lon: '${position.longitude}');

      WeatherData weatherData = WeatherData.fromJson(responseWeather);

      WeatherForecastData weatherForecastData = WeatherForecastData.fromJson(responseWeatherForecast);

      emit(HomeWeatherLoaded(weatherData: weatherData, weatherForecastData: weatherForecastData));
      
    } catch(e){
      log(e.toString());
      
      emit(HomeError(msg: e.toString()));
    }
  
  }


}