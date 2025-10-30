import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/services/shared_preferences_service.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/custom_snack_bar.dart';
import 'package:bookia/core/widgets/custom_text_form_field_password.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/core/widgets/show_loading.dart';
import 'package:bookia/features/profile/presentation/manager/delete_acc_cubit/delete_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccountViewBody extends StatefulWidget {
  const DeleteAccountViewBody({super.key});

  @override
  State<DeleteAccountViewBody> createState() => _DeleteAccountViewBodyState();
}

class _DeleteAccountViewBodyState extends State<DeleteAccountViewBody> {
  late TextEditingController _passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              HeightBox(16.h),
              Text(
                'Are you sure you want to delete your account? This action cannot be undone.',
                style: AppStyles.textRegular16,
              ),
              HeightBox(16.h),
              CustomTextFormFieldPassword(
                hintText: 'Password',
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              HeightBox(32.h),
              BlocListener<DeleteAccountCubit, DeleteAccountState>(
                listener: (context, state) {
                  if (state is DeleteAccountLoading) {
                    showDialogLoading(context);
                  }
                  if (state is DeleteAccountSuccess) {
                    Navigator.pop(context);
                    customSnackBar(
                      context: context,
                      message: 'Account deleted successfully',
                      type: AnimatedSnackBarType.success,
                    );
                    Prefs.clearUserData();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.welcomeView,
                      (route) => false,
                    );
                  }
                  if (state is DeleteAccountError) {
                    Navigator.pop(context);
                    customSnackBar(
                      context: context,
                      message: state.message,
                      type: AnimatedSnackBarType.error,
                    );
                  }
                },
                child: CustomButton(
                  title: 'Delete Account',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<DeleteAccountCubit>().deleteAccount(
                        password: _passwordController.text,
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
