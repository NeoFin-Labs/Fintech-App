import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/auth_background.dart';
import 'package:fintech_app/features/auth/presentation/login/views/login_form.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/social_auth_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech_app/core/di/injection_container.dart' as di;
import 'package:fintech_app/features/auth/presentation/common/cubit/auth_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<AuthCubit>(),
      child: Builder(
        builder: (context) {
          return AuthBackground(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  VerticalSpace(40),
                  // Header
                  const LoginHeader(),
                  VerticalSpace(32),
                  // Login Form
                  const LoginForm(),
                  VerticalSpace(20),

                  // Social login buttons
                  SocialAuthButtons(
                    onGooglePressed: () {
                      context.read<AuthCubit>().signInWithGoogle();
                    },
                    onFacebookPressed: () {
                      context.read<AuthCubit>().signInWithFacebook();
                    },
                  ),

                  VerticalSpace(20),

                  // Biometric login section
                  const BiometricLoginSection(),

                  VerticalSpace(24),

                  // Footer
                  LoginFooter(
                    onSignUpTap: () {
                      context.pushReplacementNamed(Routes.register);
                    },
                  ),

                  VerticalSpace(24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
