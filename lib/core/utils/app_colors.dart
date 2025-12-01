import 'package:flutter/material.dart';

class AppColorsLight {
  AppColorsLight._();
  // Primary Colors
  static const Color primary = Color(0xFF1D3A70);
  static const Color secondary = Color(0xFFF56C2A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Background Colors
  static const Color background = white;

  // Text Colors
  static const Color primaryText = Color(0xFF1E1F4B);
  static const Color secondaryText = Color(0xFF787A8D);
  static const Color subTitleText = Color(0xFF18191F);
  static const Color textBlack = Color(0xFF152C07);
  static const Color textGray = Color(0xFF949494);
  static const Color textGray2 = Color(0xFF8E949A);
  static const Color hintText = Color(0xFF8C8C8C);

  // Icon Colors
  static const Color iconPrimary = Color(0xFF979797);
  static const Color iconSecondary = Color(0xFF222222);
  static const Color prefixIconColor = Color(0xBF000000);

  // border colors
  static const Color borderPrimary = primary;

  // safe colors
  static const Color safePrimary = Color(0xFF00CB6A);
  static const Color safePrimaryLight = Color(0xCC00CB6A);
  static const Color safeSecondary = Color(0xFF26C975);
  static const Color lightGreen = Color(0xFF69D895);

  //danger Colors
  static const Color dangerPrimary = Color(0xCCF26666);
  static const Color dangerSecondary = Color(0xFFEA3429);

  // extra colors
  static const Color blue = Color(0xFF4766F9);
  static const Color orange = Color(0xFFFF403B);
  static const Color lightOrange = Color(0x33FF403B);
  static const Color lightGray = Color(0xFF5E5E5E);

  // gradient colors
  static const Color gradientPrimary = primaryText;
  static const Color gradientSecondary = Color(0x1A1E1F4B);
}

class AppColorsDark {
  AppColorsDark._();
  // Primary Colors
  static const Color primary = Color(0xFF224584);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(
    0xFF000000,
  ); // not appear till now in the app

  // Background Colors
  static const Color background = Color(0xFF121212);

  // Text Colors
  static const Color primaryText = white;
  static const Color secondaryText = Color(0xFFA1A1A1);
  static const Color subTitleText = Color(0xFFE0E1E7);
  static const Color textBlack = Color(0xFF0D0D0D);
  static const Color textGray = Color(0xFF949494);
  static const Color hintText = Color(0xFF8C8C8C);

  // Icon Colors
  static const Color iconPrimary = Color(0xFF979797);
  static const Color iconSecondary = Color(0xFF222222);
  static const Color prefixIconColor = Color(0xB8FFFFFF);

  // border colors
  static const Color borderPrimary = white;

  // safe colors
  static const Color safePrimary = Color(0xFF00E576);
}
