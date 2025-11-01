import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconButtomCart extends StatelessWidget {
  const IconButtomCart({super.key, required this.onTap, required this.icon});

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isDark ? AppColors.bgLight : AppColors.black,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Icon(icon, color: isDark ? AppColors.black : AppColors.white),
      ),
    );
  }
}
