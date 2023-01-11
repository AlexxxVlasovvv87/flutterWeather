import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  String name;

  Location({required this.name});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
