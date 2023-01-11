import '../../domain/entity/forecast/day_dto.dart';
import '../models/forecast/day.dart';
import 'condition_to_condition_dto_mapper.dart';

class DayToDayDtoMapper {
  static DayDto mapToDto(Day model) {
    return DayDto(
        maxTemp: model.maxTemp,
        minTemp: model.minTemp,
        conditionDto: ConditionToConditionDtoMapper.mapToDto(model.condition));
  }
}
