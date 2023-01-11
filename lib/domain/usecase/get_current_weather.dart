import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entity/api_response_dto.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entity/forecast/forecast_dto.dart';
import '../repositories/weather_repository.dart';

// Реализация шаблонного usecase в domain

class GetCurrentWeather implements UseCase<ApiResponseDto, Params> {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  @override
  Future<Either<Failure, ApiResponseDto>> call(Params params) async {
    return await repository.getCurrentWeather(
      params.latitude,
      params.longitude,
    );
  }
}

class Params extends Equatable {
  final String latitude;
  final String longitude;

  const Params({required this.longitude, required this.latitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
