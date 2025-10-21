import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/custom_snack_bar.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/core/widgets/show_loading.dart';
import 'package:bookia/features/auth/data/models/request/verify_code_request.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key, required this.email});

  final String email;

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  num otp = 0;

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
            AppRoutes.newPasswordView,
            arguments: otp,
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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('OTP Verification', style: AppStyles.textRegular30),
                HeightBox(10),
                Text(
                  'Enter the verification code we just sent on your email address.',
                  style: AppStyles.textRegular16.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                HeightBox(32),
                OtpInput(
                  onChanged: (value) {
                    setState(() {
                      otp = num.parse(value);
                    });
                  },
                ),
                HeightBox(32),
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<AuthCubit>().verifyCode(
                        verifyCodeRequest: VerifyCodeRequest(
                          email: widget.email,
                          verifyCode: otp,
                        ),
                      );
                    }
                  },
                  title: 'Verify',
                  backgroundColor: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
