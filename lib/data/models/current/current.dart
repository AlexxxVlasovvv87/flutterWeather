import 'package:json_annotation/json_annotation.dart';

import '../condition.dart';

part 'current.g.dart';

//Модификация доменного класса

@JsonSerializable()
class CurrentWeatherResponse {
  @JsonKey(name: 'last_updated')
  final String lastUpdated;
  @JsonKey(name: 'temp_c')
  final double temp;
  @JsonKey(name: 'condition')
  final Condition condition;
  @JsonKey(name: 'wind_kph')
  final double windSpeed;
  @JsonKey(name: 'wind_dir')
  final String windDirection;
  @JsonKey(name: 'humidity')
  final int humidity;
  @JsonKey(name: 'feelslike_c')
  final double feelslike;

  CurrentWeatherResponse(
      {required this.lastUpdated,
      required this.temp,
      required this.condition,
      required this.windSpeed,
      required this.windDirection,
      required this.humidity,
      required this.feelslike});

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherResponseFromJson(json);
}
