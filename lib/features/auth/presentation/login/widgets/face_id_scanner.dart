import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FaceIdScanner extends StatefulWidget {
  const FaceIdScanner({super.key});

  @override
  State<FaceIdScanner> createState() => _FaceIdScannerState();
}

class _FaceIdScannerState extends State<FaceIdScanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Container(
              width: 155.w,
              height: 158.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: 0.2),
                    blurRadius: 30.r,
                    spreadRadius: 5.r,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Face ID Icon
                  SvgPicture.asset(
                    AppAssets.faceIdIcon,
                    width: 64.w,
                    height: 64.h,
                    colorFilter: ColorFilter.mode(
                      colors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const VerticalSpace(16),
                  // Face ID Text
                  Text(
                    'Face ID',
                    style: AppTextStyle.font24Bold.copyWith(
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
