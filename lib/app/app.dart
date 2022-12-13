import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:locator/page/home_page.dart';
import 'package:locator/page/locator/views/background_locator_page.dart';
import 'package:locator/page/splash.dart';

import '../navigation/navigation.dart';

class Lokalizator extends StatelessWidget {
  Lokalizator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: Navigation.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Navigation.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Navigation.location,
        builder: (context, state) => const BackgroundLocatorPage(),
      ),
    ],
  );
}
