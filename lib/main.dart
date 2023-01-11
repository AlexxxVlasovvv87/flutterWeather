import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/pages/weather/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/pages/weather/weather.dart';

import 'injector.dart';

// главный класс

void main(){
  initializeDependencies();
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (_) => injector()..add(const GetCurrentWeatherEvent()),
      child: MaterialApp(
        title: 'Погода',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const WeatherPage(),
          // '/settings': (context) => const SettingsPage()
        },
      ),
    );
  }
}
