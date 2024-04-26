class Message {
  Message._();

  /// network error message
  static const String locationDisabled = "Location services are disabled";
  static const String locationDenied = "Location permissions are denied";
  static const String locationPermanentlyDenied = "Location permissions are permanently denied, we cannot request permissions";
  static const String noInternet = "Please check your connection!";
  static const String error401 = "Unauthorized!";
  static const String error404 = "Page Not Found!";
  static const String error500 = "Server Error!";
  static const String unknown = "Something went wrong!";
  static const String badResponse = "Bad response format!";
}