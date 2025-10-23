import 'package:bookia/features/home/domain/entities/book_entity.dart';

class BookResponse {
  num? id;
  String? name;
  String? description;
  String? price;
  num? discount;
  double? priceAfterDiscount;
  num? stock;
  num? bestSeller;
  String? image;
  String? category;

  BookResponse({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
    id: json['id'] as num?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    price: json['price'] as String?,
    discount: json['discount'] as num?,
    priceAfterDiscount: (json['price_after_discount'] as num?)?.toDouble(),
    stock: json['stock'] as num?,
    bestSeller: json['best_seller'] as num?,
    image: json['image'] as String?,
    category: json['category'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'discount': discount,
    'price_after_discount': priceAfterDiscount,
    'stock': stock,
    'best_seller': bestSeller,
    'image': image,
    'category': category,
  };

  BookEntity toEntity() => BookEntity(
    id: id ?? 0,
    title: name ?? '',
    description: description ?? '',
    price: price ?? '',
    priceAfterDiscount: priceAfterDiscount ?? 0.0,
    image: image ?? '',
    category: category ?? '',
  );
}
