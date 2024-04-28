part of 'home_bloc.dart';

abstract class HomeState {
}

class HomeInitial extends HomeState{}

class HomeSearch extends HomeState{
  final String query;
  HomeSearch({this.query=''});
}

class HomeLoading extends HomeState{}

class HomeWeatherLoaded extends HomeState{
  final WeatherData weatherData;
  final WeatherForecastData weatherForecastData;
  final bool isCelsius;
  HomeWeatherLoaded({required this.weatherData, required this.weatherForecastData, required this.isCelsius});
}



class HomeError extends HomeState{
  final String msg;
  HomeError({required this.msg});
}
