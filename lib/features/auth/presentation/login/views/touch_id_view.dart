import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TouchIdView extends StatelessWidget {
  const TouchIdView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.touchIdVerification);
      },
      child: AuthBackground(
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              children: [
                // Top spacing
                const VerticalSpace(60),

                // Title
                Text(
                  'Touch ID sensor to verify\nyourself',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font26Bold.copyWith(
                    color: colors.primaryText,
                  ),
                ),

                const Spacer(),

                // Fingerprint Icon with animation
                const FingerprintScanner(),

                const Spacer(),

                // Instruction text
                InstructionText(
                  text:
                      'Please verify your identity using touch\nID and it will proceed automatically.',
                  textColor: colors.subTitleText,
                  withShadow: false,
                ),

                const VerticalSpace(100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
