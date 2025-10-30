import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/features/profile/domain/repos/profile_repo.dart';
import 'package:bookia/features/profile/presentation/manager/delete_acc_cubit/delete_account_cubit.dart';
import 'package:bookia/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:bookia/features/profile/presentation/widgets/delete_account_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DeleteAccountCubit(profileRepo: getIt<ProfileRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: 'Delete Account'),
        body: const DeleteAccountViewBody(),
      ),
    );
  }
}
