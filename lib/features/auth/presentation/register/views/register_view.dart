import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/auth_background.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/social_auth_buttons.dart';
import 'package:fintech_app/features/auth/presentation/register/views/register_form.dart';
import 'package:fintech_app/features/auth/presentation/register/widgets/register_footer.dart';
import 'package:fintech_app/features/auth/presentation/register/widgets/register_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
            const RegisterHeader(),
            VerticalSpace(32),

            // Register Form
            const RegisterForm(),
            VerticalSpace(20),

            // Social auth buttons
            SocialAuthButtons(
              onGooglePressed: () {
                // TODO: Implement Google sign up
              },
              onFacebookPressed: () {
                // TODO: Implement Facebook sign up
              },
            ),

            VerticalSpace(24),

            // Footer
            RegisterFooter(
              onLoginTap: () {
                context.pushReplacementNamed(Routes.login);
              },
            ),

            VerticalSpace(24),
          ],
        ),
      ),
    );
  }
}
