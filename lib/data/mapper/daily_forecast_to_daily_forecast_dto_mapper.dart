import 'package:weather_app/data/mapper/day_to_day_dto_mapper.dart';

import '../../domain/entity/forecast/daily_forecast_dto.dart';
import '../models/forecast/daily_forecast.dart';

class DailyForecastToDailyForecastDtoMapper {
  static DailyForecastDto mapToDto(DailyForecast model) {
    return DailyForecastDto(
      date: model.date,
      day: DayToDayDtoMapper.mapToDto(model.day),
    );
  }
}
