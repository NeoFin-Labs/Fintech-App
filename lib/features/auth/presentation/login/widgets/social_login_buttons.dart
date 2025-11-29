import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;

  const SocialLoginButtons({
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
              child: _SocialLoginButton(
                onPressed: onGooglePressed,
                iconUrl: 'https://www.google.com/favicon.ico',
                label: 'Google',
                colors: colors,
              ),
            ),
            HorizontalSpace(16),
            Expanded(
              child: _SocialLoginButton(
                onPressed: onFacebookPressed,
                iconUrl: 'https://www.facebook.com/favicon.ico',
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

class _SocialLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconUrl;
  final String label;
  final AppColors colors;

  const _SocialLoginButton({
    required this.onPressed,
    required this.iconUrl,
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
            Image.network(
              iconUrl,
              width: 24.w,
              height: 24.h,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to icon if image fails to load
                return Icon(
                  label == 'Google' ? Icons.g_mobiledata : Icons.facebook,
                  size: 24.sp,
                  color: colors.iconPrimary,
                );
              },
            ),
            HorizontalSpace(8),
            Text(
              label,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
