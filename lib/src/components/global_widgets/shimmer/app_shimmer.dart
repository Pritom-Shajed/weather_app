import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/src/utils/styles/colors.dart';
import 'package:weather_app/src/utils/styles/dimensions.dart';

class AppShimmer {

  AppShimmer._();
  static Widget shimmerCircle(
      {Color? baseColor, Color? highlightColor, double? radius}) =>
      Shimmer.fromColors(
          baseColor: baseColor ?? AppColors.primaryColor,
          highlightColor: highlightColor ?? AppColors.secondaryColor,
          child: CircleAvatar(
            radius: radius,
          ));

  static Widget shimmerContainer(
      { double? height,
        double? width,
        Color? baseColor,
        Color? highlightColor,
        double? radius}) =>
      Shimmer.fromColors(
          baseColor: baseColor ?? AppColors.primaryColor,
          highlightColor: highlightColor ?? AppColors.secondaryColor,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(radius ?? Dimensions.radius8),
            ),
          ));
}