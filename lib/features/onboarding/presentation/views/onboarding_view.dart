import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/theme/theme_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:fintech_app/features/onboarding/data/datasources/onboarding_data.dart';
import 'package:fintech_app/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:fintech_app/features/onboarding/presentation/widgets/onboarding_page_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentIndex < OnboardingData.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: 16.h, right: 24.w),
                child: TextButton(
                  onPressed: _navigateToLogin,
                  child: Text(
                    'Skip',
                    style: AppTextStyle.font16Medium.copyWith(
                      color: context.theme.appColors.buttonText,
                    ),
                  ),
                ),
              ),
            ),

            // Page View
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnboardingData.pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPageContent(
                    page: OnboardingData.pages[index],
                    imagePath: OnboardingData.pages[index].imagePath,
                  );
                },
              ),
            ),

            // Bottom Section (Indicator + Next/Get Started)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Indicators
                  Row(
                    children: List.generate(
                      OnboardingData.pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.only(right: 6.w),
                        width: index == _currentIndex ? 32.w : 6.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: index == _currentIndex
                              ? context.theme.appColors.buttonText
                              : context.theme.appColors.buttonText.withValues(
                                  alpha: 0.3,
                                ),
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                      ),
                    ),
                  ),

                  // Next Button
                  OnboardingNextButton(onPressed: _onNext),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
