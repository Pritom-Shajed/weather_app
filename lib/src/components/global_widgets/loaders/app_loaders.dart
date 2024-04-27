import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:weather_app/src/utils/colors.dart';
import 'package:weather_app/src/utils/dimensions.dart';

class AppLoaders {
  AppLoaders._();

  static showOverlayLoader (BuildContext context){
    context.loaderOverlay.show(
      widgetBuilder: (progress) {
        return _overlayLoader();
      },
    );
  }

  static hideOverlayLoader(BuildContext context) {
    context.loaderOverlay.hide();
  }


  static Widget pulse ({double? size, Color? color}){
    return SpinKitPulse(
      color:  color ?? AppColors.whiteColor,
      size: size ?? 30.r,
    );
  }
}

Widget _overlayLoader (){
  return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.5,
          sigmaY: 4.5,
        ),
        child: Center(
          child: Container(
            width: 70.w,
            height: 70.w,
            padding: REdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(Dimensions.radius8),
            ),
            child: AppLoaders.pulse(),
          ),
        ),
      ));
}