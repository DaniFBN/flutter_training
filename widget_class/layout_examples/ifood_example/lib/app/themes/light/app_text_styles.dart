import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const titleAppBar = TextStyle(
    color: Colors.black,
    fontFamily: AppConstants.poppinsFontFamily,
    fontWeight: FontWeight.w500,
  );

  static const toolbarAppBar = TextStyle(
    fontFamily: AppConstants.poppinsFontFamily,
    color: AppColors.white,
    fontSize: 10,
  );

  static const labelTabBar = TextStyle(
    fontFamily: AppConstants.poppinsFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const areaCard = TextStyle(
    fontFamily: AppConstants.poppinsFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.greyFont,
    fontSize: 12,
  );
}
