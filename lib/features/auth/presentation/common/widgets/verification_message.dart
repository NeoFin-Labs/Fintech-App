import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class VerificationMessage extends StatelessWidget {
  const VerificationMessage({
    super.key,
    this.title = "You're verified",
    this.subtitle =
        "You have been verified your information completely. Let's make transactions!",
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title heading
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.font26Bold.copyWith(color: colors.buttonText),
        ),

        const VerticalSpace(20),

        // Description text
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.font16Medium.copyWith(
            color: colors.secondaryText,
          ),
        ),
      ],
    );
  }
}
