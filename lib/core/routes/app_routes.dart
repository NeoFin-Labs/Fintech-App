import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();
  static const AppRoutes instance = AppRoutes._();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.welcome:
      //   return MaterialPageRoute(builder: (context) => const WelcomeView());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
