import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TitleAndSeeAll extends StatelessWidget {
  const TitleAndSeeAll({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppStyles.textRegular24),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See All',
            style: AppStyles.textRegular14.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
