import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/initializer/initializer.dart';
import 'package:weather_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/src/features/home/presentation/home_page.dart';
import 'src/core/dependencies/dependencies.dart';

void main() {
  Initializer.init(() {
    runApp(const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 838),
      builder: (context, widget) {
        return MultiBlocProvider(providers: [
          BlocProvider(create: (context)=> sl<HomeBloc>())
        ], child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ));
      }
    );
  }
}

