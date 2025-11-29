import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/theme_extension.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/auth_background.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/email_text_form_field.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/login_header.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/login_button.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/social_login_buttons.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/biometric_login_section.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/login_footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.appColors;

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

            // Email field
            const EmailTextFormField(),

            VerticalSpace(12),

            // Password field
            const PasswordTextFormField(),

            VerticalSpace(12),

            // Remember me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: BorderSide(
                          color: colors.primaryText.withValues(alpha: 0.3),
                          width: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Remember me',
                      style: TextStyle(color: colors.primaryText, fontSize: 14),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to forgot password
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: colors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            VerticalSpace(24),

            // Login button
            LoginButton(
              onPressed: () {
                // TODO: Implement login logic
              },
            ),

            VerticalSpace(20),

            // Social login buttons
            SocialLoginButtons(
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
