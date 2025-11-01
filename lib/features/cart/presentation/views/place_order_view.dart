import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/widgets/custom_icon_back.dart';
import 'package:bookia/features/cart/domain/repos/cart_repo.dart';
import 'package:bookia/features/cart/presentation/manager/cubit/checkout_cubit.dart';
import 'package:bookia/features/cart/presentation/widgets/place_order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderView extends StatelessWidget {
  const PlaceOrderView({super.key, required this.totalPrice});

  final dynamic totalPrice;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(cartRepo: getIt<CartRepo>()),
      child: Scaffold(
        appBar: CustomIconBack(),
        body: PlaceOrderViewBody(totalPrice: totalPrice),
      ),
    );
  }
}
