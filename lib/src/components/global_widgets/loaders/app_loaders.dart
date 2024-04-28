import 'package:flutter/material.dart';
import 'package:weather_app/src/components/global_widgets/icon/lottie_icon.dart';
import 'package:weather_app/src/utils/styles/icons.dart';

class AppLoaders {
  AppLoaders._();



  static Widget showLoader ({double? size, Color? color}){
    return LottieIcon(
      iconPath: AppIcons.lottieWeather,
      color: Colors.white,
    );
  }
}
