import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/core/theme/theme_extension.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';

class RememberMeAndForgetPassword extends StatelessWidget {
  const RememberMeAndForgetPassword({
    super.key,
    required this.onChanged,
    required this.value,
  });

  final ValueChanged<bool?> onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.appColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomCheckbox(onChanged: onChanged, colors: colors, value: value),
            HorizontalSpace(8),
            Text(
              'Remember me',
              style: AppTextStyle.font14Medium.copyWith(
                color: colors.primaryText,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // TODO: Navigate to forgot password
          },
          child: Text(
            'Forget Password?',
            style: AppTextStyle.font14Medium.copyWith(color: colors.buttonText),
          ),
        ),
      ],
    );
  }
}
