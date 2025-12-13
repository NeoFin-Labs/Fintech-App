import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Decorative background element
          Positioned(
            top: -149.h,
            right: -112.w,
            child: Container(
              width: 320.w,
              height: 320.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.theme.appColors.authCircle,
              ),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
