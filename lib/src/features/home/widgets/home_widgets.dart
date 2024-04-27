import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/components/global_widgets/icon/network_icon.dart';
import 'package:weather_app/src/components/global_widgets/icon/svg_icon.dart';
import 'package:weather_app/src/components/global_widgets/text/app_texts.dart';
import 'package:weather_app/src/core/environment/environment.dart';
import 'package:weather_app/src/utils/colors.dart';
import 'package:weather_app/src/utils/const/time_formatter/time_formatter.dart';
import 'package:weather_app/src/utils/dimensions.dart';
import 'package:weather_app/src/utils/icons.dart';

class HomeWidgets {
  HomeWidgets._();

  static Widget forecastCard ({required String time, required String iconPath, required dynamic temp}){
    return Container(
      margin: REdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
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
      child: Column(
        children: [
          AppTexts.mediumText(text: time),
          NetworkIcon(iconPath: '${Environment.iconBaseUrl}$iconPath.png', size: 48.h,),
          AppTexts.mediumText(text: '$temp°'),
        ],
      ),
    );
  }

  static Widget sunriseSunsetCard ({required int sunriseTime, required int sunsetTime}){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      decoration: BoxDecoration(
          gradient: AppColors.gradientColorCard,
          border: Border.all(color: AppColors.whiteColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(Dimensions.radius16),
          boxShadow: [
            BoxShadow(
                color: AppColors.whiteColor,
                blurRadius: 1,
                blurStyle: BlurStyle.outer,
                spreadRadius: 0
            )
          ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgIcon(iconPath: AppIcons.sunriseIcon),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTexts.mediumText(text: 'Sunrise'),
              AppTexts.largeText(text: formatSunriseSunsetTime(sunriseTime)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTexts.mediumText(text: 'Sunset'),
              AppTexts.largeText(text: formatSunriseSunsetTime(sunsetTime)),
            ],
          ),
        ],
      ),
    );
  }
}