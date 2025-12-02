import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InstructionText extends StatelessWidget {
  const InstructionText({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Text(
        'Please wait until your scanning is complete',
        textAlign: TextAlign.center,
        style: AppTextStyle.font18SemiBold.copyWith(
          color: colors.white,
          shadows: [
            Shadow(
              color: colors.black.withValues(alpha: 0.3),
              blurRadius: 10.r,
            ),
          ],
        ),
      ),
    );
  }
}
