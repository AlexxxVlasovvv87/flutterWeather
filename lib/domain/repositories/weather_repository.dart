import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entity/api_response_dto.dart';

//Абстрактный класс для репозитория погоды (место, текущая погода, прогноз)

abstract class WeatherRepository {
  Future<Either<Failure, ApiResponseDto>> getCurrentWeather(
    String lat,
    String long,
  );
}
