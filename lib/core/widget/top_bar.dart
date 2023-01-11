import "package:flutter/material.dart";

//Верхняя полоска (н)

class WeatherTopBar extends StatefulWidget {
  const WeatherTopBar({Key? key}) : super(key: key);

  @override
  State<WeatherTopBar> createState() => _WeatherTopBarState();
}

class _WeatherTopBarState extends State<WeatherTopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Weather"),
      leading: const Icon(Icons.home),
    );
  }
}
