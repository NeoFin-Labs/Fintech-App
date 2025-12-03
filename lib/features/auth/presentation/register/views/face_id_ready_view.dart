import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdReadyView extends StatelessWidget {
  const FaceIdReadyView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(AppAssets.faceIdBackground, fit: BoxFit.cover),

          // Main content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  const Spacer(),

                  // "You're Ready!" heading
                  Text(
                    "You're Ready!",
                    style: AppTextStyle.font26Bold.copyWith(
                      color: colors.white,
                      shadows: [
                        Shadow(
                          color: colors.black.withValues(alpha: 0.3),
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                  ),

                  const VerticalSpace(40),

                  // Face ID success card
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.w,
                      vertical: 20.h,
                    ),
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
                            border: Border.all(
                              color: colors.primary,
                              width: 3.w,
                            ),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 40.sp,
                            color: colors.primary,
                          ),
                        ),

                        const VerticalSpace(20),

                        // Label text
                        Text(
                          'Face ID',
                          style: AppTextStyle.font20Bold.copyWith(
                            color: colors.buttonText,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Continue button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to next screen
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 56.h),
                    ),
                    child: Text('Continue'),
                  ),

                  const VerticalSpace(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
