part of 'home_bloc.dart';

abstract class HomeEvent {}

class FetchWeatherByLatLon extends HomeEvent {
  final String lat;
  final String lon;

  FetchWeatherByLatLon({required this.lat, required this.lon});
}