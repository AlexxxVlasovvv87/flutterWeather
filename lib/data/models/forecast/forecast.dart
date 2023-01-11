import 'package:json_annotation/json_annotation.dart';

import 'daily_forecast.dart';

part 'forecast.g.dart';

//Модификация доменного класса
@JsonSerializable()
class Forecast {
  @JsonKey(name: 'forecastday')
  final List<DailyForecast> forecastDay;

  Forecast({required this.forecastDay});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
