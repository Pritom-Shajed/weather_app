import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  Environment._();

  static String get fileName {
    if(kReleaseMode){
      return '.env.production';
    } else {
      return '.env.development';
    }
  }

  static String get baseApiUrl {
    return dotenv.env['BASE_URL'] ?? 'API BASE URL NOT FOUND';
  }

  static String get apiKey {
    return dotenv.env['API_KEY'] ?? 'API KEY NOT FOUND';
  }

  static String get iconBaseUrl {
    return dotenv.env['ICON_BASE_URL'] ?? 'ICON BASE URL NOT FOUND';
  }

}