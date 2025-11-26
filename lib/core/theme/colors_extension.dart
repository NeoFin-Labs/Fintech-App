import 'package:flutter/material.dart';
import 'package:fintech_app/core/utils/app_colors_light.dart';

class AppColors {
  const AppColors._({
    required this.primary,
    required this.secondary,
    required this.white,
    required this.black,
    required this.background,
    required this.primaryText,
    required this.secondaryText,
    required this.textBlack,
    required this.textGray,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.safePrimary,
    required this.safePrimaryLight,
    required this.safeSecondary,
    required this.lightGreen,
    required this.dangerPrimary,
    required this.dangerSecondary,
    required this.blue,
    required this.orange,
    required this.lightOrange,
    required this.lightGray,
    required this.gradientPrimary,
    required this.gradientSecondary,
  });

  // Primary Colors
  final Color primary;
  final Color secondary;
  final Color white;
  final Color black;

  // Background Colors
  final Color background;

  // Text Colors
  final Color primaryText;
  final Color secondaryText;
  final Color textBlack;
  final Color textGray;

  // Icon Colors
  final Color iconPrimary;
  final Color iconSecondary;

  // Safe colors
  final Color safePrimary;
  final Color safePrimaryLight;
  final Color safeSecondary;
  final Color lightGreen;

  // Danger Colors
  final Color dangerPrimary;
  final Color dangerSecondary;

  // Extra colors
  final Color blue;
  final Color orange;
  final Color lightOrange;
  final Color lightGray;

  // Gradient colors
  final Color gradientPrimary;
  final Color gradientSecondary;

  factory AppColors._light() {
    return AppColors._(
      primary: AppColorsLight.primary,
      secondary: AppColorsLight.secondary,
      white: AppColorsLight.white,
      black: AppColorsLight.black,
      background: AppColorsLight.background,
      primaryText: AppColorsLight.primaryText,
      secondaryText: AppColorsLight.secondaryText,
      textBlack: AppColorsLight.textBlack,
      textGray: AppColorsLight.textGray,
      iconPrimary: AppColorsLight.iconPrimary,
      iconSecondary: AppColorsLight.iconSecondary,
      safePrimary: AppColorsLight.safePrimary,
      safePrimaryLight: AppColorsLight.safePrimaryLight,
      safeSecondary: AppColorsLight.safeSecondary,
      lightGreen: AppColorsLight.lightGreen,
      dangerPrimary: AppColorsLight.dangerPrimary,
      dangerSecondary: AppColorsLight.dangerSecondary,
      blue: AppColorsLight.blue,
      orange: AppColorsLight.orange,
      lightOrange: AppColorsLight.lightOrange,
      lightGray: AppColorsLight.lightGray,
      gradientPrimary: AppColorsLight.gradientPrimary,
      gradientSecondary: AppColorsLight.gradientSecondary,
    );
  }

  factory AppColors._dark() {
    return AppColors._(
      primary: AppColorsDark.primary,
      secondary: AppColorsDark.primary,
      white: AppColorsDark.white,
      black: AppColorsDark.black,
      background: AppColorsDark.background,
      primaryText: AppColorsDark.primaryText,
      secondaryText: AppColorsDark.secondaryText,
      textBlack: AppColorsDark.textBlack,
      textGray: AppColorsDark.textGray,
      iconPrimary: AppColorsDark.iconPrimary,
      iconSecondary: AppColorsDark.iconSecondary,
      safePrimary: AppColorsDark.safePrimary,
      // Fallback to light theme colors for missing dark theme colors
      safePrimaryLight: AppColorsLight.safePrimaryLight,
      safeSecondary: AppColorsLight.safeSecondary,
      lightGreen: AppColorsLight.lightGreen,
      dangerPrimary: AppColorsLight.dangerPrimary,
      dangerSecondary: AppColorsLight.dangerSecondary,
      blue: AppColorsLight.blue,
      orange: AppColorsLight.orange,
      lightOrange: AppColorsLight.lightOrange,
      lightGray: AppColorsLight.lightGray,
      gradientPrimary: AppColorsDark.primaryText,
      gradientSecondary: Color(0x1AFFFFFF),
    );
  }
}

extension ColorExtension on ThemeData {
  AppColors get appColors {
    if (brightness == Brightness.dark) return AppColors._dark();
    return AppColors._light();
  }
}
