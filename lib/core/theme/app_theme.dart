import 'package:fintech_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColorsLight.primary,
    colorSchemeSeed: AppColorsLight.primary,
    scaffoldBackgroundColor: AppColorsLight.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColorsLight.primary,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColorsDark.primary,
    colorSchemeSeed: AppColorsDark.primary,
    scaffoldBackgroundColor: AppColorsDark.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColorsDark.primaryText,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
}
