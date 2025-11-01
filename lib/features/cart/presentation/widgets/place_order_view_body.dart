import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/services/shared_preferences_service.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/custom_snack_bar.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/core/widgets/show_loading.dart';
import 'package:bookia/features/cart/data/model/request/place_order_request.dart';
import 'package:bookia/features/cart/presentation/manager/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceOrderViewBody extends StatefulWidget {
  const PlaceOrderViewBody({super.key, required this.totalPrice});

  final dynamic totalPrice;

  @override
  State<PlaceOrderViewBody> createState() => _PlaceOrderViewBodyState();
}

class _PlaceOrderViewBodyState extends State<PlaceOrderViewBody> {
  late TextEditingController nameController,
      emailController,
      addressController,
      phoneController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();

    var user = Prefs.getUser();
    nameController.text = user?.name ?? '';
    emailController.text = user?.email ?? '';
    addressController.text = user?.address ?? '';
    phoneController.text = user?.phone ?? '';
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeightBox(32),
              Text('Place Your Order', style: AppStyles.textRegular30),
              HeightBox(16),
              Text(
                'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
              ),
              HeightBox(32),
              CustomTextFormField(
                hintText: 'Name',
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              HeightBox(16),
              CustomTextFormField(
                hintText: 'Email',
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              HeightBox(16),
              CustomTextFormField(
                hintText: 'Address',
                controller: addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              HeightBox(16),
              CustomTextFormField(
                hintText: 'Phone Number',
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              HeightBox(32),
              Row(
                children: [
                  Text(
                    'Total:',
                    style: AppStyles.textRegular20.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$ ${widget.totalPrice}',
                    style: AppStyles.textRegular20,
                  ),
                ],
              ),
              HeightBox(16),
              BlocListener<CheckoutCubit, CheckoutState>(
                listener: (context, state) {
                  if (state is ChecoutLoading) {
                    showDialogLoading(context);
                  }
                  if (state is ChecoutError) {
                    Navigator.pop(context);
                    customSnackBar(
                      context: context,
                      message: state.message,
                      type: AnimatedSnackBarType.error,
                    );
                  }
                  if (state is ChecoutSuccess) {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.successView,
                      arguments: {
                        'headerTitle': 'Place Order Success!',
                        'subTitle': 'Your order has been placed successfully.',
                        'buttonTitle': 'Start Shopping',
                        'nextRoute': AppRoutes.mainView,
                      },
                      (route) => false,
                    );
                  }
                },
                child: CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<CheckoutCubit>().placeOrder(
                        placeOrderRequest: PlaceOrderRequest(
                          name: nameController.text,
                          email: emailController.text,
                          address: addressController.text,
                          phone: phoneController.text,
                          governorateId: 14,
                        ),
                      );
                    }
                  },
                  title: 'Place Order',
                  backgroundColor: AppColors.primary,
                ),
              ),
              HeightBox(32),
            ],
          ),
        ),
      ),
    );
  }
}
