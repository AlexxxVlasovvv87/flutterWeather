import 'package:weather_app/data/mapper/condition_to_condition_dto_mapper.dart';
import 'package:weather_app/domain/entity/current/current_dto.dart';

import '../models/current/current.dart';

class CurrentToCurrentDtoMapper {
  static CurrentWeatherDto mapToDto(CurrentWeatherResponse model) {
    return CurrentWeatherDto(
        lastUpdated: model.lastUpdated,
        temp: model.temp.toStringAsFixed(2),
        condition: ConditionToConditionDtoMapper.mapToDto(model.condition),
        windSpeed: model.windSpeed.toStringAsFixed(2),
        windDirection: model.windDirection,
        humidity: model.humidity.toString(),
        feelslike: model.feelslike.toStringAsFixed(2));
  }
}
