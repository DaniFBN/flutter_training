import 'package:flutter/material.dart';
import 'package:ifood_example/app/themes/light/app_colors.dart';

import '../utils/app_constants.dart';
import 'light/app_text_styles.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: AppConstants.poppinsFontFamily,
    primaryColor: AppColors.primaryRed,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryRed,
      primary: AppColors.primaryRed,
      onPrimary: AppColors.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.white,
      titleTextStyle: AppTextStyles.titleAppBar,
      toolbarTextStyle: AppTextStyles.toolbarAppBar,
      iconTheme: IconThemeData(
        color: AppColors.primaryRed,
        size: 20,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.primaryRed,
      labelStyle: AppTextStyles.labelTabBar,
      unselectedLabelColor: AppColors.grey,
      unselectedLabelStyle: AppTextStyles.labelTabBar,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: AppColors.primaryRed),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.backgroundCard,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    textTheme: const TextTheme(
      titleSmall: AppTextStyles.areaCard,
    ),
  );
}
