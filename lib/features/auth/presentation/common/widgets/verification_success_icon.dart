import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationSuccessIcon extends StatelessWidget {
  const VerificationSuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Container(
      width: 150.w,
      height: 150.h,
      decoration: BoxDecoration(shape: BoxShape.circle, color: colors.primary),
      child: Icon(Icons.check, size: 80.sp, color: colors.white),
    );
  }
}
