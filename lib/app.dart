import 'package:flutter/material.dart';

import 'package:flutter_anime_mobx/src/screens/detail/detail_screen.dart';
import 'package:flutter_anime_mobx/src/screens/home/home_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailScreen.routeName: (context) => DetailScreen(),
};

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/home',
      routes: routes,
    );
  }
}
