import 'package:json_annotation/json_annotation.dart';

import 'current/current.dart';
import 'forecast/forecast.dart';
import 'location/location.dart';

part 'api_response.g.dart';

//Парсер json

@JsonSerializable()
class ApiResponse {
  @JsonKey(name: 'current')
  final CurrentWeatherResponse current;
  @JsonKey(name: 'forecast')
  final Forecast forecast;
  @JsonKey(name: 'location')
  final Location location;

  ApiResponse({
    required this.current,
    required this.forecast,
    required this.location,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
