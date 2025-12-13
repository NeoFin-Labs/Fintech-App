import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech_app/features/onboarding/data/datasources/onboarding_data.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
    : super(const OnboardingState(currentPage: 0, isLastPage: false));

  void onPageChanged(int page) {
    final isLast = page == OnboardingData.pages.length - 1;
    emit(state.copyWith(currentPage: page, isLastPage: isLast));
  }

  void nextPage() {
    if (state.currentPage < OnboardingData.pages.length - 1) {
      emit(
        state.copyWith(
          currentPage: state.currentPage + 1,
          isLastPage: state.currentPage + 1 == OnboardingData.pages.length - 1,
        ),
      );
    }
  }

  void skipToLast() {
    emit(
      state.copyWith(
        currentPage: OnboardingData.pages.length - 1,
        isLastPage: true,
      ),
    );
  }
}
