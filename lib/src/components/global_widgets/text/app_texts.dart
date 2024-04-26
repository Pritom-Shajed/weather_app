import 'package:flutter/material.dart';
import 'package:weather_app/src/utils/colors.dart';
import 'package:weather_app/src/utils/dimensions.dart';

class AppTexts {
  AppTexts._();

  static Widget largeText ({required String text, Color? color, FontWeight? fontWeight}){
    return Text(text, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize18, fontWeight: fontWeight),);
  }

  static Widget mediumText ({required String text, Color? color, FontWeight? fontWeight}){
    return Text(text, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize14, fontWeight: fontWeight ),);
  }

  static Widget smallText ({required String text, TextAlign? textAlign, Color? color, FontWeight? fontWeight}){
    return Text(text, textAlign: textAlign, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize12, fontWeight: fontWeight ),);
  }

  static Widget verySmallText ({required String text, Color? color, FontWeight? fontWeight}){
    return Text(text, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize10, fontWeight: fontWeight),);
  }
}