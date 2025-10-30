import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/features/profile/domain/repos/profile_repo.dart';
import 'package:bookia/features/profile/presentation/manager/order_his_cubit/orders_history_cubit.dart';
import 'package:bookia/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:bookia/features/profile/presentation/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrdersHistoryCubit(profileRepo: getIt<ProfileRepo>())
            ..getOrdersHistory(),
      child: Scaffold(
        appBar: customAppBar(context, title: 'My Orders'),
        body: MyOrdersViewBody(),
      ),
    );
  }
}
