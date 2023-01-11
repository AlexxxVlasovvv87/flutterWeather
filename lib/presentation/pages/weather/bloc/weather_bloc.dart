import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entity/condition/condition_dto.dart';
import 'package:weather_app/domain/entity/current/current_dto.dart';
import 'package:weather_app/domain/usecase/get_current_weather.dart';

import '../../../../domain/entity/api_response_dto.dart';
import '../../../../domain/entity/forecast/forecast_dto.dart';

part 'weather_event.dart';

part 'weather_state.dart';

//Изменение состояния в блоке

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather _getCurrentWeather;

  WeatherBloc(this._getCurrentWeather) : super(WeatherInitialState()) {
    on<GetCurrentWeatherEvent>(_onGetCurrentWeather);
  }

  Future<void> _onGetCurrentWeather(
    GetCurrentWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const WeatherLoadingState()); //принимает состояние и отправляет его в UI
    await Future.delayed(const Duration(seconds: 2)); //имитация загрузки

    if (event.lat != null && event.long != null) { //вызов состояния, если пустое, то берлин
      final result = await _getCurrentWeather( //вызов usecase
          Params(longitude: event.long.toString(), latitude: event.lat.toString()));
      emit(result.fold(
              (error) => const WeatherErrorState(message: "Can't load info"),
              (apiResponse) =>
              WeatherSuccessState(apiResponseDto: apiResponse))!);
    } else {
      final result = await _getCurrentWeather(
          const Params(longitude: "13.404954", latitude: "52.520008"));
      emit(result.fold( //отправка состояния
              (error) => const WeatherErrorState(message: "Can't load info"),
              (apiResponse) =>
              WeatherSuccessState(apiResponseDto: apiResponse))!);
    }


    // } else {
    //   emit(const WeatherLocationErrorState(
    //       message: "something went very wrong :("));
    // }
  }
}
