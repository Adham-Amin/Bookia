import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/custom_snack_bar.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/core/widgets/show_loading.dart';
import 'package:bookia/features/profile/data/models/requests/update_info_request.dart';
import 'package:bookia/features/profile/presentation/manager/update_info_cubit/update_info_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateInfoViewBody extends StatefulWidget {
  const UpdateInfoViewBody({super.key});

  @override
  State<UpdateInfoViewBody> createState() => _UpdateInfoViewBodyState();
}

class _UpdateInfoViewBodyState extends State<UpdateInfoViewBody> {
  late TextEditingController nameController, addressController, phoneController;

  @override
  void initState() {
    nameController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(24),
          CustomTextFormField(hintText: 'Name', controller: nameController),
          HeightBox(16),
          CustomTextFormField(
            hintText: 'Address',
            controller: addressController,
          ),
          HeightBox(16),
          CustomTextFormField(hintText: 'Phone', controller: phoneController),
          HeightBox(32),
          BlocListener<UpdateInfoCubit, UpdateInfoState>(
            listener: (context, state) {
              if (state is UpdateInfoLoading) {
                showDialogLoading(context);
              } else if (state is UpdateInfoSuccess) {
                Navigator.pop(context);
                customSnackBar(
                  context: context,
                  message: 'Updated Successfully',
                  type: AnimatedSnackBarType.success,
                );
                Navigator.pop(context, true);
              } else if (state is UpdateInfoError) {
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
                if (nameController.text.isNotEmpty ||
                    addressController.text.isNotEmpty ||
                    phoneController.text.isNotEmpty) {
                  BlocProvider.of<UpdateInfoCubit>(context).updateUserInfo(
                    updateInfoRequest: UpdateInfoRequest(
                      name: nameController.text,
                      address: addressController.text,
                      phone: phoneController.text,
                    ),
                  );
                } else {
                  customSnackBar(
                    context: context,
                    message: 'Please fill any of the fields',
                    type: AnimatedSnackBarType.warning,
                  );
                }
              },
              backgroundColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
