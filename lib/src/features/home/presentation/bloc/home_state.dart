part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState{}

class HomeLoading extends HomeState{}

class HomeLoaded extends HomeState{
  final WeatherData weatherData;

  HomeLoaded({required this.weatherData});
}

class HomeError extends HomeState{
  final String msg;
  HomeError({required this.msg});
}