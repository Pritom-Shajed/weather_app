import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/home/data/model/weather_model.dart';
import 'package:weather_app/src/features/home/data/use_case/home_use_case.dart';

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
      
      var response = await homeUseCase.fetchWeatherByLatLon(lat: event.lat, lon: event.lon);

      WeatherData weatherData = WeatherData.fromJson(response);

      log('temp: ${weatherData.main?.temp}');
      log('feels like: ${weatherData.main?.feelsLike}');

      emit(HomeLoaded(weatherData: weatherData));
      
    } catch(e){
      log(e.toString());
      
      emit(HomeError(msg: e.toString()));
    }

  
  
  }
}