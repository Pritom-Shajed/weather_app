import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class LottieIcon extends StatelessWidget {
  final String iconPath;
  final double? size;
  final Color? color;
  const LottieIcon({super.key, this.size, this.color, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(iconPath, width: size, height: size);
  }
}
