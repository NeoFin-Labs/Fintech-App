import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/widgets.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdView extends StatelessWidget {
  const FaceIdView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.faceIdVerification);
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
                  // Top spacing
                  const VerticalSpace(100),
                  const Spacer(),

                  // Face ID Icon with animation
                  const FaceIdScanner(),

                  const VerticalSpace(60),

                  // Instruction text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const InstructionText(),
                  ),

                  const Spacer(),

                  // Loading indicator
                  const LoadingIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
