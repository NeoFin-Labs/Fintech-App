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
          getIt<BiometricCubit>()..checkBiometricAvailability(),
      child: BlocConsumer<BiometricCubit, BiometricState>(
        listener: (context, state) {
          if (state is BiometricAvailabilityError) {
            AppLogger.logError(
              'Biometric availability error: ${state.message}',
            );
          }
          if (state is BiometricAuthenticationSuccessState) {
            context.pushReplacementNamed(Routes.home);
          }
        },
        builder: (context, state) {
          if (state is BiometricAvailabilitySuccess) {
            return _buildBiometricSection(context, colors, state);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  /// Build the biometric login section
  Widget _buildBiometricSection(
    BuildContext context,
    AppColors colors,
    BiometricAvailabilitySuccess state,
  ) {
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
            _BiometricButton(
              onTap: () {
                context.read<BiometricCubit>().authenticateWithBiometric();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.faceIdIcon),
                  const HorizontalSpace(5),
                  SvgPicture.asset(AppAssets.fingerIdIcon),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BiometricButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const _BiometricButton({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: colors.primaryText.withValues(alpha: 0.2),
            width: 1.5.w,
          ),
        ),
        child: child,
      ),
    );
  }
}
