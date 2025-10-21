import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/widgets/custom_icon_back.dart';
import 'package:bookia/core/widgets/custom_rich_text.dart';
import 'package:bookia/features/auth/domain/repos/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
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
      ),
    );
  }
}
