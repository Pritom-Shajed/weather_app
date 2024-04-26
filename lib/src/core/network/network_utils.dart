import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/core/environment/environment.dart';
import 'package:weather_app/src/core/helper/helper.dart';
import 'package:weather_app/src/utils/strings.dart';

class Network {

  static Future<http.Response> getRequest ({required String apiEndpoint, Map<String, String>? headers}) async{
    if(!await hasInternet){
      throw Message.noInternet;
    }

    Map<String, String> mainHeader = {
      'Accept': 'application/json',
    };

    http.Response response = await http.get(Uri.parse(apiEndpoint), headers: headers ?? mainHeader).timeout(const Duration(seconds: 15));

    return response;
  }


  static Future<http.Response> postRequest ({required String apiEndpoint, Map<String, String>? headers, Map<String, dynamic>? body}) async{
    if(!await hasInternet){
      throw Message.noInternet;
    }

    Map<String, String> mainHeader = {
      'Accept': 'application/json',
    };

    http.Response response = await http.post(Uri.parse(apiEndpoint), headers: headers ?? mainHeader, body: body).timeout(const Duration(seconds: 15));

    return response;
  }

  static Future<http.Response> putRequest ({required String apiEndpoint, Map<String, String>? headers, Map<String, dynamic>? body}) async{

    Map<String, String> mainHeader = {
      'Accept': 'application/json',
    };

    http.Response response = await http.put(Uri.parse(apiEndpoint), headers: headers ?? mainHeader, body: body).timeout(const Duration(seconds: 15));

    return response;
  }

  static Future<http.Response> patchRequest ({required String apiEndpoint, Map<String, String>? headers, Map<String, dynamic>? body}) async{

    Map<String, String> mainHeader = {
      'Accept': 'application/json',
    };

    http.Response response = await http.patch(Uri.parse(apiEndpoint), headers: headers ?? mainHeader, body: body).timeout(const Duration(seconds: 15));

    return response;
  }

  static handleResponse(http.Response response) async {
    try {
      if (!await hasInternet) {
        throw Message.noInternet;
      }

      if (response.statusCode >= 200 && response.statusCode <= 210) {

        if (response.body.isNotEmpty) {
          return json.decode(response.body);
        } else {
          return response.body;
        }
      } else if (response.statusCode == 401) {
        String msg = Message.error401;
        if (response.body.isNotEmpty) {
          if (json.decode(response.body)['message'] != null) {
            msg = json.decode(response.body)['message'];
          }
        }
        throw msg;
      } else if (response.statusCode == 404) {
        throw Message.error404;
      } else if (response.statusCode == 500) {
        throw Message.error500;
      } else {
        String msg = Message.unknown;

        throw msg;
      }
    } on SocketException catch (_) {
      throw Message.noInternet;
    } on FormatException catch (_) {
      throw Message.badResponse;
    } catch (e) {
      throw e.toString();
    }
  }

}

