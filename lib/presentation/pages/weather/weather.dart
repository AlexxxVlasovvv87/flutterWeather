import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/pages/weather/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/pages/weather/weather_success.dart';

import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/presentation/widgets/daily_weather_item.dart';

//Состояние (bloc), вспом функции,

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late WeatherBloc bloc;

  var _lat = 0.0;
  var _long = 0.0;

  @override
  void initState() {
    super.initState();
    bloc = context.read<WeatherBloc>();
  }

  void _updateGeo(Position position) {
    setState(() { //изменение состояния, запуск build
      _lat = position.latitude;
      _long = position.longitude;
    });
    bloc.add(GetCurrentWeatherEvent(lat: _lat, long: _long));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Погода"),
        leading: const Icon(Icons.home),
        actions: [
          IconButton(
              onPressed: () => bloc.add(const GetCurrentWeatherEvent()),
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () => _checkAndUpdate(),
              icon: const Icon(Icons.gps_fixed))
        ],
      ),
      body: _buildBody(), //вызов сборки виджета _buildBody
    );
  }

  Widget _buildBody() {
    final appTheme = Theme.of(context);

    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherLoadingState) { //Проверка состояния, если сейчас загрузка
        return const Center(child: CircularProgressIndicator());
      }
      if (state is WeatherErrorState) {
        return Center(
            child: Text(state.message,
                style: appTheme.textTheme.titleLarge
                    ?.copyWith(color: appTheme.colorScheme.primary)));
      }
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: WeatherSuccess(context: context, state: state),
        ),
      );
    });
  }

  //геолокация и проверка состояния гео
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void _showToast(String message) { //показ тоста
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> _checkAndUpdate() async { //проверка результата определения гео
    _determinePosition()
        .then((position) => //ожидание выполнения position и выполнение действия
            {_updateGeo(position), print("lat: $_lat, long: $_long")})
        .onError((error, stackTrace) => {_showToast(error.toString())}); //обработка ошибок
  }
}
