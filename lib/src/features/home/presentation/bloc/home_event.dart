part of 'home_bloc.dart';

abstract class HomeEvent {}

class FetchWeatherInitial extends HomeEvent {}

class FetchWeatherByQuery extends HomeEvent {
  final String query;

  FetchWeatherByQuery({required this.query});
}