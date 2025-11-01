import 'package:bookia/core/functions/navigate_to_tab.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonBookDetails extends StatelessWidget {
  const ButtonBookDetails({
    super.key,
    required this.book,
    required this.isDark,
  });

  final BookEntity book;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: Row(
              children: [
                Text('\$ ${book.price}', style: AppStyles.textRegular24),
                WidthBox(24),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    final isInCart =
                        state is CartSuccess &&
                        state.cart.cartItems.any(
                          (element) => element.idProduct == book.id,
                        );
                    if (state is CartLoading) {
                      return Expanded(
                        child: CustomButton(
                          onTap: () {},
                          title: 'Loading...',
                          colortext: isDark ? AppColors.black : AppColors.white,
                          backgroundColor: isDark
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      );
                    }
                    return Expanded(
                      child: CustomButton(
                        onTap: isInCart
                            ? () {
                                navigateToTab(context, 2);
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRoutes.mainView,
                                  (route) => false,
                                );
                              }
                            : () {
                                context.read<CartCubit>().addToCart(
                                  bookId: book.id ?? 0,
                                );
                              },
                        title: isInCart ? 'Go to Cart' : 'Add to Cart',
                        colortext: isDark ? AppColors.black : AppColors.white,
                        backgroundColor: isDark
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
