import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/src/utils/styles/colors.dart';
import 'package:weather_app/src/utils/styles/dimensions.dart';

class AppToasts {
  AppToasts._();

  static void shortToast (message){
     Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.baseColor,
        textColor: Colors.white,
        fontSize: Dimensions.fontSize12,
    );
  }
}