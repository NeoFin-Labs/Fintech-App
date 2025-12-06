import 'package:fintech_app/core/di/injection_container.dart';
import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/logger/app_logger.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/biometric_availability_cubit.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/biometric_availability_state.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BiometricLoginSection extends StatelessWidget {
  const BiometricLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return BlocProvider(
      create: (context) =>
          getIt<BiometricAvailabilityCubit>()..checkBiometricAvailability(),
      child:
          BlocBuilder<BiometricAvailabilityCubit, BiometricAvailabilityState>(
            builder: (context, state) {
              // Use pattern matching to handle different states
              return switch (state) {
                BiometricAvailabilityInitial() => const SizedBox.shrink(),
                BiometricAvailabilityLoading() => const SizedBox.shrink(),
                BiometricAvailabilityError() => const SizedBox.shrink(),
                BiometricAvailabilitySuccess() => _buildBiometricSection(
                  context,
                  colors,
                  state,
                ),
              };
            },
          ),
    );
  }

  Widget _buildBiometricSection(
    BuildContext context,
    AppColors colors,
    BiometricAvailabilitySuccess state,
  ) {
    AppLogger.logInfo('Strong Biometric: ${state.hasStrongBiometric}');

    // Only show the section if STRONG biometric authentication is available
    // This ensures only hardware-based biometrics (Face ID, Touch ID, etc.) are shown
    if (!state.hasStrongBiometric) {
      AppLogger.logInfo('No strong biometric available - hiding section');
      return const SizedBox.shrink();
    }

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
        const VerticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Show fingerprint button only if available
            if (state.isStrongBiometricAvailable) ...[
              _BiometricButton(
                image: AppAssets.fingerIdIcon,
                onTap: () {
                  context.pushNamed(Routes.touchId);
                },
              ),
              if (state.isFaceIdAvailable) const HorizontalSpace(48),
            ],
            if (state.isStrongBiometricAvailable) const HorizontalSpace(48),
            // Show Face ID button only if available
            if (state.isStrongBiometricAvailable)
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
