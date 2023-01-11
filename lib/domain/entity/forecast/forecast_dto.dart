import 'package:json_annotation/json_annotation.dart';

import 'daily_forecast_dto.dart';

//Класс данных список погоды на n дней

class ForecastDto {
  final List<DailyForecastDto> forecastDay;

  ForecastDto({required this.forecastDay});
}
