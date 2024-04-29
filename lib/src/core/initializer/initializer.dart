import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/src/components/global_widgets/error/error_widget.dart';
import 'package:weather_app/src/core/environment/environment.dart';
import 'package:weather_app/src/core/dependencies/dependencies.dart' as dep;

abstract class Initializer {
  Initializer._();

  static void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return AppErrorWidget(
        message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        log(details.stack.toString());
      };

      await _initServices();

      HttpOverrides.global = MyHttpOverrides();

      await Future.delayed(const Duration(milliseconds: 150));

      runApp();
    }, (error, stack) {
      log('runZonedGuarded: ${error.toString()}');
    });
  }

  static Future<void> _initServices() async {
    try {

      _initScreenPreference();

      await _dependencyInjection();

      await _loadEnv();


    } catch (err) {
      rethrow;
    }
  }


  static Future<void> _dependencyInjection () async{
    await dep.init();
  }

  static Future<void> _loadEnv () async{
    await dotenv.load(fileName: Environment.fileName);
  }



  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }


}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}