import 'package:bookia/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final dynamic totalPrice;
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems, required this.totalPrice});
}
