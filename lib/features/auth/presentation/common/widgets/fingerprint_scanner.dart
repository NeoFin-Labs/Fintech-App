import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fintech_app/core/utils/app_assets.dart';

class FingerprintScanner extends StatefulWidget {
  const FingerprintScanner({super.key});

  @override
  State<FingerprintScanner> createState() => _FingerprintScannerState();
}

class _FingerprintScannerState extends State<FingerprintScanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _opacityAnimation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Container(
              width: 200.w,
              height: 200.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primaryText.withValues(alpha: 0.1),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.fingerIdIcon,
                  width: 120.w,
                  height: 120.h,
                  colorFilter: ColorFilter.mode(
                    colors.primaryText,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
