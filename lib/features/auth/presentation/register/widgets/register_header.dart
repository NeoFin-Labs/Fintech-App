import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/theme_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Create Your Account',
          style: AppTextStyle.font26Bold.copyWith(color: colors.primaryText),
          textAlign: TextAlign.center,
        ),
        VerticalSpace(15),
        Text(
          'Sign up to enjoy the best managing\nexperience!',
          style: AppTextStyle.font18SemiBold.copyWith(
            color: colors.subTitleText,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
