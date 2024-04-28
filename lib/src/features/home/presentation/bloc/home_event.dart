part of 'home_bloc.dart';

abstract class HomeEvent {}

class FetchWeatherInitial extends HomeEvent {
  final bool isCelsius;
  FetchWeatherInitial({ required this.isCelsius});
}

class FetchWeatherByQuery extends HomeEvent {
  final String query;
  final bool isCelsius;
  FetchWeatherByQuery({required this.query, required this.isCelsius});
}