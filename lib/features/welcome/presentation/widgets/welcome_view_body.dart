import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.imagesBgWelcome,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            SvgPicture.asset(AppAssets.svgsLogo),
            HeightBox(24),
            Text('Order Your Book Now!', style: AppStyles.textRegular20),
            Spacer(flex: 4),
            CustomButton(
              title: 'Login',
              backgroundColor: AppColors.primary,
              onTap: () {},
            ),
            HeightBox(16),
            CustomButton(
              title: 'Register',
              backgroundColor: AppColors.white,
              colortext: AppColors.black,
              colorBorder: AppColors.black,
              onTap: () {},
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.backgroundColor,
    this.colortext,
    this.colorBorder,
  });

  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color? colortext;
  final Color? colorBorder;

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
          style: AppStyles.textRegular14.copyWith(
            color: colortext ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
