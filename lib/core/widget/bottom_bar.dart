import "package:flutter/material.dart";

//Нижняя полоска (н)

class WeatherBottomBar extends StatefulWidget {
  const WeatherBottomBar({Key? key}) : super(key: key);

  @override
  State<WeatherBottomBar> createState() => _WeatherBottomBarState();
}

class _WeatherBottomBarState extends State<WeatherBottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.sunny),
          label: 'Weather',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: _onTapHandler,
      currentIndex: _selectedIndex,
    );
  }

  void _onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/settings');
        break;
    }
  }
}
