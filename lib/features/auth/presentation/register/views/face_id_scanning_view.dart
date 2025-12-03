import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdScanningView extends StatelessWidget {
  const FaceIdScanningView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.setFaceIdSuccess);
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(AppAssets.faceIdBackground, fit: BoxFit.cover),

            // Main content
            SafeArea(
              child: Column(
                children: [
                  const VerticalSpace(100),

                  // Instruction text at top
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const InstructionText(
                      text:
                          'Place your face ID in face\nscanner until the icon completely',
                    ),
                  ),

                  const Spacer(),

                  // Face ID Scanner
                  const FaceIdScanner(),

                  const VerticalSpace(60),

                  // Bottom instruction text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const InstructionText(
                      text:
                          'Once your scanning is complete, you will\nbe able to sign in by using face ID',
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
