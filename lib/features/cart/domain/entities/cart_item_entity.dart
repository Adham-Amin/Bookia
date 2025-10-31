class CartItemEntity {
  final num id;
  final String image;
  final String name;
  final num price;
  final num quantity;
  final num stock;

  CartItemEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.stock,
  });
}
