import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/custom_text_form_field_password.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create New Password', style: AppStyles.textRegular30),
            HeightBox(10),
            Text(
              'Your new password must be unique from those previously used.',
              style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
            ),
            HeightBox(32),
            CustomTextFormFieldPassword(hintText: 'New Password'),
            HeightBox(16),
            CustomTextFormFieldPassword(hintText: 'Confirm Password'),
            HeightBox(32),
            CustomButton(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.successView,
                  arguments: {
                    'headerTitle': 'Password Changed!',
                    'subTitle': 'Your password has been changed successfully.',
                    'buttonTitle': 'Back to Login',
                    'nextRoute': AppRoutes.welcomeView,
                  },
                  (route) => false,
                );
              },
              title: 'Reset Password',
              backgroundColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
