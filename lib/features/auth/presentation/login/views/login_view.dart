import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/auth_background.dart';
import 'package:fintech_app/features/auth/presentation/login/views/login_form.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/login_header.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/social_auth_buttons.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/biometric_login_section.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/login_footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
                // TODO: Implement Google login
              },
              onFacebookPressed: () {
                // TODO: Implement Facebook login
              },
            ),

            VerticalSpace(20),

            // Biometric login section
            const BiometricLoginSection(),

            VerticalSpace(24),

            // Footer
            LoginFooter(
              onSignUpTap: () {
                // TODO: Navigate to sign up
              },
            ),

            VerticalSpace(24),
          ],
        ),
      ),
    );
  }
}
