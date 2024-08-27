import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color primaryColorLight = Color(0xFFBB86FC);
  static const Color primaryColorDark = Color(0xFF3700B3);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF000000);
}

class AppFonts {
  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'Arial';
}

// ThemeData appTheme = ThemeData(
//   primaryColor: AppColors.primaryColor,
//   hintColor: AppColors.secondaryColor,
//   textTheme: const TextTheme(
//     bodyText1: TextStyle(
//       fontFamily: AppFonts.primaryFont,
//       color: AppColors.textColor,
//     ),
//     bodyText2: TextStyle(
//       fontFamily: AppFonts.secondaryFont,
//       color: AppColors.textColor,
//     ),
//   ), colorScheme: ColorScheme(background: AppColors.backgroundColor),
// );