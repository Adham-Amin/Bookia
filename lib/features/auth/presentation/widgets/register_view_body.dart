import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/custom_text_form_field_password.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          children: [
            Text(
              'Hello! Register to get started',
              style: AppStyles.textRegular30,
            ),
            HeightBox(32),
            CustomTextFormField(hintText: 'Username'),
            HeightBox(16),
            CustomTextFormField(hintText: 'Email'),
            HeightBox(16),
            CustomTextFormFieldPassword(hintText: 'Password'),
            HeightBox(16),
            CustomTextFormFieldPassword(hintText: 'Confirm Password'),
            HeightBox(32),
            CustomButton(
              onTap: () {},
              title: 'Register',
              backgroundColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
