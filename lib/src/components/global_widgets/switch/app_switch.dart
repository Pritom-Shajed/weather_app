import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/components/global_widgets/global_widgets.dart';
import 'package:weather_app/src/utils/styles/colors.dart';

class AppSwitch {
  AppSwitch._();


  static Widget tempSwitch ({required bool isFahrenheit, required VoidCallback onSwitch}) => Row(
    children: [

      SizedBox(
        height: 30.h,
        width: 40.h,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Switch(
            value: isFahrenheit,
            activeColor: AppColors.secondaryColor,

            onChanged: (value) {
              onSwitch();
            },
          ),
        ),
      ),
      AppTexts.mediumText(text: 'Fahrenheit'),
    ],
  );
}