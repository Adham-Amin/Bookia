import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData themeLight() {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: AppStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      surface: AppColors.white,
      brightness: Brightness.light,
      surfaceTint: Colors.transparent,
    ),
    textTheme: TextTheme(
      bodyMedium: AppStyles.textRegular14.copyWith(color: AppColors.black),
      labelLarge: AppStyles.textRegular14.copyWith(color: AppColors.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.bg,
      hintStyle: AppStyles.textRegular16.copyWith(color: AppColors.grey),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    ),
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: AppColors.white),
  );
}
