import 'package:flutter/material.dart';
import 'package:weather_app/src/utils/styles/colors.dart';
import 'package:weather_app/src/utils/styles/dimensions.dart';

class AppTextField {
  AppTextField._();

  static Widget hintTextOnly(
      {TextEditingController? searchTextController, FocusNode? focusNode, ValueChanged<String>? onChanged, String? hintText}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius100),
        boxShadow: [
          BoxShadow(
              color: AppColors.baseColor,
              blurRadius: 2,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
          )
        ]
      ),
      child: TextField(
        controller: searchTextController,
        focusNode: focusNode,
        onChanged: onChanged,
        style: TextStyle(color: AppColors.whiteColor, fontSize: Dimensions.fontSize14),
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          prefixIcon: Icon(Icons.search, color: AppColors.whiteColor,),
          fillColor: AppColors.whiteColor.withOpacity(0.1),
          hintText: hintText ?? 'Search',
          hintStyle: TextStyle(color: AppColors.whiteColor, fontSize: Dimensions.fontSize14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius100),
            borderSide: const BorderSide(color: Colors.transparent)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius100),
              borderSide: const BorderSide(color: Colors.transparent)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius100),
              borderSide: const BorderSide(color: Colors.transparent)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius100),
              borderSide: const BorderSide(color: Colors.transparent)
          ),
        ),),
    );
  }
}