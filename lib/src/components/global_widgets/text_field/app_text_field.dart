import 'package:flutter/material.dart';
import 'package:weather_app/src/utils/colors.dart';
import 'package:weather_app/src/utils/dimensions.dart';

class AppTextField {
  AppTextField._();

  static Widget hintTextOnly(
      {TextEditingController? searchTextController, FocusNode? focusNode, ValueChanged<String>? onChanged, required String hintText}) {
    return TextField(
      controller: searchTextController,
      focusNode: focusNode,
      onChanged: onChanged,
      style: TextStyle(color: AppColors.baseFontColor, fontSize: Dimensions.fontSize14),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: AppColors.hintTextColor, fontSize: Dimensions.fontSize14),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),);
  }
}