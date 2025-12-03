import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class BiometricSetupHeader extends StatelessWidget {
  const BiometricSetupHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.font26Bold.copyWith(color: colors.primaryText),
        ),
        const VerticalSpace(16),
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
