import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/components/global_widgets/icon/network_icon.dart';
import 'package:weather_app/src/components/global_widgets/text/app_texts.dart';
import 'package:weather_app/src/core/environment/environment.dart';
import 'package:weather_app/src/features/home/data/model/weather_forecast_model.dart';
import 'package:weather_app/src/utils/styles/colors.dart';
import 'package:weather_app/src/utils/styles/dimensions.dart';

class ForecastWidgets {
  ForecastWidgets._();
  static Widget forecastCard ({required WeatherList  weatherInfo, required bool isDateToday}) => Container(
    padding: REdgeInsets.only(left: 16, right: 32, top: 12, bottom: 12),
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
    child: Row(
      children: [
        NetworkIcon(iconPath: '${Environment.iconBaseUrl}${weatherInfo.weather!.first.icon}@2x.png', size: 64.h,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTexts.largeText(text: isDateToday ? 'Today' : DateFormat('E').format(DateTime.parse(weatherInfo.dtTxt!))),
                  AppTexts.largeText(text: '${weatherInfo.main?.temp.round()}°'),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTexts.mediumText(text: 'Min Temp: ${weatherInfo.main?.tempMin.round()}°'),
                      AppTexts.mediumText(text: 'Max Temp: ${weatherInfo.main?.tempMax.round()}°'),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppTexts.mediumText(text: 'Humidity: ${weatherInfo.main?.humidity}'),
                      AppTexts.mediumText(text: '${weatherInfo.weather?.first.description}'),
                    ],
                  )
                ],
              )


            ],
          ),
        ),
      ],
    ),
  );

}