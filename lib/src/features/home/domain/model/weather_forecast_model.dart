import 'package:intl/intl.dart';

class WeatherForecastData {
  List<WeatherList>? list;
  City? city;

  WeatherForecastData({this.list, this.city});

  WeatherForecastData.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <WeatherList>[];
      json['list'].forEach((v) {

        list!.add(WeatherList.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

}

class WeatherList {
  Main? main;
  List<Weather>? weather;
  String? dtTxt;
  String? forecastTime;

  WeatherList({this.main, this.weather, this.dtTxt, this.forecastTime});

  WeatherList.fromJson(Map<String, dynamic> json) {
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    dtTxt = json['dt_txt'];
    forecastTime = DateFormat('ha').format(DateTime.parse(json['dt_txt']));
  }
}


class Main {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  dynamic pressure;
  dynamic humidity;
  dynamic tempKf;

  Main(
      {this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity,
        this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }

}

class Weather {
  String? main;
  String? description;
  String? icon;

  Weather({this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

}

class City {
  String? name;
  String? country;

  City({this.name, this.country});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
  }

}