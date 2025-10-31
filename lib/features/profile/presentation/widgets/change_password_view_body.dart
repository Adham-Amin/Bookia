import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/custom_snack_bar.dart';
import 'package:bookia/core/widgets/custom_text_form_field_password.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/core/widgets/show_loading.dart';
import 'package:bookia/features/profile/presentation/manager/change_pass_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  late TextEditingController oldPassword, newPassword, confirmPassword;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    oldPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            HeightBox(24),
            CustomTextFormFieldPassword(
              hintText: 'Current Password',
              controller: oldPassword,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter password'
                  : null,
            ),
            HeightBox(16),
            CustomTextFormFieldPassword(
              hintText: 'New Password',
              controller: newPassword,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter new password'
                  : null,
            ),
            HeightBox(16),
            CustomTextFormFieldPassword(
              hintText: 'Confirm Password',
              controller: confirmPassword,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter confirm password'
                  : null,
            ),
            HeightBox(32),
            BlocListener<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state is ChangePasswordLoading) {
                  showDialogLoading(context);
                } else if (state is ChangePasswordSuccess) {
                  Navigator.pop(context);
                  customSnackBar(
                    context: context,
                    message: 'Updated Successfully',
                    type: AnimatedSnackBarType.success,
                  );
                  Navigator.pop(context, true);
                } else if (state is ChangePasswordError) {
                  Navigator.pop(context);
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
              },
              child: CustomButton(
                title: 'Update',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (newPassword.text == confirmPassword.text) {
                      context.read<ChangePasswordCubit>().changePassword(
                        confirmPassword: confirmPassword.text,
                        oldPassword: oldPassword.text,
                        newPassword: newPassword.text,
                      );
                    } else {
                      customSnackBar(
                        context: context,
                        message: 'Password does not match',
                        type: AnimatedSnackBarType.error,
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                backgroundColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
