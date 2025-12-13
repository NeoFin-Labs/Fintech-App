import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingNextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnboardingNextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: context.theme.appColors.buttonText,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: context.theme.appColors.elevatedButtonFgColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
