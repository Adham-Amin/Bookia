class CartItemEntity {
  final num id;
  final num idProduct;
  final String image;
  final String name;
  final num price;
  num quantity;
  final num stock;

  CartItemEntity({
    required this.idProduct,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.stock,
  });
}
