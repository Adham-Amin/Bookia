import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(color: AppColors.grey, thickness: 1.w),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'OR',
                style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
              ),
            ),
            Expanded(
              child: Divider(color: AppColors.grey, thickness: 1.w),
            ),
          ],
        ),
        HeightBox(32),
        SocialButton(
          onTap: () {},
          image: AppAssets.svgsIconGoogle,
          title: 'Sign in with Google',
        ),
        HeightBox(16),
        SocialButton(
          onTap: () {},
          image: AppAssets.svgsIconApple,
          title: 'Sign in with Apple',
        ),
      ],
    );
  }
}
