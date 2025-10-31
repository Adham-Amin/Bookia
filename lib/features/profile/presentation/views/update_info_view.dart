import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/features/profile/domain/repos/profile_repo.dart';
import 'package:bookia/features/profile/presentation/manager/update_info_cubit/update_info_cubit.dart';
import 'package:bookia/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:bookia/features/profile/presentation/widgets/update_info_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateInfoView extends StatelessWidget {
  const UpdateInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateInfoCubit(profileRepo: getIt<ProfileRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: 'Update Information'),
        body: const UpdateInfoViewBody(),
      ),
    );
  }
}
