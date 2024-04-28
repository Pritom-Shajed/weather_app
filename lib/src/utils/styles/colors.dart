import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static Color baseColor =  const Color(0xFF1B1E23);
  static Color primaryColor = const Color(0xFF97ABFF);
  static Color secondaryColor = const Color(0xFF123597);
  static Color baseFontColor = Colors.white;
  static Color whiteColor =  Colors.white;

  static Color hintTextColor = const Color(0xFFa8a8a8);

  static LinearGradient gradientColorBg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.primaryColor,
      AppColors.secondaryColor
    ],
  );

  static LinearGradient gradientColorCard = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.white.withOpacity(0.40), Colors.white.withOpacity(0.10)]
  );
}
