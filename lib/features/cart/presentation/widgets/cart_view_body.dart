import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_empty.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_list.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartSuccess) {
            if (state.cart.cartItems.isEmpty) {
              return const CartEmpty();
            }
            return CartList(cart: state.cart);
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          } else {
            return const CartLoadingUI();
          }
        },
      ),
    );
  }
}
