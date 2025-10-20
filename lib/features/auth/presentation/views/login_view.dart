import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/widgets/custom_icon_back.dart';
import 'package:bookia/core/widgets/custom_rich_text.dart';
import 'package:bookia/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomIconBack(),
      body: const LoginViewBody(),
      bottomNavigationBar: SafeArea(
        child: CustomRichText(
          onTap: () {
            Navigator.pushReplacementNamed(context, AppRoutes.registerView);
          },
          text: 'Don’t have an account?',
          linkText: 'Register Now',
        ),
      ),
    );
  }
}
