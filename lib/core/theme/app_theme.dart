import 'package:fintech_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorsLight.primary,
      brightness: Brightness.light,
      primary: AppColorsLight.primary,
      secondary: AppColorsLight.secondary,
      surface: AppColorsLight.background,
    ),
    scaffoldBackgroundColor: AppColorsLight.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColorsLight.primary,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColorsLight.hintText),
      contentPadding: EdgeInsets.only(
        top: 16.h,
        right: 24.w,
        bottom: 16.h,
        left: 24.w,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(width: 1.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(color: AppColorsLight.borderPrimary, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(color: AppColorsLight.primary, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(color: AppColorsLight.dangerPrimary, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(color: AppColorsLight.dangerPrimary, width: 1.w),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorsDark.primary,
      brightness: Brightness.dark,
      primary: AppColorsDark.primary,
      surface: AppColorsDark.background,
    ),
    scaffoldBackgroundColor: AppColorsDark.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColorsDark.primaryText,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColorsDark.hintText),
      
      contentPadding: EdgeInsets.only(
        top: 16.h,
        right: 24.w,
        bottom: 16.h,
        left: 24.w,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(width: 1.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(color: AppColorsDark.borderPrimary, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(color: AppColorsDark.primary, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(color: AppColorsLight.dangerPrimary, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(color: AppColorsLight.dangerPrimary, width: 1.w),
      ),
    ),
  );
}
