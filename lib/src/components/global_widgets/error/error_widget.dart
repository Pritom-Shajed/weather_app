import 'package:flutter/material.dart';
import 'package:weather_app/src/components/global_widgets/text/app_texts.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;

  const AppErrorWidget({
    Key? key,
   required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTexts.smallText(
          text: message,
        ),
      ),
    );
  }
}