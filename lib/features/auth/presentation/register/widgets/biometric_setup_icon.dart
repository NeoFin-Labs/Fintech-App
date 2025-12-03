import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BiometricSetupIcon extends StatelessWidget {
  const BiometricSetupIcon({super.key, required this.iconPath});

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Container(
      width: 150.w,
      height: 150.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const Spacer(),
          SvgPicture.asset(
            iconPath,
            width: 80.w,
            height: 80.h,
            colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
          ),
          const VerticalSpace(16),
          Text(
            'Face ID',
            style: AppTextStyle.font24Medium.copyWith(color: colors.primary),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
