import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationSuccessCard extends StatelessWidget {
  const VerificationSuccessCard({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.08),
            blurRadius: 30.r,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Checkmark icon with border
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colors.primary, width: 3.w),
            ),
            child: Icon(Icons.check, size: 40.sp, color: colors.primary),
          ),

          const VerticalSpace(20),

          // Label text
          Text(
            label,
            style: AppTextStyle.font20Bold.copyWith(color: colors.buttonText),
          ),
        ],
      ),
    );
  }
}
