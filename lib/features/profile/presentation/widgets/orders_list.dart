import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/profile/data/models/responses/order_response.dart';
import 'package:bookia/features/profile/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.orders});

  final List<OrderResponse> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: orders.length,
      separatorBuilder: (context, index) => HeightBox(16),
      itemBuilder: (context, index) {
        return OrderItem(order: orders[index]);
      },
    );
  }
}
