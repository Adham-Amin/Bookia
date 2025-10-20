import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/custom_text_form_field_password.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/auth/presentation/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          children: [
            Text(
              'Welcome back! Glad to see you, Again!',
              style: AppStyles.textRegular30,
            ),
            HeightBox(32),
            CustomTextFormField(hintText: 'Email'),
            HeightBox(16),
            CustomTextFormFieldPassword(hintText: 'Password'),
            HeightBox(16),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.forgotPasswordView);
                },
                child: Text(
                  'Forgot Password?',
                  style: AppStyles.textRegular14.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            HeightBox(32),
            CustomButton(
              onTap: () {},
              title: 'Login',
              backgroundColor: AppColors.primary,
            ),
            HeightBox(32),
            SocialLogin(),
          ],
        ),
      ),
    );
  }
}
