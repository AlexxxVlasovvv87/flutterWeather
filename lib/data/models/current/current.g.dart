// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherResponse _$CurrentWeatherResponseFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherResponse(
      lastUpdated: json['last_updated'] as String,
      temp: (json['temp_c'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windSpeed: (json['wind_kph'] as num).toDouble(),
      windDirection: json['wind_dir'] as String,
      humidity: json['humidity'] as int,
      feelslike: (json['feelslike_c'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherResponseToJson(
        CurrentWeatherResponse instance) =>
    <String, dynamic>{
      'last_updated': instance.lastUpdated,
      'temp_c': instance.temp,
      'condition': instance.condition,
      'wind_kph': instance.windSpeed,
      'wind_dir': instance.windDirection,
      'humidity': instance.humidity,
      'feelslike_c': instance.feelslike,
    };
