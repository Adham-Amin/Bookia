import 'package:hive_flutter/hive_flutter.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? category;
  @HiveField(5)
  final String? price;
  @HiveField(6)
  final num? priceAfterDiscount;

  BookEntity({
    this.id = 0,
    this.image = '',
    this.title = '                ',
    this.description = '',
    this.category = '           ',
    this.price = '   ',
    this.priceAfterDiscount = 0,
  });
}
