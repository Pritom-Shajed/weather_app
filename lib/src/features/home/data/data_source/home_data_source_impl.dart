import 'package:weather_app/src/core/network/api.dart';
import 'package:weather_app/src/core/network/network_utils.dart';
import 'home_data_source.dart';

class HomeDataSourceImpl extends HomeDataSource {
  @override
  Future fetchWeatherByLatLon({required String lat, required String lon, required String units}) async {


    dynamic response = await Network.handleResponse(
        await Network.getRequest(apiEndpoint: Api.getWeatherByLatLon(lat: lat, lon: lon, units: units)));

    return response;
  }

  @override
  Future fetchWeatherForecast({required String lat, required String lon, required String units}) async {


    dynamic response = await Network.handleResponse(
        await Network.getRequest(apiEndpoint: Api.getWeatherForcast(lat: lat, lon: lon, units: units)));

    return response;
  }

  @override
  Future<Map<String, dynamic>> fetchWeatherByQuery({required String query, required String units}) async{
    dynamic response = await Network.handleResponse(
        await Network.getRequest(apiEndpoint: Api.getWeatherBySearch(query: query, units: units)));

    return response;
  }

  @override
  Future<Map<String, dynamic>> fetchWeatherForecastByQuery({required String query, required String units}) async{
    dynamic response = await Network.handleResponse(
        await Network.getRequest(apiEndpoint: Api.getWeatherForecastBySearch(query: query, units: units)));

    return response;
  }

}