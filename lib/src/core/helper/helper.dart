import 'package:connectivity_plus/connectivity_plus.dart';

/// to check internet connection, it return bool type value
Future<bool> get hasInternet async {
  List<ConnectivityResult> result = await (Connectivity().checkConnectivity());
  if (result.contains(ConnectivityResult.none)) {
    return false;
  } else {
    return true;
  }
}