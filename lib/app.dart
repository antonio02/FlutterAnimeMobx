import 'package:flutter/material.dart';
import 'package:flutter_anime_mobx/src/screens/home/home_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
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
