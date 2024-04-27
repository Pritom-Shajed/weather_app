part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState{}

class HomeLoading extends HomeState{}

class HomeWeatherLoaded extends HomeState{
  final WeatherData weatherData;
  final WeatherForecastData weatherForecastData;

  HomeWeatherLoaded({required this.weatherData, required this.weatherForecastData});
}



class HomeError extends HomeState{
  final String msg;
  HomeError({required this.msg});
}