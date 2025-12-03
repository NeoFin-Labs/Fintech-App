import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TouchIdSuccessView extends StatelessWidget {
  const TouchIdSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            const Spacer(flex: 3),

            // Touch ID success icon
            const VerificationSuccessIcon(),

            const VerticalSpace(80),

            // Verification message
            const VerificationMessage(),

            const Spacer(flex: 2),

            // Continue button
            ElevatedButton(onPressed: () {}, child: Text('Continue To Home')),

            const VerticalSpace(40),
          ],
        ),
      ),
    );
  }
}
