import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/features/profile/presentation/manager/order_his_cubit/orders_history_cubit.dart';
import 'package:bookia/features/profile/presentation/widgets/loading_orders.dart';
import 'package:bookia/features/profile/presentation/widgets/orders_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: BlocBuilder<OrdersHistoryCubit, OrdersHistoryState>(
        builder: (context, state) {
          if (state is OrdersHistoryLoading) {
            return LoadingOrders();
          } else if (state is OrdersHistorySuccess) {
            return OrdersList(orders: state.orders);
          } else if (state is OrdersHistoryError) {
            return Center(child: Text(state.message));
          } else {
            return Center(
              child: Text('No orders found', style: AppStyles.textRegular16),
            );
          }
        },
      ),
    );
  }
}
