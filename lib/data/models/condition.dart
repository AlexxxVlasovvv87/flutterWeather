import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

//Создаёт объект condition и обрезает ссылку на картинку

@JsonSerializable()
class Condition {
  final String text;
  late String icon;

  Condition({required this.text, required icon}) {
    this.icon = icon.split(RegExp(".*(x64/)"))[1]; //обрезка ссылки для доставания картинки
  }

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}
