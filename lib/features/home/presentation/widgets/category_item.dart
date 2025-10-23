import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.categoryView,
          arguments: category,
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isDark ? AppColors.primary : AppColors.bgLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(category.name, style: AppStyles.textRegular16),
      ),
    );
  }
}
