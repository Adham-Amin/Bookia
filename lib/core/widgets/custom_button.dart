import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.backgroundColor,
    this.colortext,
    this.colorBorder,
    this.isSmall = false,
  });

  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color? colortext;
  final Color? colorBorder;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: colorBorder ?? backgroundColor),
          ),
        ),
        child: Text(
          title,
          style: isSmall
              ? AppStyles.textRegular14.copyWith(
                  color: colortext ?? AppColors.white,
                )
              : AppStyles.textRegular20.copyWith(
                  color: colortext ?? AppColors.white,
                ),
        ),
      ),
    );
  }
}
