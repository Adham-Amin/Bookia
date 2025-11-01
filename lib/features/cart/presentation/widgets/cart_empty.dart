import 'package:bookia/core/functions/navigate_to_tab.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Cart is Empty',
          textAlign: TextAlign.center,
          style: AppStyles.textRegular24,
        ),
        HeightBox(12),
        CustomButton(
          onTap: () {
            navigateToTab(context, 0);
          },
          title: 'Explore Categories',
          backgroundColor: AppColors.primary,
        ),
      ],
    );
  }
}
