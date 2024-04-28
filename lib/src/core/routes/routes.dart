import 'package:flutter/material.dart';
import 'package:weather_app/src/features/forecast/presentation/forecast_page.dart';
import 'package:weather_app/src/features/home/presentation/home_page.dart';

class RouteGenerator {
  static const String home = '/';
  static const String forecast = '/forecast';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: routeSettings,
        );
      case forecast:
        return MaterialPageRoute(
          builder: (_) => const ForecastPage(),
          settings: routeSettings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: routeSettings,
        );
    }
  }
}
