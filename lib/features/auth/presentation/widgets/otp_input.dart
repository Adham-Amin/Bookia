import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({super.key, this.onChanged});

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 4) {
          return 'Please enter OTP';
        }
        return null;
      },
      length: 4,
      onChanged: onChanged,
      cursorColor: AppColors.primary,
      keyboardType: TextInputType.number,
      textStyle: AppStyles.textRegular20,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 60,
        fieldWidth: 70,
        activeColor: AppColors.primary,
        selectedColor: AppColors.grey,
        inactiveColor: AppColors.border,
      ),
    );
  }
}
