import 'package:json_annotation/json_annotation.dart';

import '../condition/condition_dto.dart';

//Класс данных без даты но с данными

class DayDto {
  final double maxTemp;
  final double minTemp;
  final ConditionDto conditionDto;

  DayDto({
    required this.maxTemp,
    required this.minTemp,
    required this.conditionDto,
  });
}
