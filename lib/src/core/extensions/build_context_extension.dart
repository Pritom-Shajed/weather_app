import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void unFocusKeyboard() => FocusScope.of(this).unfocus();

  dynamic get getArguments => ModalRoute.of(this)?.settings.arguments;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  Size get screenSize => MediaQuery.of(this).size;

  void pop({dynamic result}) => Navigator.of(this).pop(result);

  Future push(Widget nextPage) => Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
      );

  Future pushReplacement(Widget nextPage) => Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
      );

  Future pushAndRemoveUntil(Widget nextPage) => Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
        (route) => false,
      );

  Future pushNamed({
    required String routeName,
    dynamic arguments,
  }) =>
      Navigator.pushNamed(
        this,
        routeName,
        arguments: arguments,
      );

  Future pushReplacementNamed({
    required String routeName,
    dynamic arguments,
  }) =>
      Navigator.pushReplacementNamed(
        this,
        routeName,
        arguments: arguments,
      );

  Future pushNamedAndRemoveUntil({
    required String routeName,
    dynamic arguments,
  }) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        routeName,
        (route) => false,
        arguments: arguments,
      );
}
