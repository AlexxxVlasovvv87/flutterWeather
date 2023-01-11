import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

import '../../models/api_response.dart';

// Типа retrofit

class WeatherService {
  static const _BASE_URL = 'http://api.weatherapi.com/v1';
  static const apiKey = "85f37a727bca4aa498c132843231001";

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );
  // Мощный Http-клиент для Dart, который поддерживает перехватчики,
  // глобальную конфигурацию, FormData, отмену запроса, загрузку файла, тайм-аут и т. д.

  WeatherService() {
    _dio.interceptors.add(dioLoggerInterceptor);
  }

  Future<ApiResponse?> getCurrentWeather(
      String lat,
      String long,
      ) async {
    final response = await _dio.get(
      '/forecast.json',
      queryParameters: {
        'key': apiKey,
        'q': '$lat,$long',
        'days': 5,
        'lang': 'ru'
      },
    );
    return ApiResponse.fromJson(response.data); //
  }
}