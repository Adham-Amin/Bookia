import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/profile/data/models/responses/order_response.dart';
import 'package:bookia/features/profile/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingOrders extends StatelessWidget {
  const LoadingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        separatorBuilder: (context, index) => HeightBox(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return OrderItem(
            order: OrderResponse(
              id: 558,
              status: '   ',
              orderDate: '   ',
              total: '    ',
            ),
          );
        },
      ),
    );
  }
}
