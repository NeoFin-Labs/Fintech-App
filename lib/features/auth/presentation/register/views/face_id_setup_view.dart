import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/widgets.dart';
import 'package:fintech_app/features/auth/presentation/register/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdSetupView extends StatelessWidget {
  const FaceIdSetupView({super.key});

  @override
  Widget build(BuildContext context) {

    return AuthBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            const VerticalSpace(60),

            // Header
            const BiometricSetupHeader(
              title: 'Set Your Face ID',
              subtitle: 'Add your face ID to make your account\nmore secure.',
            ),

            const Spacer(),

            // Face ID Icon
            BiometricSetupIcon(iconPath: AppAssets.faceIdIcon),

            const Spacer(),

            // Buttons row
            Row(
              children: [
                // Skip button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigate to next screen or skip
                    },
                    child: Text('Skip'),
                  ),
                ),

                const HorizontalSpace(16),

                // Continue button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(Routes.setFaceId);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 56.h),
                    ),
                    child: Text('continue'),
                  ),
                ),
              ],
            ),

            const VerticalSpace(40),
          ],
        ),
      ),
    );
  }
}
