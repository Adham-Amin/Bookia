import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/cart/domain/entities/cart_entity.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cart});

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) =>
                CartItem(book: cart.cartItems[index]),
            separatorBuilder: (context, index) =>
                Divider(height: 32.h, color: AppColors.grey),
            itemCount: cart.cartItems.length,
          ),
        ),
        HeightBox(16),
        Row(
          children: [
            Text(
              'Total:',
              style: AppStyles.textRegular20.copyWith(color: AppColors.grey),
            ),
            Spacer(),
            Text('\$ ${cart.totalPrice}', style: AppStyles.textRegular20),
          ],
        ),
        HeightBox(16),
        CustomButton(
          onTap: () {},
          title: 'Checkout',
          backgroundColor: AppColors.primary,
        ),
        HeightBox(16),
      ],
    );
  }
}
