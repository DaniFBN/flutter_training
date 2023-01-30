import 'package:flutter/material.dart';

import '../utils/app_constants.dart';
import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const titleMedium = TextStyle(
    fontSize: 16,
    fontFamily: AppConstants.poppinsFontFamily,
    fontWeight: FontWeight.w500,
  );
  static const labelMedium = TextStyle(
    fontSize: 12,
    fontFamily: AppConstants.poppinsFontFamily,
    fontWeight: FontWeight.w500,
  );
  
  static const bodyMedium = TextStyle(
    fontSize: 12,
    fontFamily: AppConstants.poppinsFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.greyText,
  );
  static const bodySmall = TextStyle(
    fontSize: 10,
    fontFamily: AppConstants.poppinsFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.greyText,
  );
  static final appBarTitle = AppTextStyles.titleMedium.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );
}
