part of 'weather_bloc.dart';

//Шаблонное состояние

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitialState extends WeatherState {
  const WeatherInitialState();
}

class WeatherLoadingState extends WeatherState {
  const WeatherLoadingState();
}

class WeatherSuccessState extends WeatherState {
  final ApiResponseDto apiResponseDto; //Ответ от usecase

  const WeatherSuccessState({required this.apiResponseDto});

  @override
  List<Object?> get props => [apiResponseDto];
}

class WeatherErrorState extends WeatherState {
  final String message;

  const WeatherErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
