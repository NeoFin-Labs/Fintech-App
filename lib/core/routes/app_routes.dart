import 'package:fintech_app/core/routes/router_transitions.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/features/auth/presentation/login/views/face_id_view.dart';
import 'package:fintech_app/features/auth/presentation/login/views/login_view.dart';
import 'package:fintech_app/features/auth/presentation/register/views/register_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();
  static const AppRoutes instance = AppRoutes._();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return RouterTransitions.buildHorizontal(const LoginView());
      case Routes.register:
        return RouterTransitions.buildHorizontal(const RegisterView());
      case Routes.faceId:
        return RouterTransitions.buildVertical(const FaceIdView());
      default:
        return RouterTransitions.build(
          const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
