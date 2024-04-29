import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/components/global_widgets/global_widgets.dart';
import 'package:weather_app/src/components/global_widgets/icon/network_icon.dart';
import 'package:weather_app/src/core/environment/environment.dart';
import 'package:weather_app/src/core/extensions/build_context_extension.dart';
import 'package:weather_app/src/core/routes/routes.dart';
import 'package:weather_app/src/features/home/domain/model/weather_forecast_model.dart';
import 'package:weather_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/src/features/home/widgets/home_widgets.dart';
import 'package:weather_app/src/utils/const/debouncer/debouncer.dart';
import 'package:weather_app/src/utils/styles/colors.dart';
import 'package:weather_app/src/utils/styles/dimensions.dart';
import 'package:weather_app/src/utils/styles/icons.dart';
import 'package:weather_app/src/utils/styles/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchTextController;

  late Debounce _debounce;

  final _isCelsius = true;

  @override
  void initState() {
    _debounce = Debounce(milliseconds: 500);
    _searchTextController = TextEditingController();
    _fetchInitialWeatherInfo();
    super.initState();
  }

  _fetchInitialWeatherInfo() {
    context.read<HomeBloc>().add(FetchWeatherInitial(isCelsius: _isCelsius));
  }

  @override
  void dispose() {
    _debounce.dispose();
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppIcons.bg), fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(12),
            child: Column(
              children: [
                32.verticalSpace,
                ///Search Bar
                Align(
                  alignment: Alignment.topCenter,
                  child: AppTextField.hintTextOnly(
                      hintText: 'Search',
                      onChanged: (value) {
                        var state = context.read<HomeBloc>().state;
                        if(state is HomeWeatherLoaded){
                          _debounce.run(() {
                            if (value.isEmpty) {
                              context.read<HomeBloc>().add(FetchWeatherInitial(isCelsius: state.isCelsius));
                            } else {
                              context.read<HomeBloc>().add(FetchWeatherByQuery(query: value, isCelsius: state.isCelsius));
                            }
                          });
                        }



                      },
                      searchTextController: _searchTextController),
                ),
                BlocConsumer<HomeBloc, HomeState>(builder: (context, state){
                  if (state is HomeLoading) {
                    return Center(child: AppLoaders.showLoader());
                  } else if (state is HomeWeatherLoaded) {
                    var weatherInfo = state.weatherData;
                    var forecastInfo = state.weatherForecastData;
                    return Column(
                      children: [
                        12.verticalSpace,

                        ///Temp Conversion and 5Day Weather Forecast
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppSwitch.tempSwitch(isFahrenheit: !state.isCelsius, onSwitch: (){
                              if(_searchTextController.text.isEmpty){
                                context.read<HomeBloc>().add(FetchWeatherInitial(isCelsius: !state.isCelsius));
                              } else {
                                context.read<HomeBloc>().add(FetchWeatherByQuery(query: _searchTextController.text.trim(), isCelsius: !state.isCelsius));
                              }
                            }),

                            AppButton.primaryBtn(text: 'See Forecast', onTap: () => context.pushNamed(routeName: RouteGenerator.forecast, arguments: state.weatherForecastData))
                          ],
                        ),

                        24.verticalSpace,

                        ///City Name
                        AppTexts.extraLargeText(
                            text: '${weatherInfo.name}',
                            fontWeight: FontWeight.bold),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgIcon(
                              iconPath: AppIcons.locationIcon,
                              size: 16.h,
                            ),
                            6.horizontalSpace,
                            AppTexts.smallText(text: 'Current Location'),
                          ],
                        ),

                        ///Temp
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NetworkIcon(
                              iconPath:
                              '${Environment.iconBaseUrl}${weatherInfo.weather?[0].icon}@4x.png',
                            ),
                            Flexible(
                              child: AppTexts.extraLargeText(
                                  text: '${weatherInfo.main?.temp.round()}°',
                                  fontSize: Dimensions.fontSize88,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        AppTexts.largeText(
                            text:
                            '${weatherInfo.weather!.first.main} - H:${weatherInfo.main!.tempMax.round()}° L:${weatherInfo.main!.tempMin.round()}°'),

                        12.verticalSpace,

                        /// Forecast
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: List.generate(
                                  forecastInfo.list?.where((forecast) => forecast.dtTxt!.startsWith(DateFormat('yyyy-MM-dd').format(DateTime.now()))).toList().length ?? 0, (index) {
                                final info = forecastInfo.list![index];
                                return HomeWidgets.forecastCard(
                                    time: info.forecastTime!,
                                    iconPath: info.weather!.first.icon!,
                                    temp: info.main!.temp!.round());
                              }),
                            )),


                        64.verticalSpace,

                        /// Sunrise Sunset
                        Padding(
                          padding: REdgeInsets.all(24),
                          child: Column(
                            children: [
                              HomeWidgets.sunriseSunsetCard(
                                  sunriseTime: weatherInfo.sys!.sunrise!,
                                  sunsetTime: weatherInfo.sys!.sunset!),
                              16.verticalSpace,
                              HomeWidgets.descriptionCard(context,
                                  feelsLike: '${weatherInfo.main?.feelsLike}',
                                  windSpeed: '${weatherInfo.wind?.speed}',
                                  humidity: '${weatherInfo.main?.humidity}',
                                  countryCode: '${weatherInfo.sys?.country}',
                                  cityName: '${weatherInfo.name}')
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (state is HomeError) {
                    return  Center(
                        child: AppTexts.mediumText(text: state.msg, textAlign: TextAlign.center)
                    );
                  } else {
                    return Center(
                        child: AppTexts.mediumText(text: Message.unknown, textAlign: TextAlign.center)
                    );
                  }
                }, listener: (context, state){

                  if(state is HomeError){
                    AppToasts.shortToast(state.msg);
                  }

                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
