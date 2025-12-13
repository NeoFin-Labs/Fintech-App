import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FingerprintCompleteView extends StatelessWidget {
  const FingerprintCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            const Spacer(flex: 2),

            // Success icon
            const VerificationSuccessIcon(),

            const VerticalSpace(40),

            // Success message
            const VerificationMessage(
              title: 'Your scanning is complete',
              subtitle: 'you will be able to sign in by using fingerprint',
            ),

            const Spacer(flex: 2),

            // Continue button
            ElevatedButton(
              onPressed: () {
                context.pushNamed(Routes.faceIdSetup);
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
    );
  }
}
