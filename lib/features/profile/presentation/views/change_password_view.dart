import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/features/profile/domain/repos/profile_repo.dart';
import 'package:bookia/features/profile/presentation/manager/change_pass_cubit/change_password_cubit.dart';
import 'package:bookia/features/profile/presentation/widgets/change_password_view_body.dart';
import 'package:bookia/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChangePasswordCubit(profileRepo: getIt<ProfileRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: 'Change Password'),
        body: const ChangePasswordViewBody(),
      ),
    );
  }
}
