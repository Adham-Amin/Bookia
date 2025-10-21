import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/widgets/custom_icon_back.dart';
import 'package:bookia/features/auth/domain/repos/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/widgets/otp_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomIconBack(),
        body: OtpViewBody(email: email),
      ),
    );
  }
}
