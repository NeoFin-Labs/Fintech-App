import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/widgets.dart';
import 'package:fintech_app/features/auth/presentation/register/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FingerprintSetupView extends StatelessWidget {
  const FingerprintSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.setFingerprintSuccess);
      },
      child: AuthBackground(
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                const VerticalSpace(60),
      
                // Header
                const BiometricSetupHeader(
                  title: 'Set Your Finger Print',
                  subtitle:
                      'Add a fingerprint to make your account\nmore secure.',
                ),
      
                const Spacer(),
      
                // Fingerprint Icon
                BiometricSetupIcon(iconPath: AppAssets.fingerIdIcon),
      
                const VerticalSpace(60),
      
                // Instruction text
                InstructionText(
                  text:
                      'Place your finger in fingerprint\nsensor until the icon completely',
                  textColor: colors.subTitleText,
                  withShadow: false,
                ),
      
                const Spacer(),
      
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: ScreenUtil().screenWidth / 2,
                    child: OutlinedButton(
                      onPressed: () {
                        context.pushNamed(Routes.setFaceId);
                      },
                      child: const Text('Skip'),
                    ),
                  ),
                ),
      
                const VerticalSpace(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
