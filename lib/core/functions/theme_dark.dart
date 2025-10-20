import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData themeDark() {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.darkBg,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.darkBg,
      secondary: AppColors.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkCard,
      hintStyle: AppStyles.textRegular16.copyWith(color: AppColors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBg,
      elevation: 0,
      titleTextStyle: AppStyles.textRegular24.copyWith(color: AppColors.white),
      iconTheme: const IconThemeData(color: AppColors.white),
    ),
    cardColor: const Color(0xFF1E1E1E),
  );
}
