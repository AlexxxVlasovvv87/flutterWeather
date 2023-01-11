import 'package:get_it/get_it.dart';
import 'package:weather_app/data/remote/data_sources/weather_service.dart';
import 'package:weather_app/domain/usecase/get_current_weather.dart';
import 'package:weather_app/presentation/pages/weather/bloc/weather_bloc.dart';

import 'data/repository/weather_repository_impl.dart';
import 'domain/repositories/weather_repository.dart';

//Подставляет реализацию под интерфейсы (inject)

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton(WeatherService());

  injector.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(injector()),
  );

  injector.registerSingleton<GetCurrentWeather>(
      GetCurrentWeather(injector()));

  injector.registerFactory<WeatherBloc>(
          () => WeatherBloc(injector()));
}