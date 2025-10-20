import 'package:bookia/core/widgets/custom_icon_back.dart';
import 'package:bookia/features/auth/presentation/widgets/new_password_view_body.dart';
import 'package:flutter/material.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomIconBack(),
      body: NewPasswordViewBody(),
    );
  }
}
