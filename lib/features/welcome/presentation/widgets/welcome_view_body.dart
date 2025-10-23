import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Image.asset(
          AppAssets.imagesBgWelcome,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              SvgPicture.asset(
                AppAssets.svgsLogo,
                colorFilter: isDark
                    ? ColorFilter.mode(AppColors.white, BlendMode.srcIn)
                    : null,
              ),
              HeightBox(24),
              Text('Order Your Book Now!', style: AppStyles.textRegular20),
              Spacer(flex: 4),
              CustomButton(
                title: 'Login',
                backgroundColor: AppColors.primary,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.loginView);
                },
              ),
              HeightBox(16),
              CustomButton(
                title: 'Register',
                backgroundColor: AppColors.white,
                colortext: AppColors.black,
                colorBorder: AppColors.black,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.registerView);
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
