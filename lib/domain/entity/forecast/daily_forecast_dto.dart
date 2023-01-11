import 'package:json_annotation/json_annotation.dart';

import 'day_dto.dart';

//Класс данных о дне с датой

class DailyForecastDto {
  final String date;
  final DayDto day;

  DailyForecastDto({
    required this.date,
    required this.day,
  });
}
