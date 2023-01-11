import 'package:flutter/material.dart';

//Класс темы

class AppTheme {
  static final textStyleWithShadow = TextStyle(color: Colors.white, shadows: [
    BoxShadow(
      color: Colors.black12.withOpacity(0.25),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 0.5),
    )
  ]);

  static ThemeData get light {
    var appLightTheme = ThemeData(
        appBarTheme: const AppBarTheme(),
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline1: textStyleWithShadow,
          headline2: textStyleWithShadow,
          headline3: textStyleWithShadow,
          headline4: textStyleWithShadow,
          headline5: textStyleWithShadow,
          subtitle1: const TextStyle(color: Colors.white),
          bodyText2: const TextStyle(color: Colors.white),
          bodyText1: const TextStyle(color: Colors.white),
          caption: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        cardColor: Colors.blue[200],
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.blueAccent,
            onPrimary: Colors.white,
            onSurface: Colors.white));

    return appLightTheme.copyWith(
        textTheme: appLightTheme.textTheme
            .apply(displayColor: Colors.white, bodyColor: Colors.white));
  }
}
