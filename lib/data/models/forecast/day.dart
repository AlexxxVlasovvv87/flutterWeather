import 'package:json_annotation/json_annotation.dart';

import '../condition.dart';

part 'day.g.dart';

//Модификация доменного класса
@JsonSerializable()
class Day {
  @JsonKey(name: 'maxtemp_c')
  final double maxTemp;
  @JsonKey(name: 'mintemp_c')
  final double minTemp;
  final Condition condition;

  Day({
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}
