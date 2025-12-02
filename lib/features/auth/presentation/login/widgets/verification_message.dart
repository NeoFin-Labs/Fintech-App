import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class VerificationMessage extends StatelessWidget {
  const VerificationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // "You're verified" heading
        Text(
          "You're verified",
          style: AppTextStyle.font26Bold.copyWith(color: colors.buttonText),
        ),

        const VerticalSpace(20),

        // Description text
        Text(
          "You have been verified your information completely. Let's make transactions!",
          textAlign: TextAlign.center,
          style: AppTextStyle.font16Medium.copyWith(
            color: colors.secondaryText,
          ),
        ),
      ],
    );
  }
}
