import 'package:json_annotation/json_annotation.dart';

import 'day.dart';

part 'daily_forecast.g.dart';
//Модификация доменного класса

@JsonSerializable()
class DailyForecast {
  final String date;
  final Day day;

  DailyForecast({
    required this.date,
    required this.day,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);
}
