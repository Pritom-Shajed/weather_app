import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/features/home/data/model/weather_forecast_model.dart';

String formatSunriseSunsetTime (int time) {
  DateTime sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);

  String formattedSunriseTime = DateFormat.jm().format(sunriseDateTime);

  return formattedSunriseTime;
}