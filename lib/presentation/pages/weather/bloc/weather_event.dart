part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

//Событие получения погоды

class GetCurrentWeatherEvent extends WeatherEvent {

  final double? lat;
  final double? long;

  const GetCurrentWeatherEvent({this.lat, this.long});
}
