import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_fonts.dart';
import 'package:first_project/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppFonts.filsonPro,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.labelColorLightThemePrimary,
        onPrimary: AppColors.labelColorLightThemePrimary,
        secondary: AppColors.orangeGradient2,
        secondaryFixedDim: AppColors.orangeGradient1,
        secondaryContainer: AppColors.yellow,
        onSecondary: Colors.white,
        error: Color(0xFFE80F43),
        onError: Colors.white,
        surface: AppColors.backgroundColor,
        surfaceBright: AppColors.loginBackgroundColor,
        surfaceDim: AppColors.buttonSecond,
        onSurface: AppColors.labelColorLightThemePrimary,
        onSurfaceVariant: AppColors.regularTextColor,
        tertiary: AppColors.green,
        surfaceTint: AppColors.titleColor,
        surfaceContainerLowest: Colors.black,
      ),
      primaryColor: AppColors.labelColorLightThemePrimary,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: const TextTheme(
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
    );
  }
}
