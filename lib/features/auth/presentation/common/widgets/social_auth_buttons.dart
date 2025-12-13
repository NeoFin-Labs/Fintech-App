import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/theme/theme_extension.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SocialAuthButtons extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;

  const SocialAuthButtons({
    super.key,
    required this.onGooglePressed,
    required this.onFacebookPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.appColors;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: colors.secondaryText.withValues(alpha: 0.3),
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Or continue with',
                style: TextStyle(color: colors.secondaryText, fontSize: 14.sp),
              ),
            ),
            Expanded(
              child: Divider(
                color: colors.secondaryText.withValues(alpha: 0.3),
                thickness: 1,
              ),
            ),
          ],
        ),
        VerticalSpace(24),
        Row(
          children: [
            Expanded(
              child: _SocialAuthButton(
                onPressed: onGooglePressed,
                iconPath: AppAssets.googleIcon,
                label: 'Google',
                colors: colors,
              ),
            ),
            HorizontalSpace(16),
            Expanded(
              child: _SocialAuthButton(
                onPressed: onFacebookPressed,
                iconPath: AppAssets.facebookIcon,
                label: 'Facebook',
                colors: colors,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialAuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final String label;
  final AppColors colors;

  const _SocialAuthButton({
    required this.onPressed,
    required this.iconPath,
    required this.label,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: colors.background,
          foregroundColor: colors.primaryText,
          side: BorderSide(
            color: colors.primaryText.withValues(alpha: 0.2),
            width: 1.5.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to icon if image fails to load
                return Icon(
                  label == 'Google' ? Iconsax.google : Iconsax.facebook,
                  size: 24.sp,
                  color: colors.iconPrimary,
                );
              },
            ),
            HorizontalSpace(8),
            Text(
              label,
              style: AppTextStyle.font16SemiBold.copyWith(
                color: colors.primaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
