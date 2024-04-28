import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/components/global_widgets/button/app_button.dart';
import 'package:weather_app/src/components/global_widgets/global_widgets.dart';
import 'package:weather_app/src/core/extensions/build_context_extension.dart';
import 'package:weather_app/src/features/forecast/widgets/forecast_widgets.dart';
import 'package:weather_app/src/features/home/data/model/weather_forecast_model.dart';
import 'package:weather_app/src/utils/const/forecast_date_filter/forecast_date_fliter.dart';
import 'package:weather_app/src/utils/styles/icons.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});



  @override
  Widget build(BuildContext context) {
    final WeatherForecastData forecastData = context.getArguments;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppIcons.bg), fit: BoxFit.cover)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.verticalSpace,
            AppButton.iconBtn(icon: Icons.arrow_back, onTap: ()=> context.pop()),
            Expanded(child: Padding(
              padding: REdgeInsets.all(12),
              child: ListView.separated(
                separatorBuilder: (context, index) => 24.verticalSpace,
                  itemCount: filterForecastDate(forecastData: forecastData.list!).length,
                  itemBuilder: (context, index){
                  final  weatherInfo = filterForecastDate(forecastData: forecastData.list!)[index];
                  final isDateToday  = weatherInfo.dtTxt!.startsWith(DateFormat("yyyy-MM-dd").format(DateTime.now()));
                return ForecastWidgets.forecastCard(weatherInfo: weatherInfo, isDateToday: isDateToday);
              }),
            ))
          ],
        ),
      ),
    );
  }
}
