import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingActionButtons extends StatelessWidget {
  const OnboardingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Login Button
          AuthButton(
            onPressed: () {
              context.pushReplacementNamed(Routes.login);
            }, buttonText: 'Login', isLoading: false,
          ),
          SizedBox(height: 16.h),
          // Register Button
          OutlinedButton(
            onPressed: () {
              context.pushReplacementNamed(Routes.register);
            },
            child: Text('Register', style: AppTextStyle.font18SemiBold),
          ),
        ],
      ),
    );
  }
}
