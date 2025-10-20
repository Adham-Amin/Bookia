import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onTap;
  const CustomRichText({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text,
        style: AppStyles.textRegular14.copyWith(color: AppColors.black),
        children: [
          TextSpan(
            text: ' $linkText',
            style: AppStyles.textRegular14.copyWith(color: AppColors.primary),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
