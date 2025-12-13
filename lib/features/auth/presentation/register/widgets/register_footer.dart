import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';

class RegisterFooter extends StatelessWidget {
  final VoidCallback onLoginTap;

  const RegisterFooter({super.key, required this.onLoginTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppTextStyle.font18Medium.copyWith(color: colors.textGray2),
        ),
        GestureDetector(
          onTap: onLoginTap,
          child: Text(
            'login',
            style: AppTextStyle.font18Medium.copyWith(color: colors.buttonText),
          ),
        ),
      ],
    );
  }
}
