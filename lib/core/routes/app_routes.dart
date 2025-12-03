import 'package:fintech_app/core/routes/router_transitions.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/features/auth/presentation/login/views/face_id_success_view.dart';
import 'package:fintech_app/features/auth/presentation/login/views/face_id_view.dart';
import 'package:fintech_app/features/auth/presentation/login/views/touch_id_success_view.dart';
import 'package:fintech_app/features/auth/presentation/login/views/touch_id_view.dart';
import 'package:fintech_app/features/auth/presentation/login/views/login_view.dart';
import 'package:fintech_app/features/auth/presentation/register/views/face_id_scanning_view.dart';
import 'package:fintech_app/features/auth/presentation/register/views/face_id_setup_view.dart';
import 'package:fintech_app/features/auth/presentation/register/views/fingerprint_complete_view.dart';
import 'package:fintech_app/features/auth/presentation/register/views/fingerprint_setup_view.dart';
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
      case Routes.touchId:
        return RouterTransitions.buildVertical(const TouchIdView());
      case Routes.faceIdVerification:
        return RouterTransitions.buildVertical(const FaceIdSuccessView());
      case Routes.touchIdVerification:
        return RouterTransitions.buildVertical(const TouchIdSuccessView());
      case Routes.setFingerprint:
        return RouterTransitions.buildVertical(const FingerprintSetupView());
      case Routes.setFingerprintSuccess:
        return RouterTransitions.buildVertical(const FingerprintCompleteView());
      case Routes.faceIdSetup:
        return RouterTransitions.buildVertical(const FaceIdSetupView());
      case Routes.setFaceId:
        return RouterTransitions.buildVertical(const FaceIdScanningView());
      case Routes.setFaceIdSuccess:
        return RouterTransitions.buildVertical(const FaceIdSuccessView());
      default:
        return RouterTransitions.build(
          const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
