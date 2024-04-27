import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/components/global_widgets/shimmer/app_shimmer.dart';
import 'package:weather_app/src/utils/dimensions.dart';

class NetworkIcon extends StatelessWidget {
  final String iconPath;
  final double? size;
  final Color? color;
  const NetworkIcon({super.key, this.size, this.color, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 40,
    //   height: 40,
    //   decoration: BoxDecoration(
    //       image: DecorationImage(image: NetworkImage(iconPath))
    //   ),
    // );
    return CachedNetworkImage(
      imageUrl: iconPath,
      imageBuilder: (context, imageProvider) => Container(
        width: size ?? 150.h,
        height: size ?? 150.h,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => AppShimmer.shimmerContainer(radius: Dimensions.radius100, width: size ?? 150.h, height: size ?? 150.h,),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
    return Image.network(iconPath, width: size, height: size, color: color,);
  }
}
