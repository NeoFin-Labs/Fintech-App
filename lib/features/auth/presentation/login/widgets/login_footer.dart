import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';

class LoginFooter extends StatelessWidget {
  final VoidCallback onSignUpTap;

  const LoginFooter({super.key, required this.onSignUpTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: AppTextStyle.font18Medium.copyWith(color: colors.textGray2),
        ),
        GestureDetector(
          onTap: onSignUpTap,
          child: Text(
            'Sign Up',
            style: AppTextStyle.font18Medium.copyWith(color: colors.buttonText),
          ),
        ),
      ],
    );
  }
}
