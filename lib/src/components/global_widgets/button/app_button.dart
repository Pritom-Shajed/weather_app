import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/components/global_widgets/text/app_texts.dart';
import 'package:weather_app/src/utils/styles/colors.dart';
import 'package:weather_app/src/utils/styles/dimensions.dart';

class AppButton {
  AppButton._();

  static Widget primaryBtn ({VoidCallback? onTap, required String text}) =>   GestureDetector(
    onTap: onTap,
    child: Container(
        padding: REdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration: BoxDecoration(
            gradient: AppColors.gradientColorCard,
            borderRadius: BorderRadius.circular(Dimensions.radius100),
            boxShadow: [
              BoxShadow(
                  color: AppColors.whiteColor,
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 0
              )
            ]
        ),
        child: AppTexts.mediumText(text: text)
    ),
  );

  static Widget iconBtn ({VoidCallback? onTap, required IconData icon, Color? color}) =>   IconButton(onPressed: onTap, icon: Icon(icon, color: color ?? AppColors.whiteColor),);

}