import 'package:bookia/core/widgets/custom_icon_back.dart';
import 'package:bookia/features/auth/presentation/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomIconBack(),
      body: ForgetPasswordViewBody(),
    );
  }
}
