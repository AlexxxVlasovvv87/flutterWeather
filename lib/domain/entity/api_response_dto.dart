import 'current/current_dto.dart';
import 'forecast/forecast_dto.dart';
import 'location_dto.dart';

//Модель domain

class ApiResponseDto {
  final CurrentWeatherDto current;
  final ForecastDto forecast;
  final LocationDto locationDto;

  ApiResponseDto({required this.current, required this.forecast, required this.locationDto, });
}
