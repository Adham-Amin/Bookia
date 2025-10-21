import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_snack_bar.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/core/widgets/show_loading.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/widgets/forget_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialogLoading(context);
        } else if (state is AuthSuccess) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.otpView,
            arguments: state.user?.email,
          );
        } else if (state is AuthError) {
          Navigator.pop(context);
          customSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      child: SingleChildScrollView(
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
              ForgetForm(),
            ],
          ),
        ),
      ),
    );
  }
}
