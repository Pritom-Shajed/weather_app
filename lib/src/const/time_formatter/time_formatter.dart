import 'package:intl/intl.dart';

String formatSunriseSunsetTime (int time) {
  DateTime sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);

  String formattedSunriseTime = DateFormat.jm().format(sunriseDateTime);

  return formattedSunriseTime;
}