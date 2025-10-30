import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/profile/data/models/responses/order_response.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final OrderResponse order;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.white : AppColors.darkBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Order#${order.id}',
                style: AppStyles.textRegular20.copyWith(
                  color: isDark ? Colors.black : Colors.white,
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  order.status ?? '',
                  style: AppStyles.textRegular12.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          HeightBox(8),
          Row(
            children: [
              Text(
                'Date: ${order.orderDate ?? ''}',
                style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
              ),
              Spacer(),
              Text(
                'Total: \$${order.total ?? ''}',
                style: AppStyles.textRegular16.copyWith(
                  color: isDark ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
