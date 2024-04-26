import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/home/presentation/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.read<HomeBloc>().add(FetchWeatherByLatLon(lat: '23.8041', lon: '90.4152'));
        }, child: const Text('Get Weather')),
      ),
    );
  }
}
