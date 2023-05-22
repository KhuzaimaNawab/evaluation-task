import 'package:evaluation/theme/textstyle_theme.dart';
import 'package:flutter/material.dart';

import 'color_theme.dart';

class ThemesTheme {
  static TextTheme textTheme = TextTheme(
    headlineLarge: AppTextStyles.LargeHeadline,
    headlineSmall: AppTextStyles.headlineSmall,
    bodyMedium: AppTextStyles.bodyMedium,
  );

  static ColorScheme light = const ColorScheme.light(
    primary: AppColors.primary,
    background: AppColors.background,
  );

  static ThemeData themeDatalight = ThemeData(
    textTheme: textTheme,
    colorScheme: light,
  );
}
