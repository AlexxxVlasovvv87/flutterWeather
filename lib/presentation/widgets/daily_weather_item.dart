import 'package:flutter/material.dart';

import '../../domain/entity/forecast/daily_forecast_dto.dart';

class DailyWeatherItem extends StatelessWidget {
  const DailyWeatherItem({Key? key, required this.data}) : super(key: key);
  final DailyForecastDto data;

  //карточка с облачком

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;
    return Column(
      children: [
        Text(
          data.date,
          style: textTheme.caption!.copyWith(fontWeight: fontWeight, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Image.asset(
          "assets/images/${data.day.conditionDto.icon}",
          scale: 0.40,
        ),
        const SizedBox(height: 8),
        Text(
          'minTemp: ${data.day.minTemp}°',
          style: textTheme.bodyText1!.copyWith(fontWeight: fontWeight),
        ),
        Text(
          'maxTemp: ${data.day.maxTemp}°',
          style: textTheme.bodyText1!.copyWith(fontWeight: fontWeight),
        ),
      ],
    );
  }
}
