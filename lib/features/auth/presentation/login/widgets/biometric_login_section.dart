import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BiometricLoginSection extends StatelessWidget {
  const BiometricLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: colors.secondaryText.withValues(alpha: 0.3),
                thickness: 1.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Or login with',
                style: AppTextStyle.font14Regular.copyWith(
                  color: colors.secondaryText,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: colors.secondaryText.withValues(alpha: 0.3),
                thickness: 1.w,
              ),
            ),
          ],
        ),
        const VerticalSpace(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BiometricButton(
              image: AppAssets.fingerIdIcon,
              onTap: () {
                context.pushNamed(Routes.touchId);
              },
            ),
            const HorizontalSpace(48),
            _BiometricButton(
              image: AppAssets.faceIdIcon,
              onTap: () {
                context.pushNamed(Routes.faceId);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _BiometricButton extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const _BiometricButton({required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        child: SvgPicture.asset(image),
      ),
    );
  }
}
