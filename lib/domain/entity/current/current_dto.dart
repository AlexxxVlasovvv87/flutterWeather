
import '../condition/condition_dto.dart';

//Текущая погода

class CurrentWeatherDto {
  final String lastUpdated;
  final String temp;
  final ConditionDto condition;
  final String windSpeed;
  final String windDirection;
  final String humidity;
  final String feelslike;

  CurrentWeatherDto(
      {required this.lastUpdated,
        required this.temp,
        required this.condition,
        required this.windSpeed,
        required this.windDirection,
        required this.humidity,
        required this.feelslike});

  @override
  String toString() {
    return """
    lastUpdated = $lastUpdated
    temp = $temp
    condition = ${condition.toString()}
    windSpeed = $windSpeed
    windDirection = $windDirection
    humidity = $humidity
    feelslike = $feelslike
    """;
  }
}