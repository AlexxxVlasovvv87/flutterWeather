import 'package:flutter/material.dart';

import '../../widgets/daily_weather_item.dart';
import 'bloc/weather_bloc.dart';

//Виджет основного экрана

class WeatherSuccess extends StatelessWidget {
  const WeatherSuccess({Key? key, required this.context, required this.state}) : super(key: key);

  final BuildContext context;
  final state;

  @override
  Widget build(BuildContext context) {
    if (state is WeatherSuccessState) {
      var curr = state.apiResponseDto.current;
      var forecast = state.apiResponseDto.forecast.forecastDay;
      final textTheme = Theme.of(context).textTheme;

      return Column(
        children: [
          Row(
            children: [
              Text(
                "Место: ${state.apiResponseDto.locationDto.name}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/${curr.condition.icon}", //иконки погоды
                scale: 0.40,
              ),
              Text("${curr.temp}°", style: textTheme.headline2),
              Text("Feels like: ${curr.feelslike}°",
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 40,
              ),
              Container( //использовали контейнер, т.к. скролл в колонке
                height: 280,
                width: double.infinity, //параметры скролл полоски
                child: ListView(
                  scrollDirection: Axis.horizontal, //направление скролла
                  children: [
                    ...forecast.map((e) {
                      return DailyWeatherItem( //куча детей виджитиков
                        data: e,
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    } else if (state is WeatherErrorState) {
      return Text(state.message);
    } else {
      return Text("very wrong");
    }
  }
}
