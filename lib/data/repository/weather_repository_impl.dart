import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/data/mapper/api_response_to_api_response_dto_mapper.dart';
import 'package:weather_app/data/mapper/forecast_to_forecast_dto_mapper.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

import '../../domain/entity/api_response_dto.dart';
import '../../domain/entity/forecast/forecast_dto.dart';
import '../models/api_response.dart';
import '../remote/data_sources/weather_service.dart';

//Реализация репозитория (использует сервис)

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherService _weatherService;

  WeatherRepositoryImpl(this._weatherService);

  @override
  Future<Either<Failure, ApiResponseDto>> getCurrentWeather( //асинхронный запрос
      String lat, String long) async {
    ApiResponse model = (await _weatherService.getCurrentWeather(lat, long))!;

    return Right(ApiResponseToApiResponseDtoMapper.mapToDto(model));
  }
}
