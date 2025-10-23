class BookEntity {
  final num? id;
  final String? image;
  final String? title;
  final String? description;
  final String? category;
  final String? price;
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
