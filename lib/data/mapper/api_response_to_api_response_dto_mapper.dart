import 'package:weather_app/data/mapper/current_to_current_dto_mapper.dart';
import 'package:weather_app/data/mapper/forecast_to_forecast_dto_mapper.dart';
import 'package:weather_app/data/mapper/location_to_location_dto_mapper.dart';

import '../../domain/entity/api_response_dto.dart';
import '../models/api_response.dart';

//Маппер (конверт объект из слоя data в объект domain )

class ApiResponseToApiResponseDtoMapper {
  static ApiResponseDto mapToDto(ApiResponse model) {
    return ApiResponseDto(
      current: CurrentToCurrentDtoMapper.mapToDto(model.current),
      forecast: ForecastToForecastDtoMapper.mapToDto(model.forecast),
      locationDto: LocationToLocationDtoMapper.mapToDto(model.location),
    );
  }
}
