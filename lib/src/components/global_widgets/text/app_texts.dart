import 'package:flutter/material.dart';
import 'package:weather_app/src/utils/styles/colors.dart';
import 'package:weather_app/src/utils/styles/dimensions.dart';
import 'package:weather_app/src/utils/styles/fonts.dart';

class AppTexts {
  AppTexts._();

  static Widget largeText ({required String text,TextAlign? textAlign,  Color? color,double? fontSize, FontWeight? fontWeight}){
    return Text(text, textAlign: textAlign,  style: TextStyle(color: color ?? AppColors.baseFontColor,overflow: TextOverflow.ellipsis,fontFamily: AppFonts.circularStd,  fontSize: fontSize ?? Dimensions.fontSize18, fontWeight: fontWeight),);
  }

  static Widget extraLargeText ({required String text, TextAlign? textAlign, Color? color, double? fontSize, FontWeight? fontWeight}){
    return Text(text,textAlign: textAlign,  style: TextStyle(color: color ?? AppColors.baseFontColor,overflow: TextOverflow.ellipsis, fontFamily: AppFonts.circularStd,  fontSize: fontSize ?? Dimensions.fontSize32, fontWeight: fontWeight),);
  }


  static Widget mediumText ({required String text, TextAlign? textAlign, Color? color,double? fontSize, FontWeight? fontWeight}){
    return Text(text, textAlign: textAlign, style: TextStyle(color: color ?? AppColors.baseFontColor, overflow: TextOverflow.ellipsis,fontFamily: AppFonts.circularStd, fontSize: fontSize ?? Dimensions.fontSize14, fontWeight: fontWeight ),);
  }

  static Widget smallText ({required String text, TextAlign? textAlign,double? fontSize, Color? color, FontWeight? fontWeight}){
    return Text(text, textAlign: textAlign, style: TextStyle(color: color ?? AppColors.baseFontColor,overflow: TextOverflow.ellipsis,fontFamily: AppFonts.circularStd,  fontSize: fontSize ?? Dimensions.fontSize12, fontWeight: fontWeight ),);
  }

  static Widget extraSmallText ({required String text,TextAlign? textAlign,  Color? color,double? fontSize, FontWeight? fontWeight}){
    return Text(text,textAlign: textAlign, style: TextStyle(color: color ?? AppColors.baseFontColor,overflow: TextOverflow.ellipsis,fontFamily: AppFonts.circularStd,  fontSize: fontSize ?? Dimensions.fontSize10, fontWeight: fontWeight),);
  }
}