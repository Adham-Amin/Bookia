import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forget Password?', style: AppStyles.textRegular30),
            HeightBox(10),
            Text(
              'Don\'t worry! It occurs. Please enter the email address linked with your account.',
              style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
            ),
            HeightBox(32),
            CustomTextFormField(hintText: 'Enter Your Email'),
            HeightBox(32),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.otpView);
              },
              title: 'Send Code',
              backgroundColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
