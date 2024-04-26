import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/components/global_widgets/global_widgets.dart';
import 'package:weather_app/src/components/global_widgets/icon/network_icon.dart';
import 'package:weather_app/src/const/time_formatter/time_formatter.dart';
import 'package:weather_app/src/core/environment/environment.dart';
import 'package:weather_app/src/features/home/data/model/weather_model.dart';
import 'package:weather_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/src/features/home/widgets/home_widgets.dart';
import 'package:weather_app/src/utils/colors.dart';
import 'package:weather_app/src/utils/dimensions.dart';
import 'package:weather_app/src/utils/icons.dart';
import 'package:weather_app/src/utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchWeatherByLatLon());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state){
          if(state is HomeLoading){
            return const Center(child: CircularProgressIndicator(),);
          } else if(state is HomeLoaded){
            var weatherInfo = state.weatherData;
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: AppColors.gradientColorBg),
              child: Column(
                children: [
                  24.verticalSpace,
                  AppTexts.extraLargeText(text: '${weatherInfo.name}', fontWeight: FontWeight.bold),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NetworkIcon(iconPath: '${Environment.iconBaseUrl}${weatherInfo.weather?[0].icon}@4x.png',),
                      AppTexts.extraLargeText(text: '${weatherInfo.main?.temp.round()}°', fontSize: Dimensions.fontSize88, fontWeight: FontWeight.w500),
                    ],
                  ),
                  AppTexts.largeText(text: '${weatherInfo.weather!.first.main} - H:${weatherInfo.main!.tempMax.round()}° L:${weatherInfo.main!.tempMin.round()}°'),

                  const Spacer(),
                  Padding(
                    padding: REdgeInsets.all(24),
                    child: HomeWidgets.footerCard(sunriseTime: weatherInfo.sys!.sunrise!, sunsetTime: weatherInfo.sys!.sunset!),
                  )
                ],
              ),
            );
          } else if(state is HomeError){
            AppToasts.shortToast(state.msg);
            return Center(
              child: Text('Error: ${state.msg}'),
            );
          } else {
            return const Center(
              child: Text(Message.unknown),
            );
          }

        }),
      ),
    );
  }
}
