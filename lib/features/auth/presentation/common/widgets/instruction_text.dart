import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InstructionText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final bool withShadow;

  const InstructionText({
    super.key,
    this.text = 'Please wait until your scanning is complete',
    this.textColor,
    this.withShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTextStyle.font18SemiBold.copyWith(
        color: textColor ?? colors.white,
        shadows: withShadow
            ? [
                Shadow(
                  color: colors.black.withValues(alpha: 0.3),
                  blurRadius: 10.r,
                ),
              ]
            : null,
      ),
    );
  }
}
