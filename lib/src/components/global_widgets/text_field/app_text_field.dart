import 'package:flutter/material.dart';
import 'package:weather_app/src/utils/colors.dart';
import 'package:weather_app/src/utils/dimensions.dart';

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
        style: TextStyle(color: Colors.black, fontSize: Dimensions.fontSize14),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor.withOpacity(0.2),
          hintText: hintText ?? 'Search',
          hintStyle: TextStyle(color: Colors.black, fontSize: Dimensions.fontSize14),
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