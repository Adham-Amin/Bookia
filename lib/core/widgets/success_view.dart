import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({
    super.key,
    required this.headerTitle,
    required this.subTitle,
    required this.buttonTitle,
    required this.nextRoute,
  });

  final String headerTitle;
  final String subTitle;
  final String buttonTitle;
  final String nextRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.svgsSuccessMark),
            HeightBox(32),
            Text(headerTitle, style: AppStyles.textRegular26),
            HeightBox(4),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
            ),
            HeightBox(32),
            CustomButton(
              title: buttonTitle,
              backgroundColor: AppColors.primary,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  nextRoute,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Navigator.pushNamedAndRemoveUntil(
//                   context,
//                   AppRoutes.successView,
//                   arguments: {
//                     'headerTitle': 'Password Changed!',
//                     'subTitle': 'Your password has been changed successfully.',
//                     'buttonTitle': 'Back to Login',
//                     'nextRoute': AppRoutes.welcomeView,
//                   },
//                   (route) => false,
//                 );
//               },
