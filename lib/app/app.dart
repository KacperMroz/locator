import 'package:flutter/material.dart';
import 'package:locator/page/splash.dart';

class Lokalizator extends StatelessWidget {
  Lokalizator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      restorationScopeId: "root",
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white60,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Color(0xFF2D2D2D),
        ),
        textTheme: const TextTheme(
          // text theme of the header on each step
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          subtitle1: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
