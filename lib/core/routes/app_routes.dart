import 'package:fintech_app/core/routes/router_transitions.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/features/auth/presentation/forgot_password/views/forgot_password_view.dart';
import 'package:fintech_app/features/auth/presentation/login/views/login_view.dart';
import 'package:fintech_app/features/auth/presentation/register/views/fingerprint_complete_view.dart';
import 'package:fintech_app/features/auth/presentation/register/views/fingerprint_setup_view.dart';
import 'package:fintech_app/features/auth/presentation/register/views/register_view.dart';
import 'package:fintech_app/features/home/presentation/views/home_view.dart';
import 'package:fintech_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();
  static const AppRoutes instance = AppRoutes._();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return RouterTransitions.buildHorizontal(const OnboardingView());
      case Routes.login:
        return RouterTransitions.buildHorizontal(const LoginView());
      case Routes.register:
        return RouterTransitions.buildHorizontal(const RegisterView());
      case Routes.forgotPassword:
        return RouterTransitions.buildHorizontal(const ForgotPasswordView());
      case Routes.home:
        return RouterTransitions.buildHorizontal(const HomeView());
      case Routes.setFingerprint:
        return RouterTransitions.buildVertical(const FingerprintSetupView());
      case Routes.setFingerprintSuccess:
        return RouterTransitions.buildVertical(const FingerprintCompleteView());
      default:
        return RouterTransitions.build(
          const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
