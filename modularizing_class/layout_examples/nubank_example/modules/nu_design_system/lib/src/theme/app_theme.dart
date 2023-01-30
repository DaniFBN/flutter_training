import 'package:flutter/material.dart';
import 'package:nu_design_system/src/theme/app_text_styles.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final theme = ThemeData(
    primaryColor: AppColors.purplePrimary,
    primaryColorLight: AppColors.purpleLight,
    cardColor: AppColors.cardColor,
    dividerColor: AppColors.dividerColor,
    hintColor: AppColors.greyText,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        backgroundColor: AppColors.cardColor,
        foregroundColor: Colors.black,
        textStyle: AppTextStyles.labelMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: AppTextStyles.titleMedium,
      labelMedium: AppTextStyles.labelMedium,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
    ),
    primaryTextTheme: TextTheme(
      titleMedium: AppTextStyles.titleMedium.copyWith(
        color: AppColors.white,
      ),
      labelMedium: AppTextStyles.labelMedium.copyWith(
        color: AppColors.white,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: AppColors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.purplePrimary,
      titleTextStyle: AppTextStyles.appBarTitle,
      iconTheme: const IconThemeData(
        size: 22,
        color: AppColors.white,
      ),
    ),
  );
}
