import 'package:weather_app/data/mapper/daily_forecast_to_daily_forecast_dto_mapper.dart';

import '../../domain/entity/forecast/forecast_dto.dart';
import '../models/forecast/forecast.dart';

class ForecastToForecastDtoMapper {
  static ForecastDto mapToDto(Forecast model) {
    return ForecastDto(
      forecastDay: model.forecastDay.map((element) {
        return DailyForecastToDailyForecastDtoMapper.mapToDto(element);
      }).toList(),
    );
  }
}
