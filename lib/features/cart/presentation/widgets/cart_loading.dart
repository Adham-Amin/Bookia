import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/cart/domain/entities/cart_item_entity.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartLoadingUI extends StatelessWidget {
  const CartLoadingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CartItem(
                book: CartItemEntity(
                  idProduct: 1,
                  id: 2,
                  image:
                      'https://codingarabic.online/storage/slider/D0S7ph0nDeT3va8QssrbSp4qgwYlTxqTufoc8Vvv.jpg',
                  name: 'Harry Potter',
                  price: 100,
                  quantity: 50,
                  stock: 100,
                ),
              ),
              separatorBuilder: (context, index) =>
                  Divider(height: 32.h, color: AppColors.grey),
              itemCount: 3,
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
              Text('\$ ${60.000884}', style: AppStyles.textRegular20),
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
      ),
    );
  }
}
