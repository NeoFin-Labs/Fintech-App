import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/theme/theme_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:fintech_app/features/onboarding/data/models/onboarding_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingPageModel page;
  final String imagePath;

  const OnboardingPageContent({super.key, required this.page, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const VerticalSpace(80),
        // Illustration
        Image.asset(
          imagePath,
          height: 280.h,
          width: 280.w,
          fit: BoxFit.contain,
        ),

        const VerticalSpace(60),
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            page.title,
            textAlign: TextAlign.center,
            style: AppTextStyle.font24Bold.copyWith(
              color: context.theme.appColors.primaryText,
            ),
          ),
        ),
        const VerticalSpace(16),
        // Description
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            page.description,
            textAlign: TextAlign.center,
            style: AppTextStyle.font14Regular.copyWith(
              color: context.theme.appColors.secondaryText,
            ),
          ),
        ),
      ],
    );
  }
}
