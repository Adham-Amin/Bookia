import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/custom_snack_bar.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/cart/domain/entities/cart_item_entity.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/widgets/icon_buttom_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.book});

  final CartItemEntity book;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 145.h,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.primary : AppColors.bgLight,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              widget.book.image,
              fit: BoxFit.cover,
              width: 100.h,
              height: 120.h,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image, size: 100.h, color: AppColors.grey),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.book.name,
                  style: AppStyles.textRegular18,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                HeightBox(4),
                Text(
                  '\$ ${widget.book.price.toStringAsFixed(2)}',
                  style: AppStyles.textRegular16.copyWith(
                    color: isDark ? AppColors.white : AppColors.grey,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButtomCart(
                      onTap: () {
                        if (widget.book.quantity > 1) {
                          context.read<CartCubit>().updateCart(
                            bookId: widget.book.id,
                            quantity: --widget.book.quantity,
                          );
                          setState(() {});
                        } else {
                          customSnackBar(
                            context: context,
                            message: 'Can\'t be less than 1',
                            type: AnimatedSnackBarType.warning,
                          );
                        }
                      },
                      icon: Icons.remove,
                    ),
                    WidthBox(8),
                    Text(
                      widget.book.quantity.toString(),
                      style: AppStyles.textRegular14.copyWith(
                        color: isDark ? AppColors.white : AppColors.black,
                      ),
                    ),
                    WidthBox(8),
                    IconButtomCart(
                      onTap: () {
                        if (widget.book.stock > widget.book.quantity) {
                          context.read<CartCubit>().updateCart(
                            bookId: widget.book.id,
                            quantity: ++widget.book.quantity,
                          );
                          setState(() {});
                        } else {
                          customSnackBar(
                            context: context,
                            message: 'Out of stock',
                            type: AnimatedSnackBarType.warning,
                          );
                        }
                      },
                      icon: Icons.add,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().removeFromCart(
                          bookId: widget.book.id,
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        color: isDark ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
