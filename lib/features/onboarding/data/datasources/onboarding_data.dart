import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/features/onboarding/data/models/onboarding_page_model.dart';

class OnboardingData {
  static const List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      title: 'Welcome To Crypto X',
      description:
          'Your gateway to the world of cryptocurrency. Manage your assets with ease.',
      imagePath: AppAssets.onboarding1,
    ),
    OnboardingPageModel(
      title: 'Transaction Security',
      description:
          'We prioritize your security with state-of-the-art encryption and protection.',
      imagePath: AppAssets.onboarding2,
    ),
    OnboardingPageModel(
      title: 'Fast And Reliable Market Updated',
      description:
          'Stay ahead of the market with real-time updates and fast transaction processing.',
      imagePath: AppAssets.onboarding3,
    ),
    OnboardingPageModel(
      title: 'Get Started Now!',
      description:
          'Join thousands of users who trust us with their financial journey.',
      imagePath: AppAssets.onboarding4,
    ),
  ];
}
