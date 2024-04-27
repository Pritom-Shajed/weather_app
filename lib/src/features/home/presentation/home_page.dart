import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
    _fetchInitialWeatherInfo();
    super.initState();
  }

  _fetchInitialWeatherInfo () {
    context.read<HomeBloc>().add(FetchWeatherInitial());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              gradient: AppColors.gradientColorBg),
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state){
            if(state is HomeLoading){
              return Center(child: AppLoaders.pulse());
            } else if(state is HomeWeatherLoaded){
              var weatherInfo = state.weatherData;
              var forecastInfo = state.weatherForecastData;
              return Column(
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

                  12.verticalSpace,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(forecastInfo.list?.where((forecast) => forecast.dtTxt!.startsWith(DateFormat('yyyy-MM-dd').format(DateTime.now()))).toList().length ?? 0, (index) {
                        final info = forecastInfo.list![index];
                            return Container(
                            margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: AppColors.gradientColorCard,
                                borderRadius: BorderRadius.circular(Dimensions.radius16)
                              ),
                              child: Column(
                                children: [
                                  AppTexts.mediumText(text: info.forecastTime!),
                                  NetworkIcon(iconPath: '${Environment.iconBaseUrl}${info.weather?[0].icon}.png'),
                                  AppTexts.mediumText(text: '${info.main!.temp!.round()}°'),
                                ],
                              ),
                            );
                      }
                    ),
                  )),

                  const Spacer(),
                  Padding(
                    padding: REdgeInsets.all(24),
                    child: HomeWidgets.footerCard(sunriseTime: weatherInfo.sys!.sunrise!, sunsetTime: weatherInfo.sys!.sunset!),
                  )
                ],
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
      ),
    );
  }
}
