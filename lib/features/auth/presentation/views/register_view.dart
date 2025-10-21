import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/widgets/custom_icon_back.dart';
import 'package:bookia/core/widgets/custom_rich_text.dart';
import 'package:bookia/features/auth/domain/repos/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomIconBack(),
        body: const RegisterViewBody(),
        bottomNavigationBar: SafeArea(
          child: CustomRichText(
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.loginView);
            },
            text: 'Already have an account?',
            linkText: 'Login Now',
          ),
        ),
      ),
    );
  }
}
