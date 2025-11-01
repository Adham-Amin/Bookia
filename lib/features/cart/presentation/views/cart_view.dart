import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Cart', style: AppStyles.textRegular24),
      ),
      body: CartViewBody(),
    );
  }
}
