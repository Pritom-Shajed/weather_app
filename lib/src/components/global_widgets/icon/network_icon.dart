import 'package:flutter/material.dart';

class NetworkIcon extends StatelessWidget {
  final String iconPath;
  final double? size;
  final Color? color;
  const NetworkIcon({super.key, this.size, this.color, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Image.network(iconPath, width: size, height: size, color: color,);
  }
}
